#!/bin/bash
#SBATCH -n 1           # nr. tasks/coresw
#SBATCH -A staff
#SBATCH --time=00:20:00      # requested time

module load R_packages/4.1.1 > /dev/null

Rscript --no-save --no-restore integration2d.R 1
