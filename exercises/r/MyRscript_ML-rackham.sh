#!/bin/bash
#SBATCH -A uppmax2025-2-360
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH --exclusive
#SBATCH -p node
#SBATCH -N 1
#SBATCH -M snowy
#SBATCH --gres=gpu:1
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml purge > /dev/null 2>&1
ml R_packages/4.1.1

R --no-save --no-restore -f Rscript.R
