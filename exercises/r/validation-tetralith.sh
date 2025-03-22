#!/bin/bash
#SBATCH -A naiss2025-22-262 # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need
module load R/4.4.0-hpc1-gcc-11.3.0-bare

#Make sure we use the renv with datarium installed - this was installed under the "Isolated environments with renv" section 
cd <path-to-my-renv-project/<my-renv>

#Another way to use the renv would be to load it - in that case you don't need to have your R script in the same directory as the renv. Comment out the above and uncomment the below if you want to do this.  
#renv::load("<path-to-your-renv>")

# Run your R script (here 'validation.R'. Give the path if it is not located in the same directory as the renv)
R --no-save --quiet < <path-to-script>/validation.R
