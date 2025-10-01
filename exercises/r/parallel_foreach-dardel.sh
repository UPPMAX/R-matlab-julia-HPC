#!/bin/bash -l
# A batch script for running the R program parallel_foreach.R
#SBATCH -A naiss2025-22-934 
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4
#SBATCH -p main

module load PDC/23.12 
module load R/4.4.1-cpeGNU-23.12 

# Batch script to submit the R program parallel_foreach.R
R -q --slave -f parallel_foreach.R

