#!/bin/bash
# A batch script for running the R program parallel_foreach.R
#SBATCH -A lu2025-2-94 # Change to your own project ID
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4

ml purge > /dev/null 2>&1
ml GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1

# Batch script to submit the R program parallel_foreach.R
R -q --slave -f parallel_foreach.R

