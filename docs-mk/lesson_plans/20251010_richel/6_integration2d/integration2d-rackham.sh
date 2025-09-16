#!/bin/bash -l
#SBATCH -A naiss2025-2-272  # your project_ID
#SBATCH -J job-serial        # name of the job
#SBATCH -n *FIXME*           # nr. tasks/coresw
#SBATCH --time=00:20:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file

ml R_packages/4.1.1

Rscript --no-save --no-restore integration2d.R
