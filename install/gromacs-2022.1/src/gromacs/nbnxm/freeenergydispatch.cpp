/*
 * This file is part of the GROMACS molecular simulation package.
 *
 * Copyright 2021- The GROMACS Authors
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

#include "freeenergydispatch.h"

#include "gromacs/gmxlib/nrnb.h"
#include "gromacs/gmxlib/nonbonded/nb_free_energy.h"
#include "gromacs/gmxlib/nonbonded/nonbonded.h"
#include "gromacs/math/vectypes.h"
#include "gromacs/mdlib/enerdata_utils.h"
#include "gromacs/mdlib/force.h"
#include "gromacs/mdlib/gmx_omp_nthreads.h"
#include "gromacs/mdtypes/enerdata.h"
#include "gromacs/mdtypes/forceoutput.h"
#include "gromacs/mdtypes/inputrec.h"
#include "gromacs/mdtypes/interaction_const.h"
#include "gromacs/mdtypes/md_enums.h"
#include "gromacs/mdtypes/nblist.h"
#include "gromacs/mdtypes/simulation_workload.h"
#include "gromacs/mdtypes/threaded_force_buffer.h"
#include "gromacs/nbnxm/nbnxm.h"
#include "gromacs/timing/wallcycle.h"
#include "gromacs/utility/enumerationhelpers.h"
#include "gromacs/utility/gmxassert.h"
#include "gromacs/utility/real.h"

#include "pairlistset.h"
#include "pairlistsets.h"

FreeEnergyDispatch::FreeEnergyDispatch(const int numEnergyGroups) :
    foreignGroupPairEnergies_(numEnergyGroups),
    threadedForceBuffer_(gmx_omp_nthreads_get(ModuleMultiThread::Nonbonded), false, numEnergyGroups),
    threadedForeignEnergyBuffer_(gmx_omp_nthreads_get(ModuleMultiThread::Nonbonded), false, numEnergyGroups)
{
}

namespace
{

//! Flags all atoms present in pairlist \p nlist in the mask in \p threadForceBuffer
void setReductionMaskFromFepPairlist(const t_nblist& gmx_restrict       nlist,
                                     gmx::ThreadForceBuffer<gmx::RVec>* threadForceBuffer)
{
    // Extract pair list data
    gmx::ArrayRef<const int> iinr = nlist.iinr;
    gmx::ArrayRef<const int> jjnr = nlist.jjnr;

    for (int i : iinr)
    {
        threadForceBuffer->addAtomToMask(i);
    }
    for (int j : jjnr)
    {
        threadForceBuffer->addAtomToMask(j);
    }
}

} // namespace

void FreeEnergyDispatch::setupFepThreadedForceBuffer(const int numAtomsForce, const PairlistSets& pairlistSets)
{
    const int numThreads = threadedForceBuffer_.numThreadBuffers();

    GMX_ASSERT(gmx_omp_nthreads_get(ModuleMultiThread::Nonbonded) == numThreads,
               "The number of buffers should be same as number of NB threads");

#pragma omp parallel for num_threads(numThreads) schedule(static)
    for (int th = 0; th < numThreads; th++)
    {
        auto& threadForceBuffer = threadedForceBuffer_.threadForceBuffer(th);

        threadForceBuffer.resizeBufferAndClearMask(numAtomsForce);

        setReductionMaskFromFepPairlist(
                *pairlistSets.pairlistSet(gmx::InteractionLocality::Local).fepLists()[th],
                &threadForceBuffer);
        if (pairlistSets.params().haveMultipleDomains)
        {
            setReductionMaskFromFepPairlist(
                    *pairlistSets.pairlistSet(gmx::InteractionLocality::NonLocal).fepLists()[th],
                    &threadForceBuffer);
        }

        threadForceBuffer.processMask();
    }

    threadedForceBuffer_.setupReduction();
}

void nonbonded_verlet_t::setupFepThreadedForceBuffer(const int numAtomsForce)
{
    if (!pairlistSets_->params().haveFep)
    {
        return;
    }

    GMX_RELEASE_ASSERT(freeEnergyDispatch_, "Need a valid dispatch object");

    freeEnergyDispatch_->setupFepThreadedForceBuffer(numAtomsForce, *pairlistSets_);
}

namespace
{

void dispatchFreeEnergyKernel(gmx::ArrayRef<const std::unique_ptr<t_nblist>>   nbl_fep,
                              const gmx::ArrayRefWithPadding<const gmx::RVec>& coords,
                              bool                                             useSimd,
                              int                                              ntype,
                              real                                             rlist,
                              real                                 maxAllowedCutoffSquared,
                              const interaction_const_t&           ic,
                              gmx::ArrayRef<const gmx::RVec>       shiftvec,
                              gmx::ArrayRef<const real>            nbfp,
                              gmx::ArrayRef<const real>            nbfp_grid,
                              gmx::ArrayRef<const real>            chargeA,
                              gmx::ArrayRef<const real>            chargeB,
                              gmx::ArrayRef<const int>             typeA,
                              gmx::ArrayRef<const int>             typeB,
                              t_lambda*                            fepvals,
                              gmx::ArrayRef<const real>            lambda,
                              const bool                           clearForcesAndEnergies,
                              gmx::ThreadedForceBuffer<gmx::RVec>* threadedForceBuffer,
                              gmx::ThreadedForceBuffer<gmx::RVec>* threadedForeignEnergyBuffer,
                              gmx_grppairener_t*                   foreignGroupPairEnergies,
                              gmx_enerdata_t*                      enerd,
                              const gmx::StepWorkload&             stepWork,
                              t_nrnb*                              nrnb)
{
    int donb_flags = 0;
    /* Add short-range interactions */
    donb_flags |= GMX_NONBONDED_DO_SR;

    if (stepWork.computeForces)
    {
        donb_flags |= GMX_NONBONDED_DO_FORCE;
    }
    if (stepWork.computeVirial)
    {
        donb_flags |= GMX_NONBONDED_DO_SHIFTFORCE;
    }
    if (stepWork.computeEnergy)
    {
        donb_flags |= GMX_NONBONDED_DO_POTENTIAL;
    }

    GMX_ASSERT(gmx_omp_nthreads_get(ModuleMultiThread::Nonbonded) == nbl_fep.ssize(),
               "Number of lists should be same as number of NB threads");

#pragma omp parallel for schedule(static) num_threads(nbl_fep.ssize())
    for (gmx::index th = 0; th < nbl_fep.ssize(); th++)
    {
        try
        {
            auto& threadForceBuffer = threadedForceBuffer->threadForceBuffer(th);

            if (clearForcesAndEnergies)
            {
                threadForceBuffer.clearForcesAndEnergies();
            }

            auto  threadForces           = threadForceBuffer.forceBufferWithPadding();
            rvec* threadForceShiftBuffer = as_rvec_array(threadForceBuffer.shiftForces().data());
            gmx::ArrayRef<real> threadVc =
                    threadForceBuffer.groupPairEnergies().energyGroupPairTerms[NonBondedEnergyTerms::CoulombSR];
            gmx::ArrayRef<real> threadVv =
                    threadForceBuffer.groupPairEnergies().energyGroupPairTerms[NonBondedEnergyTerms::LJSR];
            gmx::ArrayRef<real> threadDvdl = threadForceBuffer.dvdl();

            gmx_nb_free_energy_kernel(*nbl_fep[th],
                                      coords,
                                      useSimd,
                                      ntype,
                                      rlist,
                                      maxAllowedCutoffSquared,
                                      ic,
                                      shiftvec,
                                      nbfp,
                                      nbfp_grid,
                                      chargeA,
                                      chargeB,
                                      typeA,
                                      typeB,
                                      donb_flags,
                                      lambda,
                                      nrnb,
                                      threadForces,
                                      threadForceShiftBuffer,
                                      threadVc,
                                      threadVv,
                                      threadDvdl);
        }
        GMX_CATCH_ALL_AND_EXIT_WITH_FATAL_ERROR
    }

    /* If we do foreign lambda and we have soft-core interactions
     * we have to recalculate the (non-linear) energies contributions.
     */
    if (fepvals->n_lambda > 0 && stepWork.computeDhdl && fepvals->sc_alpha != 0)
    {
        gmx::StepWorkload stepWorkForeignEnergies = stepWork;
        stepWorkForeignEnergies.computeForces     = false;
        stepWorkForeignEnergies.computeVirial     = false;

        gmx::EnumerationArray<FreeEnergyPerturbationCouplingType, real> lam_i;
        gmx::EnumerationArray<FreeEnergyPerturbationCouplingType, real> dvdl_nb = { 0 };
        const int kernelFlags = (donb_flags & ~(GMX_NONBONDED_DO_FORCE | GMX_NONBONDED_DO_SHIFTFORCE))
                                | GMX_NONBONDED_DO_FOREIGNLAMBDA;

        for (gmx::index i = 0; i < 1 + enerd->foreignLambdaTerms.numLambdas(); i++)
        {
            std::fill(std::begin(dvdl_nb), std::end(dvdl_nb), 0);
            for (int j = 0; j < static_cast<int>(FreeEnergyPerturbationCouplingType::Count); j++)
            {
                lam_i[j] = (i == 0 ? lambda[j] : fepvals->all_lambda[j][i - 1]);
            }

#pragma omp parallel for schedule(static) num_threads(nbl_fep.ssize())
            for (gmx::index th = 0; th < nbl_fep.ssize(); th++)
            {
                try
                {
                    // Note that here we only compute energies and dV/dlambda, but we need
                    // to pass a force buffer. No forces are compute and stored.
                    auto& threadForeignEnergyBuffer = threadedForeignEnergyBuffer->threadForceBuffer(th);

                    threadForeignEnergyBuffer.clearForcesAndEnergies();

                    gmx::ArrayRef<real> threadVc =
                            threadForeignEnergyBuffer.groupPairEnergies()
                                    .energyGroupPairTerms[NonBondedEnergyTerms::CoulombSR];
                    gmx::ArrayRef<real> threadVv =
                            threadForeignEnergyBuffer.groupPairEnergies()
                                    .energyGroupPairTerms[NonBondedEnergyTerms::LJSR];
                    gmx::ArrayRef<real> threadDvdl = threadForeignEnergyBuffer.dvdl();

                    gmx_nb_free_energy_kernel(*nbl_fep[th],
                                              coords,
                                              useSimd,
                                              ntype,
                                              rlist,
                                              maxAllowedCutoffSquared,
                                              ic,
                                              shiftvec,
                                              nbfp,
                                              nbfp_grid,
                                              chargeA,
                                              chargeB,
                                              typeA,
                                              typeB,
                                              kernelFlags,
                                              lam_i,
                                              nrnb,
                                              gmx::ArrayRefWithPadding<gmx::RVec>(),
                                              nullptr,
                                              threadVc,
                                              threadVv,
                                              threadDvdl);
                }
                GMX_CATCH_ALL_AND_EXIT_WITH_FATAL_ERROR
            }

            foreignGroupPairEnergies->clear();
            threadedForeignEnergyBuffer->reduce(
                    nullptr, nullptr, foreignGroupPairEnergies, dvdl_nb, stepWorkForeignEnergies, 0);

            std::array<real, F_NRE> foreign_term = { 0 };
            sum_epot(*foreignGroupPairEnergies, foreign_term.data());
            // Accumulate the foreign energy difference and dV/dlambda into the passed enerd
            enerd->foreignLambdaTerms.accumulate(
                    i,
                    foreign_term[F_EPOT],
                    dvdl_nb[FreeEnergyPerturbationCouplingType::Vdw]
                            + dvdl_nb[FreeEnergyPerturbationCouplingType::Coul]);
        }
    }
}

} // namespace

void FreeEnergyDispatch::dispatchFreeEnergyKernels(const PairlistSets& pairlistSets,
                                                   const gmx::ArrayRefWithPadding<const gmx::RVec>& coords,
                                                   gmx::ForceWithShiftForces* forceWithShiftForces,
                                                   const bool                 useSimd,
                                                   const int                  ntype,
                                                   const real                 rlist,
                                                   const real maxAllowedCutoffSquared,
                                                   const interaction_const_t&     ic,
                                                   gmx::ArrayRef<const gmx::RVec> shiftvec,
                                                   gmx::ArrayRef<const real>      nbfp,
                                                   gmx::ArrayRef<const real>      nbfp_grid,
                                                   gmx::ArrayRef<const real>      chargeA,
                                                   gmx::ArrayRef<const real>      chargeB,
                                                   gmx::ArrayRef<const int>       typeA,
                                                   gmx::ArrayRef<const int>       typeB,
                                                   t_lambda*                      fepvals,
                                                   gmx::ArrayRef<const real>      lambda,
                                                   gmx_enerdata_t*                enerd,
                                                   const gmx::StepWorkload&       stepWork,
                                                   t_nrnb*                        nrnb,
                                                   gmx_wallcycle*                 wcycle)
{
    GMX_ASSERT(pairlistSets.params().haveFep, "We should have a free-energy pairlist");

    wallcycle_sub_start(wcycle, WallCycleSubCounter::NonbondedFep);

    const int numLocalities = (pairlistSets.params().haveMultipleDomains ? 2 : 1);
    // The first call to dispatchFreeEnergyKernel() should clear the buffers. Clearing happens
    // inside that function to avoid an extra OpenMP parallel region here. We need a boolean
    // to track the need for clearing.
    // A better solution would be to move the OpenMP parallel region here, but that first
    // requires modifying ThreadedForceBuffer.reduce() to be called thread parallel.
    bool clearForcesAndEnergies = true;
    for (int i = 0; i < numLocalities; i++)
    {
        const gmx::InteractionLocality iLocality = static_cast<gmx::InteractionLocality>(i);
        const auto fepPairlists                  = pairlistSets.pairlistSet(iLocality).fepLists();
        /* When the first list is empty, all are empty and there is nothing to do */
        if (fepPairlists[0]->nrj > 0)
        {
            dispatchFreeEnergyKernel(fepPairlists,
                                     coords,
                                     useSimd,
                                     ntype,
                                     rlist,
                                     maxAllowedCutoffSquared,
                                     ic,
                                     shiftvec,
                                     nbfp,
                                     nbfp_grid,
                                     chargeA,
                                     chargeB,
                                     typeA,
                                     typeB,
                                     fepvals,
                                     lambda,
                                     clearForcesAndEnergies,
                                     &threadedForceBuffer_,
                                     &threadedForeignEnergyBuffer_,
                                     &foreignGroupPairEnergies_,
                                     enerd,
                                     stepWork,
                                     nrnb);
        }
        else if (clearForcesAndEnergies)
        {
            // We need to clear the thread force buffer.
            // With a non-empty pairlist we do this in dispatchFreeEnergyKernel()
            // to avoid the overhead of an extra openMP parallel loop
#pragma omp parallel for schedule(static) num_threads(fepPairlists.ssize())
            for (gmx::index th = 0; th < fepPairlists.ssize(); th++)
            {
                try
                {
                    threadedForceBuffer_.threadForceBuffer(th).clearForcesAndEnergies();
                }
                GMX_CATCH_ALL_AND_EXIT_WITH_FATAL_ERROR
            }
        }
        clearForcesAndEnergies = false;
    }
    wallcycle_sub_stop(wcycle, WallCycleSubCounter::NonbondedFep);

    wallcycle_sub_start(wcycle, WallCycleSubCounter::NonbondedFepReduction);

    gmx::EnumerationArray<FreeEnergyPerturbationCouplingType, real> dvdl_nb = { 0 };

    threadedForceBuffer_.reduce(forceWithShiftForces, nullptr, &enerd->grpp, dvdl_nb, stepWork, 0);

    if (fepvals->sc_alpha != 0)
    {
        enerd->dvdl_nonlin[FreeEnergyPerturbationCouplingType::Vdw] +=
                dvdl_nb[FreeEnergyPerturbationCouplingType::Vdw];
        enerd->dvdl_nonlin[FreeEnergyPerturbationCouplingType::Coul] +=
                dvdl_nb[FreeEnergyPerturbationCouplingType::Coul];
    }
    else
    {
        enerd->dvdl_lin[FreeEnergyPerturbationCouplingType::Vdw] +=
                dvdl_nb[FreeEnergyPerturbationCouplingType::Vdw];
        enerd->dvdl_lin[FreeEnergyPerturbationCouplingType::Coul] +=
                dvdl_nb[FreeEnergyPerturbationCouplingType::Coul];
    }

    wallcycle_sub_stop(wcycle, WallCycleSubCounter::NonbondedFepReduction);
}

void nonbonded_verlet_t::dispatchFreeEnergyKernels(const gmx::ArrayRefWithPadding<const gmx::RVec>& coords,
                                                   gmx::ForceWithShiftForces* forceWithShiftForces,
                                                   const bool                 useSimd,
                                                   const int                  ntype,
                                                   const real                 rlist,
                                                   const real maxAllowedCutoffSquared,
                                                   const interaction_const_t&     ic,
                                                   gmx::ArrayRef<const gmx::RVec> shiftvec,
                                                   gmx::ArrayRef<const real>      nbfp,
                                                   gmx::ArrayRef<const real>      nbfp_grid,
                                                   gmx::ArrayRef<const real>      chargeA,
                                                   gmx::ArrayRef<const real>      chargeB,
                                                   gmx::ArrayRef<const int>       typeA,
                                                   gmx::ArrayRef<const int>       typeB,
                                                   t_lambda*                      fepvals,
                                                   gmx::ArrayRef<const real>      lambda,
                                                   gmx_enerdata_t*                enerd,
                                                   const gmx::StepWorkload&       stepWork,
                                                   t_nrnb*                        nrnb)
{
    if (!pairlistSets_->params().haveFep)
    {
        return;
    }

    GMX_RELEASE_ASSERT(freeEnergyDispatch_, "Need a valid dispatch object");

    freeEnergyDispatch_->dispatchFreeEnergyKernels(*pairlistSets_,
                                                   coords,
                                                   forceWithShiftForces,
                                                   useSimd,
                                                   ntype,
                                                   rlist,
                                                   maxAllowedCutoffSquared,
                                                   ic,
                                                   shiftvec,
                                                   nbfp,
                                                   nbfp_grid,
                                                   chargeA,
                                                   chargeB,
                                                   typeA,
                                                   typeB,
                                                   fepvals,
                                                   lambda,
                                                   enerd,
                                                   stepWork,
                                                   nrnb,
                                                   wcycle_);
}
