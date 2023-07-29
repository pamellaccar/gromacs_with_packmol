/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 1991- The GROMACS Authors
 * and the project initiators Erik Lindahl, Berk Hess and David van der Spoel.
 * Consult the AUTHORS/COPYING files and https://www.gromacs.org for details.
 *
 * GROMACS is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 2.1
 * of the License, or (at your option) any later version.
 *
 * GROMACS is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GROMACS; if not, see
 * https://www.gnu.org/licenses, or write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA.
 *
 * If you want to redistribute modifications to GROMACS, please
 * consider that scientific software is very special. Version
 * control is crucial - bugs must be traceable. We will be happy to
 * consider code for inclusion in the official distribution, but
 * derived work must not be called official GROMACS. Details are found
 * in the README & COPYING files - if they are missing, get the
 * official version at https://www.gromacs.org.
 *
 * To help us fund GROMACS development, we humbly ask that you cite
 * the research papers on the package. Check out https://www.gromacs.org.
 */
#include "gmxpre.h"

#include "enerdata_utils.h"

#include "gromacs/gmxlib/network.h"
#include "gromacs/mdtypes/commrec.h"
#include "gromacs/mdtypes/enerdata.h"
#include "gromacs/mdtypes/inputrec.h"
#include "gromacs/utility/enumerationhelpers.h"
#include "gromacs/utility/fatalerror.h"
#include "gromacs/utility/smalloc.h"

ForeignLambdaTerms::ForeignLambdaTerms(int numLambdas) :
    numLambdas_(numLambdas), energies_(1 + numLambdas), dhdl_(1 + numLambdas)
{
}

std::pair<std::vector<double>, std::vector<double>> ForeignLambdaTerms::getTerms(const t_commrec* cr) const
{
    GMX_RELEASE_ASSERT(finalizedPotentialContributions_,
                       "The object needs to be finalized before calling getTerms");

    std::vector<double> data(2 * numLambdas_);
    for (int i = 0; i < numLambdas_; i++)
    {
        data[i]               = energies_[1 + i] - energies_[0];
        data[numLambdas_ + i] = dhdl_[1 + i];
    }
    if (cr && cr->nnodes > 1)
    {
        gmx_sumd(data.size(), data.data(), cr);
    }
    auto dataMid = data.begin() + numLambdas_;

    return { { data.begin(), dataMid }, { dataMid, data.end() } };
}

void ForeignLambdaTerms::zeroAllTerms()
{
    std::fill(energies_.begin(), energies_.end(), 0.0);
    std::fill(dhdl_.begin(), dhdl_.end(), 0.0);
    finalizedPotentialContributions_ = false;
}

gmx_enerdata_t::gmx_enerdata_t(int numEnergyGroups, int numFepLambdas) :
    grpp(numEnergyGroups), foreignLambdaTerms(numFepLambdas)
{
}

static real sum_v(int n, gmx::ArrayRef<const real> v)
{
    real t;
    int  i;

    t = 0.0;
    for (i = 0; (i < n); i++)
    {
        t = t + v[i];
    }

    return t;
}

void sum_epot(const gmx_grppairener_t& grpp, real* epot)
{
    int i;

    /* Accumulate energies */
    epot[F_COUL_SR] = sum_v(grpp.nener, grpp.energyGroupPairTerms[NonBondedEnergyTerms::CoulombSR]);
    epot[F_LJ]      = sum_v(grpp.nener, grpp.energyGroupPairTerms[NonBondedEnergyTerms::LJSR]);
    epot[F_LJ14]    = sum_v(grpp.nener, grpp.energyGroupPairTerms[NonBondedEnergyTerms::LJ14]);
    epot[F_COUL14]  = sum_v(grpp.nener, grpp.energyGroupPairTerms[NonBondedEnergyTerms::Coulomb14]);

    /* lattice part of LR doesnt belong to any group
     * and has been added earlier
     */
    epot[F_BHAM] = sum_v(grpp.nener, grpp.energyGroupPairTerms[NonBondedEnergyTerms::BuckinghamSR]);

    epot[F_EPOT] = 0;
    for (i = 0; (i < F_EPOT); i++)
    {
        if (i != F_DISRESVIOL && i != F_ORIRESDEV)
        {
            epot[F_EPOT] += epot[i];
        }
    }
}

// Adds computed dH/dlambda contribution i to the requested output
static void set_dhdl_output(gmx_enerdata_t* enerd, FreeEnergyPerturbationCouplingType i, const t_lambda& fepvals)
{
    if (fepvals.separate_dvdl[i])
    {
        /* Translate free-energy term indices to idef term indices.
         * Could this be done more readably/compactly?
         */
        int index;
        switch (i)
        {
            case (FreeEnergyPerturbationCouplingType::Mass): index = F_DKDL; break;
            case (FreeEnergyPerturbationCouplingType::Coul): index = F_DVDL_COUL; break;
            case (FreeEnergyPerturbationCouplingType::Vdw): index = F_DVDL_VDW; break;
            case (FreeEnergyPerturbationCouplingType::Bonded): index = F_DVDL_BONDED; break;
            case (FreeEnergyPerturbationCouplingType::Restraint): index = F_DVDL_RESTRAINT; break;
            default: index = F_DVDL; break;
        }
        enerd->term[index] = enerd->dvdl_lin[i] + enerd->dvdl_nonlin[i];
        if (debug)
        {
            fprintf(debug,
                    "dvdl-%s[%2d]: %f: non-linear %f + linear %f\n",
                    enumValueToString(i),
                    static_cast<int>(i),
                    enerd->term[index],
                    enerd->dvdl_nonlin[i],
                    enerd->dvdl_lin[i]);
        }
    }
    else
    {
        enerd->term[F_DVDL] += enerd->dvdl_lin[i] + enerd->dvdl_nonlin[i];
        if (debug)
        {
            fprintf(debug,
                    "dvd-%sl[%2d]: %f: non-linear %f + linear %f\n",
                    enumValueToString(FreeEnergyPerturbationCouplingType::Fep),
                    static_cast<int>(i),
                    enerd->term[F_DVDL],
                    enerd->dvdl_nonlin[i],
                    enerd->dvdl_lin[i]);
        }
    }
}

void ForeignLambdaTerms::addConstantDhdl(const double dhdl)
{
    for (double& foreignDhdl : dhdl_)
    {
        foreignDhdl += dhdl;
    }
}

void ForeignLambdaTerms::finalizePotentialContributions(gmx::ArrayRef<const double> dvdlLinear,
                                                        gmx::ArrayRef<const real>   lambda,
                                                        const t_lambda&             fepvals)
{
    if (finalizedPotentialContributions_)
    {
        return;
    }

    double dvdl_lin = 0;
    for (int i = 0; i < static_cast<int>(FreeEnergyPerturbationCouplingType::Count); i++)
    {
        dvdl_lin += dvdlLinear[i];
    }
    addConstantDhdl(dvdl_lin);

    /* Sum the foreign lambda energy difference contributions.
     * Note that here we only add the potential energy components.
     * The constraint and kinetic energy components are add after integration
     * by sum_dhdl().
     */
    for (int i = 0; i < fepvals.n_lambda; i++)
    {
        /* note we are iterating over fepvals here!
           For the current lam, dlam = 0 automatically,
           so we don't need to add anything to the
           enerd->enerpart_lambda[0] */

        /* we don't need to worry about dvdl_lin contributions to dE at
           current lambda, because the contributions to the current
           lambda are automatically zeroed */

        double enerpart_lambda = 0;
        for (gmx::index j = 0; j < lambda.ssize(); j++)
        {
            /* Note that this loop is over all dhdl components, not just the separated ones */
            const double dlam = fepvals.all_lambda[j][i] - lambda[j];

            enerpart_lambda += dlam * dvdlLinear[j];
        }
        accumulate(1 + i, enerpart_lambda, 0);
    }

    finalizedPotentialContributions_ = true;
}

void accumulatePotentialEnergies(gmx_enerdata_t* enerd, gmx::ArrayRef<const real> lambda, const t_lambda* fepvals)
{
    sum_epot(enerd->grpp, enerd->term.data());

    if (fepvals)
    {
        enerd->term[F_DVDL] = 0.0;
        for (auto i : gmx::EnumerationWrapper<FreeEnergyPerturbationCouplingType>{})
        {
            // Skip kinetic terms here, as those are not available here yet
            if (i != FreeEnergyPerturbationCouplingType::Mass)
            {
                set_dhdl_output(enerd, i, *fepvals);
            }
        }

        enerd->foreignLambdaTerms.finalizePotentialContributions(enerd->dvdl_lin, lambda, *fepvals);
    }
}

void ForeignLambdaTerms::accumulateKinetic(int listIndex, double energy, double dhdl)
{
    energies_[listIndex] += energy;
    dhdl_[listIndex] += dhdl;
}

void ForeignLambdaTerms::finalizeKineticContributions(gmx::ArrayRef<const real> energyTerms,
                                                      const double              dhdlMass,
                                                      gmx::ArrayRef<const real> lambda,
                                                      const t_lambda&           fepvals)
{
    // Add perturbed mass contributions
    addConstantDhdl(dhdlMass);

    // Treat current lambda, the deltaH contribution is 0 as delta-lambda=0 for the current lambda
    accumulateKinetic(0, 0.0, energyTerms[F_DVDL_CONSTR]);
    if (!fepvals.separate_dvdl[FreeEnergyPerturbationCouplingType::Mass])
    {
        accumulateKinetic(0, 0.0, energyTerms[F_DKDL]);
    }

    for (int i = 0; i < fepvals.n_lambda; i++)
    {
        /* Note that potential energy terms have been added by sum_epot() -> sum_dvdl() */

        /* Constraints can not be evaluated at foreign lambdas, so we add
         * a linear extrapolation. This is an approximation, but usually
         * quite accurate since constraints change little between lambdas.
         */
        const FreeEnergyPerturbationCouplingType lambdaIndex =
                (fepvals.separate_dvdl[FreeEnergyPerturbationCouplingType::Bonded]
                         ? FreeEnergyPerturbationCouplingType::Bonded
                         : FreeEnergyPerturbationCouplingType::Fep);
        const double dlam = fepvals.all_lambda[lambdaIndex][i] - lambda[static_cast<int>(lambdaIndex)];
        accumulateKinetic(1 + i, dlam * energyTerms[F_DVDL_CONSTR], energyTerms[F_DVDL_CONSTR]);

        if (!fepvals.separate_dvdl[FreeEnergyPerturbationCouplingType::Mass])
        {
            const double dlam = fepvals.all_lambda[FreeEnergyPerturbationCouplingType::Mass][i]
                                - lambda[static_cast<int>(FreeEnergyPerturbationCouplingType::Mass)];
            accumulateKinetic(1 + i, dlam * energyTerms[F_DKDL], energyTerms[F_DKDL]);
        }
    }
}

void accumulateKineticLambdaComponents(gmx_enerdata_t*           enerd,
                                       gmx::ArrayRef<const real> lambda,
                                       const t_lambda&           fepvals)
{
    if (fepvals.separate_dvdl[FreeEnergyPerturbationCouplingType::Bonded])
    {
        enerd->term[F_DVDL_BONDED] += enerd->term[F_DVDL_CONSTR];
    }
    else
    {
        enerd->term[F_DVDL] += enerd->term[F_DVDL_CONSTR];
    }

    // Add computed mass dH/dlambda contribution to the requested output
    set_dhdl_output(enerd, FreeEnergyPerturbationCouplingType::Mass, fepvals);

    enerd->foreignLambdaTerms.finalizeKineticContributions(
            enerd->term, enerd->dvdl_lin[FreeEnergyPerturbationCouplingType::Mass], lambda, fepvals);

    /* The constrain contribution is now included in other terms, so clear it */
    enerd->term[F_DVDL_CONSTR] = 0;
}

void gmx_grppairener_t::clear()
{
    for (int i = 0; (i < static_cast<int>(NonBondedEnergyTerms::Count)); i++)
    {
        for (int j = 0; (j < nener); j++)
        {
            energyGroupPairTerms[i][j] = 0.0;
        }
    }
}

void reset_dvdl_enerdata(gmx_enerdata_t* enerd)
{
    for (auto i : keysOf(enerd->dvdl_lin))
    {
        enerd->dvdl_lin[i]    = 0.0;
        enerd->dvdl_nonlin[i] = 0.0;
    }
}

void reset_enerdata(gmx_enerdata_t* enerd)
{
    int i, j;

    /* First reset all energy components. */
    for (i = 0; (i < static_cast<int>(NonBondedEnergyTerms::Count)); i++)
    {
        for (j = 0; (j < enerd->grpp.nener); j++)
        {
            enerd->grpp.energyGroupPairTerms[i][j] = 0.0_real;
        }
    }

    /* Normal potential energy components */
    for (i = 0; (i <= F_EPOT); i++)
    {
        enerd->term[i] = 0.0_real;
    }
    enerd->term[F_PDISPCORR]      = 0.0_real;
    enerd->term[F_DVDL]           = 0.0_real;
    enerd->term[F_DVDL_COUL]      = 0.0_real;
    enerd->term[F_DVDL_VDW]       = 0.0_real;
    enerd->term[F_DVDL_BONDED]    = 0.0_real;
    enerd->term[F_DVDL_RESTRAINT] = 0.0_real;
    enerd->term[F_DKDL]           = 0.0_real;
    enerd->foreignLambdaTerms.zeroAllTerms();
    /* reset dvdl - separate function since it is also called elsewhere */
    reset_dvdl_enerdata(enerd);
}
