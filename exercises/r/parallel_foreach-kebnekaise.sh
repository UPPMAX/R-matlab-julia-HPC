#!/bin/bash
#SBATCH -A hpc2n2025-151 # Change to your own project ID
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4

ml purge > /dev/null 2>&1
ml GCC/13.2.0 R/4.4.1 OpenMPI/4.1.6 R-bundle-CRAN/2024.06

# Batch script to submit the R program parallel_foreach.R 
R -q --slave -f parallel_foreach.R

