#!/bin/bash
#
#
#
# Usage:
#
#   ./benchmark_r_2d_integration_on_rackham.sh [account]
#
# Example:
#
#   ./benchmark_r_2d_integration_on_rackham.sh staff
#

if [ "$#" -ne 1 ]; then
    echo "ERROR: Incorrect number of arguments"
    echo "when calling 'benchmark_r_2d_integration_on_rackham.sh'."
    echo " "
    echo "Please add an argument with the name of the Slurm job account."
    echo " "
    echo "General usage:"
    echo " "
    echo "  ./benchmark_r_2d_integration_on_rackham.sh [account]"
    echo " "
    echo "Examples:"
    echo " "
    echo "  ./benchmark_r_2d_integration_on_rackham.sh staff"
    echo " "
fi

slurm_job_account=$1
echo "Slurm job account used: ${slurm_job_account}"

sbatch -A ${slurm_job_account} -n 1 do_r_2d_integration_on_rackham.sh
sbatch -A ${slurm_job_account} -n 4 do_r_2d_integration_on_rackham.sh
sbatch -A ${slurm_job_account} -n 16 do_r_2d_integration_on_rackham.sh
sbatch -A ${slurm_job_account} -n 64 do_r_2d_integration_on_rackham.sh
