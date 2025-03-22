#!/bin/bash
#SBATCH -A naiss202t-uw-xyz # Change to your own project ID
#SBATCH --time=00:10:00 # Asking for 10 minutes
#SBATCH -n 1 # Asking for 1 core

# Load any modules you need, here R/4.4.1-cpeGNU-23.12 and prerequisites
module load PDC/23.12 R/4.4.1-cpeGNU-23.12

# NOTE: if you did not install the packages caret, kernlab, and randomForest before, you have to do so now before running the script.
# Load the R module as above. Start R 
# install.packages('caret', repos='http://ftp.acc.umu.se/mirror/CRAN/')
# install.packages('kernlab', repos='http://ftp.acc.umu.se/mirror/CRAN/')
# install.packages('randomForest', repos='http://ftp.acc.umu.se/mirror/CRAN/')

# Run your R script (here 'iris_ml.R')
R --no-save --quiet < iris_ml.R
