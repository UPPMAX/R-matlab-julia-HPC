#!/bin/bash
#SBATCH -A lu2025-2-94 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -n 1
#SBATCH --cpus-per-task=8
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1

srun Rscript MyRscript.R

