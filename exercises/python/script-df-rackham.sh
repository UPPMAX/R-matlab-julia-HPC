#!/bin/bash -l
#SBATCH -A uppmax2025-2-272 # your project_ID
#SBATCH -J job-serial        # name of the job
#SBATCH -n 4                 # nr. tasks/coresw
#SBATCH --time=00:20:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file

# Load any modules you need, here for Python 3.11.8 and compatible SciPy-bundle
module load python/3.11.8
python script-df.py
