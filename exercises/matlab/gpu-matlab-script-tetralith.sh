#!/bin/bash
# Change to your actual project number
#SBATCH -A naiss2025-22-934
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-core=1
# The number of GPUs.#gpus, can be 1 or 2
#SBATCH --gpus-per-task=1

# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider matlab
module load MATLAB/2024a-hpc1-bdist

# Executing a GPU matlab program
matlab -singleCompThread -nodisplay -nosplash -r "gpu-matlab-script.m"
