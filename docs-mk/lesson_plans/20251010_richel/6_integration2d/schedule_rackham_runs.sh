#!/bin/bash
#
# Usage:
#
#   ./schedule_rackham_runs.sh [account]
#
# Example:
#
#   ./schedule_rackham_runs.sh staff
#

if [ "$#" -ne 2 ]; then
    echo "ERROR: Incorrect number of arguments"
    echo "when calling 'schedule_rackham_runs.sh'."
    echo " "
    echo "Please add an argument with the name of the Slurm job account."
    echo " "
    echo "General usage:"
    echo " "
    echo "  ./schedule_rackham_runs.sh [account] [grid_size]"
    echo " "
    echo "Examples:"
    echo " "
    echo "  ./schedule_rackham_runs.sh staff 16384"
    echo " "
    exit 42
fi

slurm_job_account=$1
grid_size=$2
echo "Slurm job account: ${slurm_job_account}"
echo "Grid size: ${grid_size}"

sbatch -A ${slurm_job_account} -n 1 integration2d_rackham.sh ${grid_size}
sbatch -A ${slurm_job_account} -n 4 integration2d_rackham.sh ${grid_size}
sbatch -A ${slurm_job_account} -n 16 integration2d_rackham.sh ${grid_size}
sbatch -A ${slurm_job_account} -n 64 integration2d_rackham.sh ${grid_size}
