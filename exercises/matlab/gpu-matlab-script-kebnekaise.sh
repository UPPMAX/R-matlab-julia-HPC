#!/bin/bash
# Change to your actual project number
#SBATCH -A hpc2n2025-062
#SBATCH -n 1
#SBATCH --gpus=<#gpus>
#SBATCH -C <gpu-type>
# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider matlab
module load MATLAB/2023a.Update4

# Executing a GPU matlab program
matlab -nodisplay -nosplash -r "gpu-matlab-script.m"
