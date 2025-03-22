#!/bin/bash
#SBATCH -A naiss2025-22-262 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 1
#SBATCH -c 32
#SBATCH --gpus-per-task=1
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
module load R/4.4.0-hpc1-gcc-11.3.0-bare

R --no-save --no-restore -f Rscript.R
