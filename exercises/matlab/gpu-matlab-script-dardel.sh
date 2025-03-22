#!/bin/bash
# Change to your actual project number
#SBATCH -A naiss2025-22-262
#SBATCH --ntasks-per-node=1
#SBATCH -N 1
# Ask for GPUs
#SBATCH -p gpu

# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider matlab
module load PDC/23.12 R/4.4.1-cpeGNU-23.12 rocm/5.7.0

# Executing a GPU matlab program
matlab -singleCompThread -nodisplay -nosplash -r "gpu-matlab-script.m"
