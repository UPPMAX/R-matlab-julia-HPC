#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A lu2025-7-24
# We are asking for 5 minutes
#SBATCH --time=00:05:00
#SBATCH --ntasks-per-node=1
# Asking for one GPU
#SBATCH -p gpua100
#SBATCH --gres=gpu:1

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load GCC/11.3.0  OpenMPI/4.1.4 TensorFlow/2.11.0-CUDA-11.7.0 SciPy-bundle/2022.05 scikit-learn/1.1.2

# Run your Python script
python scikit-learn.py
