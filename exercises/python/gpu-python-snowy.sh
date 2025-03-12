#!/bin/bash
#SBATCH -A uppmax2025-2-272 # Change to your own after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 
# Running on Snowy for the GPUs
#SBATCH -M Snowy
# Asking for one GPU
#SBATCH --gres=gpu:1

# Load any modules you need
module load uppmax
module load python/3.11.8 python_ML_packages/3.11.8-gpu

# Run your Python script
python my_tf_program.py
