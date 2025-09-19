#!/bin/bash
#SBATCH --time=02:00:00
#
# Usage:
#
#   sbatch -A [account] -n [number_of_cores] do_matlab_2d_integration.sh
#
# Example:
#
#   sbatch -A staff -n 1 do_matlab_2d_integration.sh
#


# Detect HPC cluster from the worker node name

hpc_cluster="unknown"

[[ "${HOSTNAME}" =~ ^cn[0-9]{1,6}$ ]] && hpc_cluster="cosmos"
[[ "${HOSTNAME}" =~ ^nid[0-9]{1,6}$ ]] && hpc_cluster="dardel"
[[ "${HOSTNAME}" =~ ^b-cn[0-9]{1,6}$ ]] && hpc_cluster="kebnekaise"
[[ "${HOSTNAME}" =~ ^p[0-9]{1,6}$ ]] && hpc_cluster="pelle"
[[ "${HOSTNAME}" =~ ^r[0-9]{1,6}$ ]] && hpc_cluster="rackham"
[[ "${HOSTNAME}" =~ ^n[0-9]{1,6}$ ]] && hpc_cluster="tetralith"

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

if [ ${hpc_cluster} == "alvis" ]
then
  echo "No idea which modules to load"
fi

if [ ${hpc_cluster} == "bianca" ]
then
  module load matlab/R2023b >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "cosmos" ]
then
  module purge > /dev/null 2>&1
  module load matlab/2023b >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "dardel" ]
then
  module load PDC/23.12 R/4.4.1-cpeGNU-23.12 rocm/5.7.0 >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "kebnekaise" ]
then
  module purge >/dev/null 2>&1
  module load MATLAB/2023a.Update4 >/dev/null 2>&1


fi

if [ ${hpc_cluster} == "lumi" ]
then
  echo "No idea which modules to load"
fi

if [ ${hpc_cluster} == "pelle" ]
then
  module load matlab/R2023b >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "rackham" ]
then
  module load matlab/R2023b >/dev/null 2>&1

  # Need this only once
  configCluster.sh ${SLURM_JOB_ACCOUNT}
fi

if [ ${hpc_cluster} == "tetralith" ]
then
  module load MATLAB/2024a-hpc1-bdist >/dev/null 2>&1
fi

echo "Slurm job account used: ${SLURM_JOB_ACCOUNT}"
echo "Number of cores booked in Slurm: ${SLURM_NPROCS}"

matlab -nodisplay -nosplash -r do_2d_integration.m "${SLURM_NPROCS}"
