#!/bin/bash
#SBATCH -n 16
#SBATCH -A staff
#SBATCH --time=230:00:00
#SBATCH --output "pelle_16.txt"
module load R
Rscript r_script.R ${SLURM_NTASKS}
