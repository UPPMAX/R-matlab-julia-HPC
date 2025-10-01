#!/bin/bash
#SBATCH -A naiss2025-22-934 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=8
#SBATCH -p main
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
module load PDC/24.11 R/4.4.2-cpeGNU-24.11

srun Rscript MyRscript.R

