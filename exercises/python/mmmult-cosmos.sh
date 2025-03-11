#!/bin/bash
# Batch script for running mmmult.py on Kebnekaise
#SBATCH -A lu2025-7-24 # Change to your own project ID 
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Purge any loaded modules
ml purge > /dev/null 2>&1 

# Load any modules you need, here Python 3.11.3, SciPy-bundle,  and prerequisites.
module load GCC/12.3.0  Python/3.11.3 SciPy-bundle/2023.07

# Run your Python script
python mmmult.py
