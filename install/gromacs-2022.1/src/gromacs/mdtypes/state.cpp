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
/* This file is completely threadsafe - keep it that way! */
#include "gmxpre.h"

#include "state.h"

#include <cstring>

#include <algorithm>

#include "gromacs/math/paddedvector.h"
#include "gromacs/math/vec.h"
#include "gromacs/math/veccompare.h"
#include "gromacs/mdtypes/awh_history.h"
#include "gromacs/mdtypes/df_history.h"
#include "gromacs/mdtypes/inputrec.h"
#include "gromacs/mdtypes/md_enums.h"
#include "gromacs/mdtypes/pull_params.h"
#include "gromacs/mdtypes/swaphistory.h"
#include "gromacs/pbcutil/boxutilities.h"
#include "gromacs/pbcutil/pbc.h"
#include "gromacs/utility/compare.h"
#include "gromacs/utility/gmxassert.h"
#include "gromacs/utility/smalloc.h"
#include "gromacs/utility/stringutil.h"

#include "checkpointdata.h"

/* The source code in this file should be thread-safe.
      Please keep it that way. */

history_t::history_t() : disre_initf(0), orire_initf(0) {}

ekinstate_t::ekinstate_t() :
    bUpToDate(FALSE),
    ekin_n(0),
    ekinh(nullptr),
    ekinf(nullptr),
    ekinh_old(nullptr),
    ekin_total(),

    dekindl(0),
    mvcos(0)
{
    clear_mat(ekin_total);
}

namespace
{
/*!
 * \brief Enum describing the contents ekinstate_t writes to modular checkpoint
 *
 * When changing the checkpoint content, add a new element just above Count, and adjust the
 * checkpoint functionality.
 */
enum class CheckpointVersion
{
    Base, //!< First version of modular checkpointing
    Count //!< Number of entries. Add new versions right above this!
};
constexpr auto c_currentVersion = CheckpointVersion(int(CheckpointVersion::Count) - 1);
} // namespace

template<gmx::CheckpointDataOperation operation>
void ekinstate_t::doCheckpoint(gmx::CheckpointData<operation> checkpointData)
{
    gmx::checkpointVersion(&checkpointData, "ekinstate_t version", c_currentVersion);

    checkpointData.scalar("bUpToDate", &bUpToDate);
    if (!bUpToDate)
    {
        return;
    }
    auto numOfTensors = ekin_n;
    checkpointData.scalar("ekin_n", &numOfTensors);
    if (operation == gmx::CheckpointDataOperation::Read)
    {
        // If this isn't matching, we haven't allocated the right amount of data
        GMX_RELEASE_ASSERT(numOfTensors == ekin_n,
                           "ekinstate_t checkpoint reading: Tensor size mismatch.");
    }
    for (int idx = 0; idx < numOfTensors; ++idx)
    {
        checkpointData.tensor(gmx::formatString("ekinh %d", idx), ekinh[idx]);
        checkpointData.tensor(gmx::formatString("ekinf %d", idx), ekinf[idx]);
        checkpointData.tensor(gmx::formatString("ekinh_old %d", idx), ekinh_old[idx]);
    }
    checkpointData.arrayRef("ekinscalef_nhc", gmx::makeCheckpointArrayRef<operation>(ekinscalef_nhc));
    checkpointData.arrayRef("ekinscaleh_nhc", gmx::makeCheckpointArrayRef<operation>(ekinscaleh_nhc));
    checkpointData.arrayRef("vscale_nhc", gmx::makeCheckpointArrayRef<operation>(vscale_nhc));
    checkpointData.scalar("dekindl", &dekindl);
    checkpointData.scalar("mvcos", &mvcos);

    if (operation == gmx::CheckpointDataOperation::Read)
    {
        hasReadEkinState = true;
    }
}

// Explicit template instantiation
template void ekinstate_t::doCheckpoint(gmx::CheckpointData<gmx::CheckpointDataOperation::Read> checkpointData);
template void ekinstate_t::doCheckpoint(gmx::CheckpointData<gmx::CheckpointDataOperation::Write> checkpointData);

void init_gtc_state(t_state* state, int ngtc, int nnhpres, int nhchainlength)
{
    state->ngtc          = ngtc;
    state->nnhpres       = nnhpres;
    state->nhchainlength = nhchainlength;
    state->nosehoover_xi.resize(state->nhchainlength * state->ngtc, 0);
    state->nosehoover_vxi.resize(state->nhchainlength * state->ngtc, 0);
    state->therm_integral.resize(state->ngtc, 0);
    state->baros_integral = 0.0;
    state->nhpres_xi.resize(state->nhchainlength * nnhpres, 0);
    state->nhpres_vxi.resize(state->nhchainlength * nnhpres, 0);
}


/* Checkpoint code relies on this function having no effect if
   state->natoms is > 0 and passed as natoms. */
void state_change_natoms(t_state* state, int natoms)
{
    state->natoms = natoms;

    /* We need padding, since we might use SIMD access, but the
     * containers here all ensure that. */
    if (state->flags & enumValueToBitMask(StateEntry::X))
    {
        state->x.resizeWithPadding(natoms);
    }
    if (state->flags & enumValueToBitMask(StateEntry::V))
    {
        state->v.resizeWithPadding(natoms);
    }
    if (state->flags & enumValueToBitMask(StateEntry::Cgp))
    {
        state->cg_p.resizeWithPadding(natoms);
    }
}

namespace
{
/*!
 * \brief Enum describing the contents df_history_t writes to modular checkpoint
 *
 * When changing the checkpoint content, add a new element just above Count, and adjust the
 * checkpoint functionality.
 */
enum class DFHistoryCheckpointVersion
{
    Base, //!< First version of modular checkpointing
    Count //!< Number of entries. Add new versions right above this!
};
constexpr auto c_dfHistoryCurrentVersion =
        DFHistoryCheckpointVersion(int(DFHistoryCheckpointVersion::Count) - 1);
} // namespace

template<gmx::CheckpointDataOperation operation>
void df_history_t::doCheckpoint(gmx::CheckpointData<operation> checkpointData, LambdaWeightCalculation elamstats)
{
    gmx::checkpointVersion(&checkpointData, "df_history_t version", c_dfHistoryCurrentVersion);

    auto numLambdas = nlambda;
    checkpointData.scalar("nlambda", &numLambdas);
    if (operation == gmx::CheckpointDataOperation::Read)
    {
        // If this isn't matching, we haven't allocated the right amount of data
        GMX_RELEASE_ASSERT(numLambdas == nlambda,
                           "df_history_t checkpoint reading: Lambda vectors size mismatch.");
    }

    checkpointData.scalar("bEquil", &bEquil);
    checkpointData.arrayRef("n_at_lam", gmx::makeCheckpointArrayRefFromArray<operation>(n_at_lam, nlambda));

    checkpointData.arrayRef("sum_weights",
                            gmx::makeCheckpointArrayRefFromArray<operation>(sum_weights, nlambda));
    checkpointData.arrayRef("sum_dg", gmx::makeCheckpointArrayRefFromArray<operation>(sum_dg, nlambda));
    for (int idx = 0; idx < nlambda; idx++)
    {
        checkpointData.arrayRef(gmx::formatString("Tij[%d]", idx),
                                gmx::makeCheckpointArrayRefFromArray<operation>(Tij[idx], nlambda));
        checkpointData.arrayRef(
                gmx::formatString("Tij_empirical[%d]", idx),
                gmx::makeCheckpointArrayRefFromArray<operation>(Tij_empirical[idx], nlambda));
    }

    if (EWL(elamstats))
    {
        checkpointData.arrayRef("wl_histo",
                                gmx::makeCheckpointArrayRefFromArray<operation>(wl_histo, nlambda));
        checkpointData.scalar("wl_delta", &wl_delta);
    }
    if ((elamstats == LambdaWeightCalculation::Minvar) || (elamstats == LambdaWeightCalculation::Barker)
        || (elamstats == LambdaWeightCalculation::Metropolis))
    {
        checkpointData.arrayRef(
                "sum_minvar", gmx::makeCheckpointArrayRefFromArray<operation>(sum_minvar, nlambda));
        checkpointData.arrayRef("sum_variance",
                                gmx::makeCheckpointArrayRefFromArray<operation>(sum_variance, nlambda));
        for (int idx = 0; idx < nlambda; idx++)
        {
            checkpointData.arrayRef(gmx::formatString("accum_p[%d]", idx),
                                    gmx::makeCheckpointArrayRefFromArray<operation>(accum_p[idx], nlambda));
            checkpointData.arrayRef(gmx::formatString("accum_m[%d]", idx),
                                    gmx::makeCheckpointArrayRefFromArray<operation>(accum_m[idx], nlambda));
            checkpointData.arrayRef(
                    gmx::formatString("accum_p2[%d]", idx),
                    gmx::makeCheckpointArrayRefFromArray<operation>(accum_p2[idx], nlambda));
            checkpointData.arrayRef(
                    gmx::formatString("accum_m2[%d]", idx),
                    gmx::makeCheckpointArrayRefFromArray<operation>(accum_m2[idx], nlambda));
        }
    }
}

// explicit template instantiation
template void df_history_t::doCheckpoint(gmx::CheckpointData<gmx::CheckpointDataOperation::Read> checkpointData,
                                         LambdaWeightCalculation elamstats);
template void df_history_t::doCheckpoint(gmx::CheckpointData<gmx::CheckpointDataOperation::Write> checkpointData,
                                         LambdaWeightCalculation elamstats);

void init_dfhist_state(t_state* state, int dfhistNumLambda)
{
    if (dfhistNumLambda > 0)
    {
        snew(state->dfhist, 1);
        init_df_history(state->dfhist, dfhistNumLambda);
    }
    else
    {
        state->dfhist = nullptr;
    }
}

void comp_state(const t_state* st1, const t_state* st2, gmx_bool bRMSD, real ftol, real abstol)
{
    int i, j, nc;

    fprintf(stdout, "comparing flags\n");
    cmp_int(stdout, "flags", -1, st1->flags, st2->flags);
    fprintf(stdout, "comparing box\n");
    cmp_rvecs(stdout, "box", DIM, st1->box, st2->box, FALSE, ftol, abstol);
    fprintf(stdout, "comparing box_rel\n");
    cmp_rvecs(stdout, "box_rel", DIM, st1->box_rel, st2->box_rel, FALSE, ftol, abstol);
    fprintf(stdout, "comparing boxv\n");
    cmp_rvecs(stdout, "boxv", DIM, st1->boxv, st2->boxv, FALSE, ftol, abstol);
    if (st1->flags & enumValueToBitMask(StateEntry::SVirPrev))
    {
        fprintf(stdout, "comparing shake vir_prev\n");
        cmp_rvecs(stdout, "svir_prev", DIM, st1->svir_prev, st2->svir_prev, FALSE, ftol, abstol);
    }
    if (st1->flags & enumValueToBitMask(StateEntry::FVirPrev))
    {
        fprintf(stdout, "comparing force vir_prev\n");
        cmp_rvecs(stdout, "fvir_prev", DIM, st1->fvir_prev, st2->fvir_prev, FALSE, ftol, abstol);
    }
    if (st1->flags & enumValueToBitMask(StateEntry::PressurePrevious))
    {
        fprintf(stdout, "comparing prev_pres\n");
        cmp_rvecs(stdout, "pres_prev", DIM, st1->pres_prev, st2->pres_prev, FALSE, ftol, abstol);
    }
    cmp_int(stdout, "ngtc", -1, st1->ngtc, st2->ngtc);
    cmp_int(stdout, "nhchainlength", -1, st1->nhchainlength, st2->nhchainlength);
    if (st1->ngtc == st2->ngtc && st1->nhchainlength == st2->nhchainlength)
    {
        for (i = 0; i < st1->ngtc; i++)
        {
            nc = i * st1->nhchainlength;
            for (j = 0; j < nc; j++)
            {
                cmp_real(stdout, "nosehoover_xi", i, st1->nosehoover_xi[nc + j], st2->nosehoover_xi[nc + j], ftol, abstol);
            }
        }
    }
    cmp_int(stdout, "nnhpres", -1, st1->nnhpres, st2->nnhpres);
    if (st1->nnhpres == st2->nnhpres && st1->nhchainlength == st2->nhchainlength)
    {
        for (i = 0; i < st1->nnhpres; i++)
        {
            nc = i * st1->nhchainlength;
            for (j = 0; j < nc; j++)
            {
                cmp_real(stdout, "nosehoover_xi", i, st1->nhpres_xi[nc + j], st2->nhpres_xi[nc + j], ftol, abstol);
            }
        }
    }

    cmp_int(stdout, "natoms", -1, st1->natoms, st2->natoms);
    if (st1->natoms == st2->natoms)
    {
        if ((st1->flags & enumValueToBitMask(StateEntry::X))
            && (st2->flags & enumValueToBitMask(StateEntry::X)))
        {
            fprintf(stdout, "comparing x\n");
            cmp_rvecs(stdout, "x", st1->natoms, st1->x.rvec_array(), st2->x.rvec_array(), bRMSD, ftol, abstol);
        }
        if ((st1->flags & enumValueToBitMask(StateEntry::V))
            && (st2->flags & enumValueToBitMask(StateEntry::V)))
        {
            fprintf(stdout, "comparing v\n");
            cmp_rvecs(stdout, "v", st1->natoms, st1->v.rvec_array(), st2->v.rvec_array(), bRMSD, ftol, abstol);
        }
    }
}

rvec* makeRvecArray(gmx::ArrayRef<const gmx::RVec> v, gmx::index n)
{
    GMX_ASSERT(v.ssize() >= n, "We can't copy more elements than the vector size");

    rvec* dest;

    snew(dest, n);

    const rvec* vPtr = as_rvec_array(v.data());
    for (gmx::index i = 0; i < n; i++)
    {
        copy_rvec(vPtr[i], dest[i]);
    }

    return dest;
}

t_state::t_state() :
    natoms(0),
    ngtc(0),
    nnhpres(0),
    nhchainlength(0),
    flags(0),
    fep_state(0),
    lambda(),

    baros_integral(0),
    veta(0),
    vol0(0),

    ekinstate(),
    hist(),
    dfhist(nullptr),
    awhHistory(nullptr),
    ddp_count(0),
    ddp_count_cg_gl(0)

{
    // It would be nicer to initialize these with {} or {{0}} in the
    // above initialization list, but uncrustify doesn't understand
    // that.
    // TODO Fix this if we switch to clang-format some time.
    lambda = { { 0 } };
    clear_mat(box);
    clear_mat(box_rel);
    clear_mat(boxv);
    clear_mat(pres_prev);
    clear_mat(svir_prev);
    clear_mat(fvir_prev);
}

void set_box_rel(const t_inputrec* ir, t_state* state)
{
    /* Make sure the box obeys the restrictions before we fix the ratios */
    correct_box(nullptr, 0, state->box);

    clear_mat(state->box_rel);

    if (inputrecPreserveShape(ir))
    {
        const int ndim = ir->epct == PressureCouplingType::SemiIsotropic ? 2 : 3;
        do_box_rel(ndim, ir->deform, state->box_rel, state->box, true);
    }
}

void preserve_box_shape(const t_inputrec* ir, matrix box_rel, matrix box)
{
    if (inputrecPreserveShape(ir))
    {
        const int ndim = ir->epct == PressureCouplingType::SemiIsotropic ? 2 : 3;
        do_box_rel(ndim, ir->deform, box_rel, box, false);
    }
}

void printLambdaStateToLog(FILE* fplog, gmx::ArrayRef<const real> lambda, const bool isInitialOutput)
{
    if (fplog != nullptr)
    {
        fprintf(fplog, "%s vector of lambda components:[ ", isInitialOutput ? "Initial" : "Current");
        for (const auto& l : lambda)
        {
            fprintf(fplog, "%10.4f ", l);
        }
        fprintf(fplog, "]\n%s", isInitialOutput ? "" : "\n");
    }
}

void initialize_lambdas(FILE*                            fplog,
                        const FreeEnergyPerturbationType freeEnergyPerturbationType,
                        const bool                       haveSimulatedTempering,
                        const t_lambda&                  fep,
                        gmx::ArrayRef<const real>        simulatedTemperingTemps,
                        gmx::ArrayRef<real>              ref_t,
                        bool                             isMaster,
                        int*                             fep_state,
                        gmx::ArrayRef<real>              lambda)
{
    /* TODO: Clean up initialization of fep_state and lambda in
       t_state.  This function works, but could probably use a logic
       rewrite to keep all the different types of efep straight. */

    if ((freeEnergyPerturbationType == FreeEnergyPerturbationType::No) && (!haveSimulatedTempering))
    {
        return;
    }

    if (isMaster)
    {
        *fep_state = fep.init_fep_state; /* this might overwrite the checkpoint
                                             if checkpoint is set -- a kludge is in for now
                                             to prevent this.*/
    }

    for (int i = 0; i < static_cast<int>(FreeEnergyPerturbationCouplingType::Count); i++)
    {
        double thisLambda;
        /* overwrite lambda state with init_lambda for now for backwards compatibility */
        if (fep.init_lambda >= 0) /* if it's -1, it was never initialized */
        {
            thisLambda = fep.init_lambda;
        }
        else
        {
            thisLambda = fep.all_lambda[i][fep.init_fep_state];
        }
        if (isMaster)
        {
            lambda[i] = thisLambda;
        }
    }
    if (haveSimulatedTempering)
    {
        /* need to rescale control temperatures to match current state */
        for (int i = 0; i < ref_t.ssize(); i++)
        {
            if (ref_t[i] > 0)
            {
                ref_t[i] = simulatedTemperingTemps[fep.init_fep_state];
            }
        }
    }

    /* Send to the log the information on the current lambdas */
    const bool isInitialOutput = true;
    printLambdaStateToLog(fplog, lambda, isInitialOutput);
}
