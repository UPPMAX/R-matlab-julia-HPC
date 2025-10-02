#!/bin/bash
# Change to your actual project number
#SBATCH -A naiss2025-22-360
#SBATCH -p gpu
#SBATCH --gpus:l40s:1
# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out

# Change depending on resource and MATLAB version
# to find out available versions: module spider MATLAB
module add MATLAB/2024a

# Executing a GPU matlab program
matlab -nodisplay -nosplash -r "gpu-matlab-script.m"
