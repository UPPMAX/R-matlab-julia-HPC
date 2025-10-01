#!/bin/bash -l
#SBATCH -A uppmax2025-2-360
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4

ml R/4.4.2-gfbf-2024a R-bundle-CRAN/2024.11-foss-2024a

# Batch script to submit the R program parallel_foreach.R 
R -q --slave -f parallel_foreach.R

