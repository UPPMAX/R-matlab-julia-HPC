#!/bin/bash
# A batch script to run a serial R code on Kebnekaise
#SBATCH -A hpc2n2025-062 # Course project id. Change to your own project ID after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.2.1
module purge 
module load GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1

# Run your R script (here 'add2.R') for some random numbers, here 234 and 346 
Rscript add2.R 234 346
