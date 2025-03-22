#!/bin/bash
# Change to your actual project number later
#SBATCH -A naiss2025-22-262
#SBATCH -n 1
# Asking for 15 min (change as you want)
#SBATCH -t 00:15:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out
#SBATCH -p main

# Clean the environment
module purge > /dev/null 2>&1
module load  PDC/23.12 matlab/r2024a-ps

# Executing the matlab program monte_carlo_pi.m for the value n=100000
# (n is number of steps - see program).
# The command 'time' is timing the execution
time matlab -singleCompThread -nojvm -nodisplay -r "monte_carlo_pi(100000)"
