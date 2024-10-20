#!/bin/bash
#SBATCH -A naiss2024-22-1202 # Course project id. Change to your own project ID after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.1.1 and R_packages/4.1.1
module load R/4.1.1 R_packages/4.1.1

# Run your R script (here 'validation.R')
R --no-save --quiet < validation.R
