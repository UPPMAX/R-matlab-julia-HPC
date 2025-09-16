#!/bin/bash
#SBATCH -A lu2025-7-24      # your project_ID
#SBATCH -J job-serial        # name of the job
#SBATCH -n *FIXME*           # nr. tasks
#SBATCH --time=00:20:00      # requested time
#SBATCH --error=job.%J.err   # error file
#SBATCH --output=job.%J.out  # output file
##SBATCH --reservation=RPJM-course*FIXME* # reservation (optional)

ml purge > /dev/null 2>&1
ml GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1
Rscript --no-save --no-restore integration2d.R
