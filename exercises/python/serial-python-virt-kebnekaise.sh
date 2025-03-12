#!/bin/bash
# Serial batch script for Python, Scientific Python packages, maplotlib, and loading your virtual environment
#SBATCH -A hpc2n2025-062 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here for Python 3.11.3 and compatible SciPy-bundle, matplotlib 
module load GCC/12.3.0  Python/3.11.3 SciPy-bundle/2023.07 matplotlib/3.7.2

# Activate your virtual environment that you created in the section about isolated environments. Note that you either need to have added the location to your path, or give the full path
source <path-to-virt-env>/vpyenv/bin/activate

# Run your Python script
python seaborn-code-kebnekaise.py
