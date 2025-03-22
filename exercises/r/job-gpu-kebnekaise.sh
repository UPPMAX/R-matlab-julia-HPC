#!/bin/bash
#SBATCH -A hpc2n2025-062 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 30:50:00
#SBATCH -n 1
#SBATCH --gpus=1
#SBATCH -C l40s
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
#module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1 CUDA/12.1.1
ml GCC/13.2.0 R/4.4.1 CUDA/12.1.1

R --no-save --no-restore -f gpu-script-db-higgs.R
