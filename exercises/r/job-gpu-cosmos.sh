#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A lu2025-2-94
# Asking for runtime: hours, minutes, seconds. At most 1 week
#SBATCH --time=03:00:00
# Ask for GPU resources - x is how many cards, 1 or 2 
#SBATCH -p gpua100
#SBATCH --gres=gpu:x

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load GCC/12.3.0 OpenMPI/4.1.5 R/4.4.1 
module load R-bundle-CRAN/2023.12-R-4.4.1 CUDA

R --no-save --no-restore -f gpu-script-db-higgs.R

