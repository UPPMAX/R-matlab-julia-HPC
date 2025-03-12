#!/bin/bash
# Change to your actual project number later
#SBATCH -A uppmax2025-2-272
# Asking for 1 core
#SBATCH -n 1
# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider matlab
module add matlab/R2023b

# Executing the matlab program monte_carlo_pi.m for the value n=100000
# (n is number of steps - see program).
# The command 'time' is timing the execution
time matlab -nojvm -nodisplay -r "monte_carlo_pi(100000)"
