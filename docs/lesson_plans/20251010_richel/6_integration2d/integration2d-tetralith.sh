#!/bin/bash
#SBATCH -A naiss2025-22-262  # your project_ID
#SBATCH -J job               # name of the job
#SBATCH -n *FIXME*     # nr. of tasks
#SBATCH --time=00:20:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file


# Load dependencies and R version
ml R/4.2.0-hpc1-gcc-11.3.0-bare

Rscript --no-save --no-restore integration2d.R
