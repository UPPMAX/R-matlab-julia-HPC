#!/bin/bash
#SBATCH -n 1
#SBATCH -A staff
#SBATCH --time=230:00:00
#SBATCH --output "pelle_1.txt"
module load R
Rscript r_script.R ${SLURM_NTASKS}
