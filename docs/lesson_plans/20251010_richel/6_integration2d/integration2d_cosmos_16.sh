#!/bin/bash
#SBATCH -n 16
#SBATCH -A lu2024-7-68
#SBATCH --time=02:00:00
#
# Use 'projinfo' to see all your accounts
#
module purge > /dev/null 2>&1
module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1

echo "Number of cores booked in Slurm: ${SLURM_NPROCS}"
Rscript --no-save --no-restore do_2d_integration.R 16
