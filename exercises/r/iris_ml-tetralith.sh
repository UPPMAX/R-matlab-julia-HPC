#!/bin/bash
#SBATCH -A naiss202t-uw-xyz # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.4.0-hpc1-gcc-11.3.0-bare
module load R/4.4.0-hpc1-gcc-11.3.0-bare

# NOTE: you need to install the packages caret, kernlab, and randomForest 
# before running the script. Load the R module, as above
# Start R
# Then install.packages('caret', repos='http://ftp.acc.umu.se/mirror/CRAN/')
# and install.packages('kernlab', repos='http://ftp.acc.umu.se/mirror/CRAN/')
# and install.packages('randomForest', repos='http://ftp.acc.umu.se/mirror/CRAN/')

# Run your R script (here 'iris_ml.R')
R --no-save --quiet < iris_ml.R
