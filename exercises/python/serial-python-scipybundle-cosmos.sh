#!/bin/bash
# Batch script for running serial Python code on Cosmos
# Loading Python and various scientific packages 
#SBATCH -A lu2025-7-24 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need
module load GCC/12.3.0  OpenMPI/4.1.5 Python/3.11.3 SciPy-bundle/2023.07

# Run your Python script
python <my_program.py>
