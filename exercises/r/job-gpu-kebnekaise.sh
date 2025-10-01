#!/bin/bash
#SBATCH -A hpc2n2025-151 # Change to your own project ID
#Asking for 1 hour.
#SBATCH -t 03:00:00
#SBATCH -n 1
#SBATCH --gpus=1
#SBATCH -C l40s
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
ml GCC/13.2.0 R/4.4.1 CUDA/12.1.1
ml OpenMPI/4.1.6 R-bundle-CRAN/2024.06

R --no-save --no-restore -f gpu-script-db-higgs.R

