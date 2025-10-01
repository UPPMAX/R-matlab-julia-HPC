#!/bin/bash
#SBATCH -A naiss2025-22-934
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.2.2 
module load R/4.2.2-hpc1-gcc-11.3.0-bare 

# Run your R script (here 'hello.R')
R --no-save --quiet < hello.R 

