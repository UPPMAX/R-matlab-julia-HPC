#!/bin/bash
#
# Benchmark threaded parallelism.
#
# Usage:
#
#   ./benchmark_2d_integration.sh [account] [language] [hpc_cluster]
#
# - [lanuage]: julia, matlab, r
# - [hpc_cluster]: pelle, rackham
#
#
# Example:
#
#   ./benchmark_2d_integration.sh staff r rackham
#

if [ "$#" -ne 3 ]; then
    echo "ERROR: Incorrect number of arguments"
    echo "when calling 'benchmark_r_2d_integration_on_rackham.sh'."
    echo " "
    echo "Please supply all three arguments."
    echo " "
    echo "General usage:"
    echo " "
    echo "  ./benchmark_r_2d_integration_on_rackham.sh [account] [language] [hpc_cluster]"
    echo " "
    echo "Examples:"
    echo " "
    echo "  ./benchmark_r_2d_integration_on_rackham.sh staff r rackham"
    echo " "
    exit 42
fi

slurm_job_account=$1
echo "Slurm job account used: ${slurm_job_account}"

language=$2
echo "Language: ${language}"

function is_valid_language() 
{ 
  if [ "$1" == "julia" ]; then return 0; fi
  if [ "$1" == "matlab" ]; then return 0; fi
  if [ "$1" == "r" ]; then return 0; fi
  return 1;
}

# Testing
if ! is_valid_language "julia" ; then echo "Internal error: julia is a valid language"; exit 41; fi
if ! is_valid_language "matlab" ; then echo "Internal error: julia is a valid language"; exit 41; fi
if ! is_valid_language "r" ; then echo "Internal error: julia is a valid language"; exit 41; fi

# Using
if ! is_valid_language "${language}"
then
  echo "ERROR: '${language}' is not valid language."
  echo "Supported languages: "
  echo "- julia"
  echo "- matlab"
  echo "- r"
  exit 41
fi

hpc_cluster=$3
echo "HPC cluster: ${hpc_cluster}"

function is_valid_hpc_cluster() 
{ 
  if [ "$1" == "bianca" ]; then return 0; fi
  if [ "$1" == "pelle" ]; then return 0; fi
  if [ "$1" == "rackham" ]; then return 0; fi
  return 1;
}

# Testing
if ! is_valid_hpc_cluster "bianca" ; then echo "Internal error: bianca is a valid hpc_cluster"; exit 41; fi
if ! is_valid_hpc_cluster "pelle" ; then echo "Internal error: pelle is a valid hpc_cluster"; exit 41; fi
if ! is_valid_hpc_cluster "rackham" ; then echo "Internal error: rackham is a valid hpc_cluster"; exit 41; fi

# Using
if ! is_valid_hpc_cluster "${hpc_cluster}"
then
  echo "ERROR: '${hpc_cluster}' is not valid hpc_cluster."
  echo "Supported hpc_clusters: "
  echo "- bianca"
  echo "- pelle"
  echo "- rackham"
  exit 41
fi

# Script filename
scriptname="do_${language}_2d_integration_on_${hpc_cluster}.sh"
echo "Script name: ${scriptname}"

# Schedule all the jobs
for n_cores in $(seq 1 64)
do 
  sbatch -A "${slurm_job_account}" -n "${n_cores}" do_r_2d_integration_on_rackham.sh
done
