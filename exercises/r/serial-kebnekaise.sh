#!/bin/bash
# A script for running a serial R code on Kebnekaise 
#SBATCH -A hpc2n2025-151 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.2.1 and prerequisites
module load GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1

# Run your R script (here 'hello.R')
R --no-save --quiet < hello.R
