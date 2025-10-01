#!/bin/bash
#SBATCH -A uppmax2025-2-360 # Course project id. Change to your own project ID after the course
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.4.2-gfbf-2024a and R-bundle-CRAN/2024.11-foss-2024a and R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2
module load R/4.4.2-gfbf-2024a R-bundle-CRAN/2024.11-foss-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2 

# Run your R script 
R --no-save --quiet < validation.R

