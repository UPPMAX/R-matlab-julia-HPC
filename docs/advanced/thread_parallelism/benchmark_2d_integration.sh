#!/bin/bash
#
# Benchmark threaded parallelism.
#
# This scripr does by scheduling the same calculation
# for a different number of cores.
#
# Usage:
#
#   bash benchmark_2d_integration.sh [account] [language]
#
# - [account]: your NAISS account
# - [lanuage]: julia, matlab, r
#
# Example:
#
#   bash benchmark_2d_integration.sh staff r
#

if [ "$#" -ne 2 ]; then
    echo "ERROR: Incorrect number of arguments"
    echo "when calling 'benchmark_r_2d_integration.sh'."
    echo " "
    echo "Please supply all two arguments."
    echo " "
    echo "General usage:"
    echo " "
    echo "  bash benchmark_r_2d_integration.sh [account] [language]"
    echo " "
    echo "Examples:"
    echo " "
    echo "  bash benchmark_r_2d_integration.sh staff r"
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

function get_language_script_name() 
{ 
  if [ "$1" == "julia" ]; then echo "do_2d_integration.jl"; return 0; fi
  if [ "$1" == "matlab" ]; then echo "do_2d_integration.m"; return 0; fi
  if [ "$1" == "r" ]; then echo "do_2d_integration.R"; return 0; fi
  echo "ERROR: Unknown language: $1"
  exit 41
}

if [ ! "$(get_language_script_name julia)" == "do_2d_integration.jl" ] ; then echo "Internal error: the Julia script is 'do_2d_integration.jl'"; exit 41; fi
if [ ! "$(get_language_script_name matlab)" == "do_2d_integration.m" ] ; then echo "Internal error: the MATLAB script is 'do_2d_integration.m'"; exit 41; fi
if [ ! "$(get_language_script_name r)" == "do_2d_integration.R" ] ; then echo "Internal error: the R script is 'do_2d_integration.R'"; exit 41; fi

# Detect HPC cluster
hpc_cluster="unknown"

[[ "${HOSTNAME}" =~ ^cosmos[1-4].int.lunarc$ ]] && hpc_cluster="cosmos"
[[ "${HOSTNAME}" =~ ^login[1-4]$ ]] && hpc_cluster="dardel"
[[ "${HOSTNAME}" =~ ^b-an0[1-4].hpc2n.umu.se$ ]] && hpc_cluster="kebnekaise"
[[ "${HOSTNAME}" =~ ^pelle[1-4].uppmax.uu.se$ ]] && hpc_cluster="pelle"
[[ "${HOSTNAME}" =~ ^rackham[1-4].uppmax.uu.se$ ]] && hpc_cluster="rackham"
[[ "${HOSTNAME}" =~ ^tetralith[1-4].nsc.liu.se$ ]] && hpc_cluster="tetralith"

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
  echo "ERROR: '${hpc_cluster}' with hostname '${HOSTNAME}' is not valid hpc_cluster."
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

# Script filenames and URLs
slurm_script_name="do_${language}_2d_integration.sh"
echo "Slurm script name: ${slurm_script_name}"

base_url="https://raw.githubusercontent.com/UPPMAX/R-matlab-julia-HPC/refs/heads/main/docs/advanced/thread_parallelism"
slurm_script_url="${base_url}/${slurm_script_name}"
echo "Slurm script URL: ${slurm_script_url}"

language_script_name=$(get_language_script_name "${language}")
echo "Language script name: ${language_script_name}"
language_script_url="${base_url}/${language_script_name}"
echo "Language script URL: ${language_script_url}"

# Download Slurm script if absent, will do nothing on Bianca
if [ ! -f "${slurm_script_name}" ]; then
  echo "Script with name '${slurm_script_name}' not found."
  echo " "
  echo "This script can be downloaded from URL:"
  echo "${slurm_script_url}"
  echo " "
  echo "Attempting to download script:"
  # The '|| true' means 'continue even when the download failed
  wget "${slurm_script_url}" || true
  echo " "

  if [ ! -f "${slurm_script_name}" ]; then
    echo "ERROR: Slurm script with name '${slurm_script_name}' not found,"
    echo "even after attempting to download it from URL"
    echo "${slurm_script_url}"
    echo " "
    echo "Please provide the script manually."
    exit 42
  fi

fi

# Download language script if absent, will do nothing on Bianca
if [ ! -f "${language_script_name}" ]; then
  echo "Language script with name '${language_script_name}' not found."
  echo " "
  echo "This script can be downloaded from URL:"
  echo "${language_script_url}"
  echo " "
  echo "Attempting to download script:"
  # The '|| true' means 'continue even when the download failed
  wget "${language_script_url}" || true

  if [ ! -f "${language_script_name}" ]; then
    echo "ERROR: Language script with name '${language_script_name}' not found,"
    echo "even after attempting to download it from URL"
    echo "${language_script_url}"
    echo " "
    echo "Please provide the script manually."
    exit 42
  fi
fi

# Thread parallelism only makes sense on a single node
n_nodes=1

# Schedule all the jobs
for n_cores in $(seq 1 64)
do 
  if [ ${hpc_cluster} == "dardel" ] 
  then
    # Dardel needs to have a partition specified
    sbatch -A "${slurm_job_account}" --ntasks "${n_cores}" -p shared "${slurm_script_name}"
  else
    sbatch -A "${slurm_job_account}" -N "${n_nodes}" -n "${n_cores}" "${slurm_script_name}"
  fi
done
