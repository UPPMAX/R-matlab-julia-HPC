#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A hpc2n2025-062
# We are asking for 5 minutes
#SBATCH --time=00:05:00
# Asking for one L40s GPU
#SBATCH --gpus=1
#SBATCH -C l40s

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load GCC/12.3.0  OpenMPI/4.1.5 TensorFlow/2.15.1-CUDA-12.1.1 SciPy-bundle/2023.07 scikit-learn/1.4.2 

# Run your Python script
python scikit-learn.py
