#!/bin/bash
#SBATCH -A naiss2025-22-934 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.4.2-cpeGNU-24.11 and prerequisites
module load PDC/24.11 R/4.4.2-cpeGNU-24.11

# Run your R script (here 'iris_ml.R')
R --no-save --quiet < iris_ml.R

