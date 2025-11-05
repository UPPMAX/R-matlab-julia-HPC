#!/bin/bash
#SBATCH --time=02:00:00
#
# Usage:
#
#   sbatch -A [account] -n [number_of_cores] schedule_rackham_runs.sh
#
# Example:
#
#   sbatch -A staff -n 1 integration2d_rackham_x.sh
#

module load R_packages/4.1.1 >/dev/null 2>&1

echo "Slurm job account used: ${SLURM_JOB_ACCOUNT}"
echo "Number of cores booked in Slurm: ${SLURM_NPROCS}"

Rscript --no-save --no-restore do_2d_integration.R ${SLURM_NPROCS}
