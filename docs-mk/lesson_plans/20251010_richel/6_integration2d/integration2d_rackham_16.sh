#!/bin/bash
#SBATCH -n 16
#SBATCH -A staff
#SBATCH --time=02:00:00

module load R_packages/4.1.1 >/dev/null 2>&1

echo "Number of cores booked in Slurm: ${SLURM_NPROCS}"
Rscript --no-save --no-restore do_2d_integration.R 16
