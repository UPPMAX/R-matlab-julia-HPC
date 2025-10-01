#!/bin/bash
# A batch script to run a serial R code on Rackham
#SBATCH -A uppmax2025-2-360 # Course project id. Change to your own project ID after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.1.1
module load R/4.1.1

# Run your R script (here 'hello.R')
R --no-save --quiet < hello.R
