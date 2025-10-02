#!/bin/bash
# Change to your actual project number
#SBATCH -A uppmax2025-2-360
#SBATCH -n 2
#SBATCH -M snowy
#SBATCH --gres=gpu:1
# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider matlab
module add matlab/R2023b

# Executing a GPU matlab program
matlab -nodisplay -nosplash -r "gpu-matlab-script.m"
