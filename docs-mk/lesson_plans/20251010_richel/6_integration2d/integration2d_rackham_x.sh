#!/bin/bash
#SBATCH -A staff
#SBATCH --time=00:20:00
module load R_packages/4.1.1 >/dev/null 2>&1

echo "Number of cores booked in Slurm: ${SLURM_NPROCS}"
Rscript --no-save --no-restore integration2d.R 1
