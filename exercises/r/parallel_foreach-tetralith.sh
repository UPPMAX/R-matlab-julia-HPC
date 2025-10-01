#!/bin/bash
# A batch script for running the R program parallel_foreach.R 
#SBATCH -A naiss2025-22-934
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4

ml purge > /dev/null 2>&1
ml R/4.2.2-hpc1-gcc-11.3.0-bare 

# Batch script to submit the R program parallel_foreach.R
R -q --slave -f parallel_foreach.R 

