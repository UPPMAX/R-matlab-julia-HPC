#!/bin/bash
#
# Usage:
#
#   sbatch -A [account] schedule_rackham_runs.sh
#
# Example:
#
#   sbatch -A staff schedule_rackham_runs.sh
#
echo "Slurm job account used: ${SLURM_JOB_ACCOUNT}"
sbatch -A ${SLURM_JOB_ACCOUNT} -n 1 integration2d_rackham.sh
sbatch -A ${SLURM_JOB_ACCOUNT} -n 4 integration2d_rackham.sh
sbatch -A ${SLURM_JOB_ACCOUNT} -n 16 integration2d_rackham.sh
sbatch -A ${SLURM_JOB_ACCOUNT} -n 63 integration2d_rackham.sh
