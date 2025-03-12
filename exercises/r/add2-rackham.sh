#!/bin/bash
# A batch script to run a serial R code on Rackham
#SBATCH -A uppmax2025-2-272 # Course project id. Change to your own project ID after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.1.1
module purge 
module load R/4.1.1

# Run your R script (here 'add2.R') for some random numbers, here 234 and 346 
Rscript add2.R 234 346
