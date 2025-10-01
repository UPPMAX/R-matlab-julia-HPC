#!/bin/bash
#SBATCH -A naiss2025-23-934 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 1
#SBATCH --cpus-per-task=8 
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
module load R/4.4.0-hpc1-gcc-11.3.0-bare

#Remember to install "mlbench" and "caret" before running the batch script!

srun Rscript MyRscript.R

