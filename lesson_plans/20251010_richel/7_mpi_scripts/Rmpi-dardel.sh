#!/bin/bash -l
#SBATCH -A naiss2025-22-262
# Asking for 10 min.
#SBATCH -t 00:10:00
#SBATCH --nodes 2
#SBATCH --ntasks-per-node=8
#SBATCH -p main
#SBATCH --output=pbdMPI-test_%J.out

# If you do ml purge you also need to restore the preloaded modules which you should have saved
# when you logged in. Otherwise comment out the two following lines.
ml purge > /dev/null 2>&1
ml restore preload
ml PDC/23.12
ml R/4.4.1-cpeGNU-23.12

# Note: Rmpi does not work for PDC 
# Instead you first need to install “pbdMPI”. You can find the tarball in 
# /cfs/klemming/projects/snic/r-matlab-julia-naiss/pbdMPI_0.5-2.tar.gz. 
# Copy it to your own subdirectory under the project directory and then do: 
# module load PDC/23.12 R/4.4.1-cpeGNU-23.12, and then 
# R CMD INSTALL pbdMPI_0.5-2.tar.gz --configure-args=" --with-mpi-include=/opt/cray/pe/mpich/8.1.28/ofi/gnu/12.3/include --with-mpi-libpath=/opt/cray/pe/mpich/8.1.28/ofi/gnu/12.3/lib --with-mpi-type=MPICH2" --no-test-load

srun -n 4 Rscript pbdMPI.R
