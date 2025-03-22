#!/bin/bash
#SBATCH -A naiss2025-22-262 # Change to your own project ID
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH --ntasks-per-node=1
#SBATCH -p shared
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
module load PDC/23.12 R/4.4.1-cpeGNU-23.12

R --no-save --no-restore -f Rscript.R
