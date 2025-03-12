#!/bin/bash
# Batch script for running the numba program "add-list.py" on Kebnekaise
#SBATCH -A hpc2n2025-062 # Remember to change this to your own project ID
# We are asking for 5 minutes
#SBATCH --time=00:05:00
# Asking for one A100
#SBATCH --gpus=1
#SBATCH -C a100 

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load GCC/12.3.0 OpenMPI/4.1.5 SciPy-bundle/2023.07 CUDA/12.0.0 numba/0.58.1 

# Run your Python script
python add-list.py
