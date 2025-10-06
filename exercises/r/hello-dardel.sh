#!/bin/bash -l
#SBATCH -A naiss2025-22-934
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core
#SBATCH -p main

# Load any modules you need, here R/4.4.1
module load PDC/24.11 R/4.4.2-cpeGNU-24.11

# Run your R script (here 'hello.R')
R --no-save --quiet < hello.R             

