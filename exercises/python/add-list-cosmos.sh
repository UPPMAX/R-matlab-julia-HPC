#!/bin/bash
# Batch script for running the numba program "add-list.py" on Kebnekaise
#SBATCH -A lu2025-7-24 # Remember to change this to your own project ID
# We are asking for 5 minutes
#SBATCH --time=00:05:00
#SBATCH --ntasks-per-node=1
# Asking for one A100 GPU
#SBATCH -p gpua100
#SBATCH --gres=gpu:1

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load GCC/12.2.0  OpenMPI/4.1.4 SciPy-bundle/2023.02 numba/0.58.0 

# Run your Python script
python add-list.py
