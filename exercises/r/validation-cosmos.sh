#!/bin/bash
#SBATCH -A lu2025-7-24 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.2.1 and prerequisites + R-bundle-Bioconductor/3.15-R-4.2.1
module load GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1 R-bundle-Bioconductor/3.15-R-4.2.1

#Make sure we use the renv with datarium installed - this was installed under the "Isolated environments with renv" section 
cd <path-to-my-renv-project/<my-renv>

#Another way to use the renv would be to load it - in that case you don't need to have your R script in the same directory as the renv. Comment out the above and uncomment the below if you want to do this.  
#renv::load("<path-to-your-renv>")

# Run your R script (here 'validation.R'. Give the path if it is not located in the same directory as the renv)
R --no-save --quiet < <path-to-script>/validation.R
