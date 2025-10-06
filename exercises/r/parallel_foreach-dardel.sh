#!/bin/bash -l
# A batch script for running the R program parallel_foreach.R
#SBATCH -A naiss2025-22-934 
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4
#SBATCH -p main

module load PDC/24.11 R/4.4.2-cpeGNU-24.11 

# Batch script to submit the R program parallel_foreach.R
R -q --slave -f parallel_foreach.R

