#!/bin/bash
#SBATCH -A uppmax2025-2-360 # Change to your own project ID
#Asking for 70 min.
#SBATCH -t 12:00:00
#SBATCH -p node
#SBATCH -N 1
##SBATCH -n 1
#SBATCH -M snowy
#SBATCH --gres=gpu:1
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
#module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1 CUDA/12.1.1
ml R_packages

R --no-save --no-restore -f gpu-script-db-higgs.R
