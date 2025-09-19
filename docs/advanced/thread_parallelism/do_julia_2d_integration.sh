#!/bin/bash
#SBATCH --time=02:00:00
#
# Usage:
#
#   sbatch -A [account] -n [number_of_cores] do_julia_2d_integration.sh
#
# Example:
#
#   sbatch -A staff -n 1 do_julia_2d_integration.sh
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
  module load julia >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "bianca" ]
then
  module load julia/1.8.5 >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "cosmos" ]
then
  module load Julia/1.10.4-linux-x86_64 >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "dardel" ]
then
  module load PDC/24.11 julia/1.11.4-cpeAMD-24.11 >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "kebnekaise" ]
then
  module load julia >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "lumi" ]
then
  module load julia >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "pelle" ]
then
  module load Julia/1.11.3-linux-x86_64 >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "rackham" ]
then
  module load julia/1.8.5 >/dev/null 2>&1
fi

if [ ${hpc_cluster} == "tetralith" ]
then
  module load julia >/dev/null 2>&1
fi

echo "Slurm job account used: ${SLURM_JOB_ACCOUNT}"
echo "Number of cores booked in Slurm: ${SLURM_NPROCS}"

julia do_2d_integration.jl "${SLURM_NPROCS}"


