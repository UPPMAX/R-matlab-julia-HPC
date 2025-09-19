#!/bin/bash
#SBATCH --time=02:00:00
#
# Usage:
#
#   sbatch -A [account] -n [number_of_cores] do_r_2d_integration_on_tetralith.sh
#
# Example:
#
#   sbatch -A staff -n 1 do_r_2d_integration_on_tetralith.sh
#

module load R/4.2.0-hpc1-gcc-11.3.0-bare >/dev/null 2>&1

echo "Slurm job account used: ${SLURM_JOB_ACCOUNT}"
echo "Number of cores booked in Slurm: ${SLURM_NPROCS}"

Rscript --no-save --no-restore do_2d_integration.R "${SLURM_NPROCS}"
