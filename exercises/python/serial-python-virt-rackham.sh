#!/bin/bash
#SBATCH -A uppmax2025-2-272 # Change to your own after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here for Python 3.11.8
module load python/3.11.8

# Activate your virtual environment that you created in the session about isolated environments. 
# CHANGE <path-to-virt-env> to the full path where you installed your virtual environment
source <path-to-virt-env>/vpyenv/bin/activate

# Run your Python script
python seaborn-code-rackham.py
