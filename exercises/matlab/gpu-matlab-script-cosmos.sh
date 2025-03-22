#!/bin/bash
# Change to your actual project number
#SBATCH -A lu2025-7-24
#SBATCH -n 1
#SBATCH -p gpua100
# The number of GPUs.#gpus, can be 1 or 2
#SBATCH --gpus=<#gpus>

# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider matlab
module load matlab/2023b

# Executing a GPU matlab program
matlab -nodisplay -nosplash -r "gpu-matlab-script.m"
