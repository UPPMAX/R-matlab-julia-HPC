#!/bin/bash
#SBATCH -A lu2025-7-24 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 1
#SBATCH -p gpua100
#SBATCH --gres=gpu:1 
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
ml GCC/11.3.0  OpenMPI/4.1.4 R/4.2.1
ml CUDA/12.1.1 

R --no-save --no-restore -f Rscript.R
