#!/bin/bash
# Remember to change this to your own project ID after the course!
#SBATCH -A uppmax2025-2-272
# We are asking for 5 minutes
#SBATCH --time=00:05:00
# Asking for one GPU
#SBATCH -M snowy            
#SBATCH --gres=gpu:1   

# Remove any loaded modules and load the ones we need
module purge  > /dev/null 2>&1
module load python/3.11.8 python_ML_packages/3.11.8-gpu  

# Run your Python script
python add-list.py
