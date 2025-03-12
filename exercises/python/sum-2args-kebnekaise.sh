#!/bin/bash
#SBATCH -A hpc2n2025-062 # Change to your own ID
#SBATCH --time=00:05:00 # Asking for 5 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here for Python 3.11.3
module load GCC/12.3.0  Python/3.11.3

# Run your Python script
python sum-2args.py 2 3
