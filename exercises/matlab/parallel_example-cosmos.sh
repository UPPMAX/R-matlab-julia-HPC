#!/bin/bash
# Change to your actual project number
#SBATCH -A lu2025-7-24
# Remember, there are 4 workers and 1 master!
#SBATCH --ntasks=5
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=5
#SBATCH --ntasks-per-core=1
# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider matlab
module add matlab/2023b

# Executing a parallel matlab program
srun matlab -nojvm -nodisplay -nodesktop -nosplash -r "parallel_example(16)"
