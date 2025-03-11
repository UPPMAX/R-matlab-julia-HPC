#!/bin/bash
#SBATCH -A lu2025-7-24       # your project_ID
#SBATCH -J job-serial        # name of the job
#SBATCH -n 1                 # nr. tasks
#SBATCH --time=00:20:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file

# Load any modules you need, here for Python 3.11.3 and compatible SciPy-bundle
module load GCC/12.3.0 Python/3.11.3 SciPy-bundle/2023.07
python script-df.py
