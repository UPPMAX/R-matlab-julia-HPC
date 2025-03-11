#!/bin/bash
#SBATCH -A lu2025-7-24 # Change to your own after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH --ntasks-per-node=1
# Asking for one A100 card
#SBATCH -p gpua100
#SBATCH --gres=gpu:1

# Load any modules you need
module load GCC/11.3.0 OpenMPI/4.1.4 TensorFlow/2.11.0-CUDA-11.7.0 SciPy-bundle/2022.05 

# This is using the scikit-learn installed with the above modules 

# Run your Python script
python my_tf_program.py
