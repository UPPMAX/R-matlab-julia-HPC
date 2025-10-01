#!/bin/bash
#SBATCH -A uppmax2025-2-360
#Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH --exclusive
#SBATCH -n 1
#SBATCH --cpus-per-task=8
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml R/4.4.2-gfbf-2024a R-bundle-CRAN/2024.11-foss-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2

srun Rscript MyRscript.R

