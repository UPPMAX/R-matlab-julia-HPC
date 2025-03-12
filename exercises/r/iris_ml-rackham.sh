#!/bin/bash
#SBATCH -A uppmax2025-2-272 # Course project id. Change to your own project ID after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.1.1 and R_packages/4.1.1
module load R/4.1.1 R_packages/4.1.1

# Run your R script (here 'iris_ml.R')
R --no-save --quiet < iris_ml.R
