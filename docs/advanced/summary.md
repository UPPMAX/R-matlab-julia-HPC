# Summary advanced day

## Parallel computing

!!! important "Learning outcomes"

    - I can name and describe 3 types of parallel computation
    - I can explain at least 1 advantage of parallel computation
    - I can explain at least 2 disadvantages of parallel computation
    - I can explain how to use my computational resources effectively

## Thread parallelism

!!! important "Learning outcomes"

    - I can schedule jobs with thread parallelism
    - I can explain how jobs with thread parallelism are scheduled
    - I can explain how Julia/MATLAB/R code makes use of thread parallelism
    - I can explain the results of a correct benchmark
    - I can explain the results of an incorrect benchmark
    - I can argue why I should stick to my programming language,
      even if it is not the fastest

!!! info "Summary"

    - Threads are sharing memory with each-other
    - One thread per core

## Distributed parallelism

!!! important "Learning outcomes"

    - I can schedule jobs with distributed parallelism
    - I know the basic difference between threads and distributed memory in terms of memory share
    - I can explain how Julia/MATLAB/R code makes use of distributed parallelism

!!! info "Summary"

    - Memory and processes are distributed among tasks
    - Information sent between tasks only on demand
    - Native packages
        - own syntax and run with ``-p`` 
        - MATLAB
    - MPI external library
        - MPI-like syntax and run with ``mpirun -np`` command or similar.

## Big data

!!! important "Learning outcomes"

    - I understand how I can work with big data
    - I know where to find more information about big data

!!! info "Summary"

    - There are packages for all languages
        - Distributing parts of arrays
        - "Lazy computing"
    - Effective storage
        - Different file formats suits diffeent types of data
        - HDF5/NetCDF lets you load parts of the file into memory
    - Allocating memory
        - Allocate more cores
        - Use Slurm commands ``--mem=<size>GB`` or ``--mem-per-gpu=<size>GB``    

## Introduction to GPUs

!!! important "Learning outcomes"

    - I can explain the difference between a CPU and a GPU
    - I can use GPUs with my language

!!! info "Summary"

    - GPUs process simple functions rapidly, and are best suited for repetitive and highly-parallel computing tasks
    - There are GPUs on NSC/Tetralith, PDC/Dardel, C3SE/Alvis, HPC2N/Kebnekaise, LUNARC/Cosmos, UPPMAX/Pelle, but they are different
    - It varies between centres how you allocate a GPU
    - You need to use either batch or interactive/OpenOnDemand to use GPUs

## Machine Learning

!!! important "Learning outcomes"

    - I can check if an ML package is installed with a module
    - I can run ML code with my language

!!! info "Summary"

    - ML approaches
        - Supervised learning
        - Unsupervised learning
        - Reinforcement learning
    - When to use
        - When tasks are too complex or dynamic for a traditional algorithm
        - When you cannot define a set of rules to solve a problem
            - image recognition
            - spam detection
            - etc.    
        - When you have tasks involving large amounts of unstructured data (images, audio, etc.)
        - When you need to be able to easily adapt to new information over time 
