#!/bin/bash
# Change to your actual project number
#SBATCH -A naiss2025-22-262
# Remember, there are 4 workers and 1 master!
#SBATCH -p shared
#SBATCH -n 5
# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider matlab
module add PDC/23.12 matlab/r2024a-ps

# Executing a parallel matlab program
matlab -nodisplay -nodesktop -nosplash -r "parallel_example(16)"
