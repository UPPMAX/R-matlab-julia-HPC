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

if [ "$#" -ne 2 ]; then
    echo "ERROR: Incorrect number of arguments"
    echo "when calling 'benchmark_r_2d_integration_on_rackham.sh'."
    echo " "
    echo "Please supply all two arguments."
    echo " "
    echo "General usage:"
    echo " "
    echo "  ./benchmark_r_2d_integration_on_rackham.sh [account] [language]"
    echo " "
    echo "Examples:"
    echo " "
    echo "  ./benchmark_r_2d_integration_on_rackham.sh staff r"
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
  exit 42
fi

# Detect HPC cluster
hpc_cluster="unknown"

[[ "${HOSTNAME}" =~ ^cosmos[1-4].int.lunarc$ ]] && hpc_cluster="cosmos"
[[ "${HOSTNAME}" =~ ^pelle[1-4].uppmax.uu.se$ ]] && hpc_cluster="pelle"
[[ "${HOSTNAME}" =~ ^rackham[1-4].uppmax.uu.se$ ]] && hpc_cluster="rackham"

echo "HPC cluster: ${hpc_cluster}"

function is_valid_hpc_cluster() 
{ 
  if [ "$1" == "alvis" ]; then return 0; fi
  if [ "$1" == "bianca" ]; then return 0; fi
  if [ "$1" == "cosmos" ]; then return 0; fi
  if [ "$1" == "dardel" ]; then return 0; fi
  if [ "$1" == "kebnekaise" ]; then return 0; fi
  if [ "$1" == "lumi" ]; then return 0; fi
  if [ "$1" == "pelle" ]; then return 0; fi
  if [ "$1" == "rackham" ]; then return 0; fi
  if [ "$1" == "tetralith" ]; then return 0; fi
  return 1;
}

# Testing
if ! is_valid_hpc_cluster "alvis" ; then echo "Internal error: 'alvis' is a valid hpc_cluster"; exit 41; fi
if ! is_valid_hpc_cluster "bianca" ; then echo "Internal error: 'bianca' is a valid hpc_cluster"; exit 41; fi
if ! is_valid_hpc_cluster "cosmos" ; then echo "Internal error: 'cosmos' is a valid hpc_cluster"; exit 41; fi
if ! is_valid_hpc_cluster "dardel" ; then echo "Internal error: 'dardel' is a valid hpc_cluster"; exit 41; fi
if ! is_valid_hpc_cluster "kebnekaise" ; then echo "Internal error: 'kebnekaise' is a valid hpc_cluster"; exit 41; fi
if ! is_valid_hpc_cluster "lumi" ; then echo "Internal error: 'lumi' is a valid hpc_cluster"; exit 41; fi
if ! is_valid_hpc_cluster "pelle" ; then echo "Internal error: 'pelle' is a valid hpc_cluster"; exit 41; fi
if ! is_valid_hpc_cluster "rackham" ; then echo "Internal error: 'rackham' is a valid hpc_cluster"; exit 41; fi
if ! is_valid_hpc_cluster "tetralith" ; then echo "Internal error: 'tetralith' is a valid hpc_cluster"; exit 41; fi

# Using
if ! is_valid_hpc_cluster "${hpc_cluster}"
then
  echo "ERROR: '${hpc_cluster}' is not valid hpc_cluster."
  echo "Supported hpc_clusters: "
  echo "- alvis"
  echo "- bianca"
  echo "- cosmos"
  echo "- dardel"
  echo "- kebnekaise"
  echo "- lumi"
  echo "- pelle"
  echo "- rackham"
  echo "- tetralith"
  exit 42
fi

# Script filename
script_name="do_${language}_2d_integration_on_${hpc_cluster}.sh"
echo "Script name: ${script_name}"

if [ ! -f "${script_name}" ]; then
  echo "ERROR: script with name '${script_name}' not found."
  echo " "
  echo "Add it :-)"
  exit 42
fi

# Threaded parallelism only makes sense on a single node
n_nodes=1

# Schedule all the jobs
for n_cores in $(seq 1 64)
do 
  sbatch -A "${slurm_job_account}" -N "${n_nodes}" -n "${n_cores}" "${script_name}"
done
