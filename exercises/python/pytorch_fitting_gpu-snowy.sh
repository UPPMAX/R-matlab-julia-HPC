#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A uppmax2025-2-272
# We are asking for 5 minutes
#SBATCH --time=00:05:00
#SBATCH -n 1 
#SBATCH -M snowy 
#SBATCH --gres=gpu:1
# The following two lines splits the output in a file for any errors and a file for other output.
#SBATCH --error=job.%J.err
#SBATCH --output=job.%J.out

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load uppmax python/3.11.8 python_ML_packages/3.11.8-gpu

srun python pytorch_fitting_gpu.py
