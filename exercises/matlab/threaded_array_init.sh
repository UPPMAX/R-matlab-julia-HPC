#!/bin/bash
#Change to your local project number
#SBATCH -A <PROJ-ID>
#SBATCH --output=matlab_threads_%J.out  # Output file
#SBATCH --error=matlab_threads_%J.err   # Error file
#Change time as needed
#SBATCH --time=01:00:00                 # run time limit (HH:MM:SS)
#SBATCH --nodes=1                         # node count
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4        #cpu-cores per task (>1 for multi-threaded)

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider matlab
module load <MATLABMODULE>

## Run your program or script
matlab -nodisplay  -nosplash -nodesktop -r "threaded_arrinit"
