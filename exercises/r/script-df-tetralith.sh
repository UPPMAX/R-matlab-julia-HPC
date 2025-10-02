#!/bin/bash
#SBATCH -A naiss2025-22-934 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.4.0-hpc1-gcc-11.3.0-bare
module load R/4.4.0-hpc1-gcc-11.3.0-bare

Rscript --no-save --no-restore script-df.R
