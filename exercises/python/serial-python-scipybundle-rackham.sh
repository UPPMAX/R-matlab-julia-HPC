#!/bin/bash
# Batch script for running serial Python code on Rackham
# Loading Python and various scientific packages 
#SBATCH -A uppmax2025-2-272 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here for Python 3.11.8 
module load python/3.11.8 python_ML_packages/3.11.8-cpu 

# Run your Python script
python <my_program.py>
