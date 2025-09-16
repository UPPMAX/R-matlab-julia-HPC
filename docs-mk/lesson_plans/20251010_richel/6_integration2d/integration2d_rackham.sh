#!/bin/bash
#SBATCH --time=02:00:00
#
# Usage:
#
#   sbatch -A [account] -n [number_of_cores] schedule_rackham_runs.sh
#
# Example:
#
#   sbatch -A staff -n 1 integration2d_rackham.sh
#

if [ "$#" -ne 1 ]; then
    echo "ERROR: Incorrect number of arguments"
    echo "when calling 'integration2d_rackham.sh'."
    echo " "
    echo "Please add an argument with the size of the grid."
    echo " "
    echo "General usage:"
    echo " "
    echo "  ./integration2d_rackham.sh [grid_size]"
    echo " "
    echo "Examples:"
    echo " "
    echo "  ./integration2d_rackham.sh 16384"
    echo " "
fi

echo "Grid size: ${grid_size}"
grid_size=$1

module load R_packages/4.1.1 >/dev/null 2>&1

echo "Slurm job account used: ${SLURM_JOB_ACCOUNT}"
echo "Number of cores booked in Slurm: ${SLURM_NPROCS}"

Rscript --no-save --no-restore do_2d_integration.R ${SLURM_NPROCS} 
