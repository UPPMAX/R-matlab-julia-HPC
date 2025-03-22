#!/bin/bash
#SBATCH -A naiss2025-22-262
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core
#SBATCH -p main

# Load any modules you need, here for R/4.4.1
module load PDC/23.12 R/4.4.1-cpeGNU-23.12

# Run your R script
Rscript add2.R 2 3
