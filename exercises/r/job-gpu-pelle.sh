#!/bin/bash -l
#SBATCH -A uppmax2025-2-360 # Change to your own project ID
#Asking for 3 hours.
#SBATCH -t 03:00:00
#SBATCH -p gpu 
#SBATCH --gpus:l40s:1
#Writing output and error files
#SBATCH --output=output%J.out
#SBATCH --error=error%J.error

ml R/4.4.2-gfbf-2024a R-bundle-CRAN/2024.11-foss-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2 

R --no-save --no-restore -f gpu-script-db-higgs.R

