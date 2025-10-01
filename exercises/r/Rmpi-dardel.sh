#!/bin/bash -l
#SBATCH -A naiss2025-22-934
# Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH --nodes 2
#SBATCH --ntasks-per-node=8
#SBATCH -p main
#SBATCH --output=pbdMPI-test_%J.out

ml PDC/24.11
ml R/4.4.2-cpeGNU-24.11

# Note: Rmpi does not work for PDC 
# Instead you first need to install “pbdMPI”. You can find the tarball in 
# /cfs/klemming/projects/supr/courses-fall-2025/pbdMPI_0.5-4.tar.gz 
# Copy it to your own subdirectory under the project directory and then do: 
# module load PDC/24.11 R/4.4.2-cpeGNU-24.11, and then 
# R CMD INSTALL pbdMPI_0.5-4.tar.gz --configure-args=" --with-mpi-include=/opt/cray/pe/mpich/8.1.28/ofi/gnu/12.3/include --with-mpi-libpath=/opt/cray/pe/mpich/8.1.28/ofi/gnu/12.3/lib --with-mpi-type=MPICH2" --no-test-load

srun -n 4 Rscript pbdMPI.R
