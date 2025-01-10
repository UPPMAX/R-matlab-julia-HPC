Running Julia in batch mode
============================

.. questions::

   - What is a batch job?
   - How to make a batch job?

   
   
.. objectives:: 

   - Short introduction to SLURM scheduler
   - Show structure of a batch script
   - Try example

.. admonition:: Compute allocations in this workshop 

   - Rackham: ``naiss2024-22-1202``
   - Kebnekaise: ``hpc2n2024-114``
   - Cosmos: ``lu2024-7-80``

.. admonition:: Storage space for this workshop 

   - Rackham: ``/proj/r-py-jl-m-rackham``
   - Kebnekaise: ``/proj/nobackup/r-py-jl-m``
   - Cosmos: ``<your own good place>``

.. warning::

   - Any longer, resource-intensive, or parallel jobs must be run through a **batch script**.


The batch system used at LUNARC, UPPMAX and HPC2N is called SLURM. 

SLURM is an Open Source job scheduler, which provides three key functions

- Keeps track of available system resources
- Enforces local system resource usage and job scheduling policies
- Manages a job queue, distributing work across resources according to policies

In order to run a batch job, you need to create and submit a SLURM submit file (also called a batch submit file, a batch script, or a job script).
Guides and documentation at: `HPC2N <http://www.hpc2n.umu.se/support>`_, `UPPMAX <https://docs.uppmax.uu.se/cluster_guides/slurm/>`_,
and `LUNARC <https://lunarc-documentation.readthedocs.io/en/latest/manual/submitting_jobs/manual_basic_job/>`_.

**Workflow**

- Write a batch script

  - Inside the batch script you need to load the modules you need, for instance Julia
  - Possibly activate an isolated/virtual environment to access own-installed packages
  - Ask for resources depending on if it is a parallel job or a serial job, if you need GPUs or not, etc.
  - Give the command(s) to your Julia script

- Submit batch script with ``sbatch <my-julia-script.sh>`` 

Common file extensions for batch scripts are ``.sh`` or ``.batch``, but they are not necessary. You can choose any name that makes sense to you. 

Useful commands to the batch system
-----------------------------------

- Submit job: ``sbatch <jobscript.sh>``
- Get list of your jobs: ``squeue -u <username>``
- Check on a specific job: ``scontrol show job <job-id>``
- Delete a specific job: ``scancel <job-id>``
- Useful info about a job: ``sacct -l -j <job-id> | less -S``
- Url to a page with info about the job (Kebnekaise only): ``job-usage <job-id>``
         
Examples of batch scripts for Julia
-----------------------------------

Serial code
'''''''''''

.. tabs::

   .. tab:: UPPMAX

        Short serial example script for running on Rackham with Julia v. 1.8.5 

        .. code-block:: bash

            #!/bin/bash -l                 # -l cleans the environment in the batch job, recommended at UPPMAX
            #SBATCH -A naiss2024-22-1202    # your project_ID
            #SBATCH --time=00:10:00        # Asking for 10 minutes
            #SBATCH -n 1                   # Asking for 1 core
            #SBATCH --error=job.%J.err     # error file
            #SBATCH --output=job.%J.out    # output file                                                                                                        
            ml julia/1.8.5 # Julia module
           
            julia serial.jl              # run the serial script
            

   .. tab:: HPC2N

        Short serial example for running on Kebnekaise with Julia v. 1.8.5
       
        .. code-block:: bash
   
            #!/bin/bash            
            #SBATCH -A hpc2n2024-114     # your project_ID       
            #SBATCH -J job-serial        # name of the job         
            #SBATCH -n 1                 # nr. tasks  
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file                                                                                                                                                                         


            ml purge  > /dev/null 2>&1   # recommended purge
            ml Julia/1.8.5-linux-x86_64  # Julia module
                       
            julia serial.jl              # run the serial script
            
   .. tab:: LUNARC

        Short serial example for running on Cosmos with Julia v. 1.8.5
       
        .. code-block:: bash
   
            #!/bin/bash            
            #SBATCH -A lu2024-7-80      # your project_ID       
            #SBATCH -J job-serial        # name of the job         
            #SBATCH -n 1                 # nr. tasks  
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file                                                                                                                                                                         


            ml purge  > /dev/null 2>&1   # recommended purge
            ml Julia/1.8.5-linux-x86_64  # Julia module
                       
            julia serial.jl              # run the serial script
            

   .. tab:: serial.jl 
   
        Julia example code.
   
        .. code-block:: julia
        
            y = "Hello World"
            println(y)

        
Serial code + self-installed package in virt. env. 
''''''''''''''''''''''''''''''''''''''''''''''''''

.. tabs::

   .. tab:: UPPMAX

        Short serial example for running on Rackham. Loading Julia v. 1.8.5 and using any Julia packages you have installed
        with virtual environment. 

        .. code-block:: bash
        
            #!/bin/bash -l               # -l cleans the environment in the batch job, recommended at UPPMAX
            #SBATCH -A naiss2024-22-1202   # Change to your own after the course
            #SBATCH --time=00:10:00       # Asking for 10 minutes
            #SBATCH -n 1                  # Asking for 1 core
            #SBATCH --error=job.%J.err    # error file
            #SBATCH --output=job.%J.out   # output file                                                                                             
            
            ml julia/1.8.5                # Julia module
             
            # Move to the directory where the ".toml" files for the environment are located
            julia --project=. serial-env.jl  # run the script 

        If this works, you will see the installed packages in the output file. In the present case
        because I installed the ``DFTK`` package only in ``my-third-env`` environment, I can 
        see the following output:

        .. code-block:: sh

            Status `path/Julia-Test/my-third-env/Project.toml`
            [acf6eb54] DFTK v0.6.2

   .. tab:: HPC2N

        Short serial example for running on Kebnekaise. Loading Julia v. 1.8.5 and using any Julia packages you have installed
        with virtual environment. 
       
        .. code-block:: bash

            #!/bin/bash            
            #SBATCH -A hpc2n2024-114     # your project_ID       
            #SBATCH -J job-serial        # name of the job         
            #SBATCH -n 1                 # nr. tasks  
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file                               
            ml purge  > /dev/null 2>&1   # recommended purge
            ml Julia/1.8.5-linux-x86_64  # Julia module
                       
            # Move to the directory where the ".toml" files 
            # for the environment are located
            julia --project=. serial-env.jl  # run the script 

        If this works, you will see the installed packages in the output file. In the present case
        because I installed the ``DFTK`` package only in ``my-third-env`` environment, I can 
        see the following output:

        .. code-block:: sh

            Status `/pfs/proj/nobackup/path/Julia-Test/my-third-env/Project.toml`
            [acf6eb54] DFTK v0.6.2

   .. tab:: LUNARC

        Short serial example for running on Cosmos. Loading Julia v. 1.8.5 and using any Julia packages you have installed
        with virtual environment.

        .. code-block:: bash
   
            #!/bin/bash            
            #SBATCH -A lu2024-7-80      # your project_ID       
            #SBATCH -J job-serial        # name of the job         
            #SBATCH -n 1                 # nr. tasks  
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file                                                                                                                                                                         


            ml purge  > /dev/null 2>&1   # recommended purge
            ml Julia/1.8.5-linux-x86_64  # Julia module

            # Move to the directory where the ".toml" files 
            # for the environment are located
            julia --project=. serial-env.jl  # run the script 

        If this works, you will see the installed packages in the output file. In the present case
        because I installed the ``DFTK`` package only in ``my-third-env`` environment, I can 
        see the following output:

        .. code-block:: sh

            Status `/path-to-your-folder/Julia-Test/my-third-env/Project.toml`
            [acf6eb54] DFTK v0.6.2                       
            julia serial.jl              # run the serial script


   .. tab:: serial-env.jl 
   
        Julia example code where an environment is used.
   
        .. code-block:: julia
        
            using Pkg
            Pkg.status()




Parallel code
'''''''''''''

.. tabs::

   .. tab:: UPPMAX

        The ``Threaded`` and ``Distributed`` packages are included in the Base installation. However, 
        in order to use MPI with Julia you will need to follow the next steps (only the first time): 

        .. code-block:: console

            # Load the tool chain which contains a MPI library
            $ ml gcc/11.3.0 openmpi/4.1.3
            # Load Julia
            $ ml Julia/1.8.5
            # Start Julia on the command line
            $ julia 
            # Change to ``package mode`` and add the ``MPI`` package 
            (v1.8) pkg> add MPI 

        - In the ``julian`` mode run these commands:

        .. code-block:: julia

            julia> using MPI 
            julia> MPI.install_mpiexecjl() 
                 [ Info: Installing `mpiexecjl` to `/home/u/username/.julia/bin`...
                 [ Info: Done!

        .. code-block:: console

            # Add the installed ``mpiexecjl`` wrapper to your path on the Linux command line
            $ export PATH=~/.julia/bin:$PATH
            # Now the wrapper should be available on the command line 
            

   .. tab:: HPC2N

        The ``Threaded`` and ``Distributed`` packages are included in the Base installation. However, 
        in order to use MPI with Julia you will need to follow the next steps (only the first time): 
       
        .. code-block:: console
      
            # Load the tool chain which contains a MPI library
            $ ml foss/2021b
            # Load Julia
            $ ml Julia/1.8.5-linux-x86_64
            # Start Julia on the command line
            $ julia 
            # Change to ``package mode`` and add the ``MPI`` package 
            (v1.8) pkg> add MPI 
            # In the ``julian`` mode run these commands:

        .. code-block:: julia
        
            julia> using MPI 
            julia> MPI.install_mpiexecjl() 
                 [ Info: Installing `mpiexecjl` to `/home/u/username/.julia/bin`...
                 [ Info: Done!

        .. code-block:: console

            # Add the installed ``mpiexecjl`` wrapper to your path on the Linux command line
            $ export PATH=/home/u/username/.julia/bin:$PATH
            # Now the wrapper should be available on the command line 

   .. tab:: LUNARC

        The ``Threaded`` and ``Distributed`` packages are included in the Base installation. However, 
        in order to use MPI with Julia you will need to follow the next steps (only the first time): 
       
        .. code-block:: console
      
            # Load the tool chain which contains a MPI library
            $ ml foss/2021b
            # Load Julia
            $ ml Julia/1.8.5-linux-x86_64
            # Start Julia on the command line
            $ julia 
            # Change to ``package mode`` and add the ``MPI`` package 
            (v1.8) pkg> add MPI 
            # In the ``julian`` mode run these commands:

        .. code-block:: julia
        
            julia> using MPI 
            julia> MPI.install_mpiexecjl() 
                 [ Info: Installing `mpiexecjl` to `/home/u/username/.julia/bin`...
                 [ Info: Done!

        .. code-block:: console

            # Add the installed ``mpiexecjl`` wrapper to your path on the Linux command line
            $ export PATH=/home/u/username/.julia/bin:$PATH
            # Now the wrapper should be available on the command line 

.. tabs:: 

   .. tab:: serial.jl 

        .. code-block:: julia 

            # nr. of grid points
            n = 100000                                                                                                                                           
                    
            function integration2d_julia(n)
            # interval size
            h = π/n 
            # cummulative variable
            mysum = 0.0
            # regular integration in the X axis
            for i in 0:n-1
                x = h*(i+0.5)
            #   regular integration in the Y axis
                for j in 0:n-1
                y = h*(j + 0.5)
                mysum = mysum + sin(x+y)
                end   
            end        
            return mysum*h*h
            end          
                
            res = integration2d_julia(n)
            println(res)


   .. tab:: threaded.jl

        .. code-block:: julia 

            using .Threads                                                                                                                                       
            
            # nr. of grid points
            n = 100000
            
            # nr. of threads
            numthreads = nthreads()
            
            # array for storing partial sums from threads
            partial_integrals = zeros(Float64, numthreads)
            
            function integration2d_julia_threaded(n,numthreads,threadindex)
            # interval size
            h = π/convert(Float64,n)
            # cummulative variable
            mysum = 0.0
            # workload for each thread
            workload = convert(Int64, n/numthreads)
            # lower and upper integration limits for each thread
            lower_lim = workload * (threadindex - 1)
            upper_lim  = workload * threadindex -1
            
            ## regular integration in the X axis
            for i in lower_lim:upper_lim
                x = h*(i + 0.5)
            #   regular integration in the Y axis
                for j in 0:n-1
                y = h*(j + 0.5)
                mysum = mysum + sin(x+y)
                end
            end
            partial_integrals[threadindex] = mysum*h*h
            return
            end
            
            # The threads can compute now the partial summations
            @threads for i in 1:numthreads
                integration2d_julia_threaded(n,numthreads,threadid())
            end
            
            # The main thread now reduces the array
            total_sum = sum(partial_integrals)
            
            println("The integral value is $total_sum")

   .. tab:: distributed.jl

        .. code-block:: julia 

            @everywhere begin                                                                                                                                    
            using Distributed
            using SharedArrays
            end
            
            # nr. of grid points
            n = 100000
            
            # nr. of workers
            numworkers = nworkers()
            
            # array for storing partial sums from workers
            partial_integrals = SharedArray( zeros(Float64, numworkers) )
            
            @everywhere function integration2d_julia_distributed(n,numworkers,workerid,A::SharedArray)
            # interval size
            h = π/convert(Float64,n)
            # cummulative variable
            mysum = 0.0
            # workload for each worker
            workload = convert(Int64, n/numworkers)
            # lower and upper integration limits for each thread
            lower_lim = workload * (workerid - 2)
            upper_lim = workload * (workerid - 1) -1
            
            # regular integration in the X axis
            for i in lower_lim:upper_lim
                x = h*(i + 0.5)
            #   regular integration in the Y axis
                for j in 0:n-1
                y = h*(j + 0.5)
                mysum = mysum + sin(x+y)
                end
            end
            A[workerid-1] = mysum*h*h
            return
            end
            
            # The workers can compute now the partial summations
            @sync @distributed for i in 1:numworkers
                integration2d_julia_distributed(n,numworkers,myid(),partial_integrals)
            end
            
            # The main process now reduces the array
            total_sum = sum(partial_integrals)
            
            println("The integral value is $total_sum")


   .. tab:: mpi.jl

        .. code-block:: julia 

            using MPI
            MPI.Init()
            
            # Initialize the communicator
            comm = MPI.COMM_WORLD
            # Get the ranks of the processes
            rank = MPI.Comm_rank(comm)
            # Get the size of the communicator
            size = MPI.Comm_size(comm)
            
            # root process
            root = 0
            
            # nr. of grid points
            n = 100000
            
            function integration2d_julia_mpi(n,numworkers,workerid)
            
            # interval size
            h = π/convert(Float64,n)
            # cummulative variable
            mysum = 0.0                                                                                                                                        
            # workload for each worker
            workload = convert(Int64, n/numworkers)
            # lower and upper integration limits for each thread
            lower_lim = workload * workerid
            upper_lim = workload * (workerid + 1) -1
            
            # regular integration in the X axis
            for i in lower_lim:upper_lim
                x = h*(i + 0.5)
            #   regular integration in the Y axis
                for j in 0:n-1
                y = h*(j + 0.5)
                mysum = mysum + sin(x+y)
                end
            end
            partial_integrals = mysum*h*h
            return partial_integrals
            end
            
            # The workers can compute now the partial summations
            p = integration2d_julia_mpi(n,size,rank)
            
            # The root process now reduces the array
            integral = MPI.Reduce(p,+,root, comm)
            
            if rank == root
            println("The integral value is $integral")
            end
            
            MPI.Finalize()

The corresponding batch scripts for these examples are given here:

.. tabs:: 

   .. tab:: UPPMAX 
   
      .. tabs::

         .. tab:: job-serial.sh  

            .. code-block:: bash
        
               #!/bin/bash -l
               #SBATCH -A naiss2024-22-1202
               #SBATCH -J job
               #SBATCH -n 1
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml julia/1.8.5
   
               # "time" command is optional
               time julia serial.jl


         .. tab:: job-threaded.sh 
   
            .. code-block:: bash
            
               #!/bin/bash
               #SBATCH -A naiss2024-22-1202
               #SBATCH -J job
               #SBATCH -n 8
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml julia/1.8.5
   
               # "time" command is optional
               time julia -t 8 threaded.jl               
   
         .. tab:: job-distributed.sh 
   
   
            .. code-block:: bash
           
               #!/bin/bash
               #SBATCH -A naiss2024-22-1202
               #SBATCH -J job
               #SBATCH -n 8
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml julia/1.8.5
   
               # "time" command is optional
               time julia -p 8 distributed.jl  
   
         .. tab:: job-mpi.sh 
   
            .. code-block:: bash
           
               #!/bin/bash
               #SBATCH -A naiss2024-22-1202
               #SBATCH -J job
               #SBATCH -n 8
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml julia/1.8.5
               ml gcc/11.3.0 openmpi/4.1.3
               # "time" command is optional

               # export the PATH of the Julia MPI wrapper
               export PATH=~/.julia/bin:$PATH
   
               time mpiexecjl -np 8 julia mpi.jl
   
   .. tab:: HPC2N 
   
      .. tabs::

         .. tab:: job-serial.sh  

            .. code-block:: bash
        
               #!/bin/bash
               #SBATCH -A hpc2n2024-114
               #SBATCH -J job
               #SBATCH -n 1
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml purge  > /dev/null 2>&1
               ml Julia/1.8.5-linux-x86_64
   
               # "time" command is optional
               time julia serial.jl


         .. tab:: job-threaded.sh 
   
            .. code-block:: bash
            
               #!/bin/bash
               #SBATCH -A hpc2n2024-114
               #SBATCH -J job
               #SBATCH -n 8
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml purge  > /dev/null 2>&1
               ml Julia/1.8.5-linux-x86_64
   
               # "time" command is optional
               time julia -t 8 threaded.jl               
   
         .. tab:: job-distributed.sh 
   
   
            .. code-block:: sh
           
               #!/bin/bash
               #SBATCH -A hpc2n2024-114
               #SBATCH -J job
               #SBATCH -n 8
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml purge  > /dev/null 2>&1
               ml Julia/1.8.5-linux-x86_64
   
               # "time" command is optional
               time julia -p 8 distributed.jl  
   
         .. tab:: job-mpi.sh 
   
            .. code-block:: sh
           
               #!/bin/bash
               #SBATCH -A hpc2n2024-114
               #SBATCH -J job
               #SBATCH -n 8
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml purge  > /dev/null 2>&1
               ml Julia/1.8.5-linux-x86_64
               ml foss/2021b
   
               # export the PATH of the Julia MPI wrapper
               export PATH=/home/u/username/.julia/bin:$PATH
   
               time mpiexecjl -np 8 julia mpi.jl

   .. tab:: LUNARC 
   
      .. tabs::

         .. tab:: job-serial.sh  

            .. code-block:: bash
        
               #!/bin/bash
               #SBATCH -A lu2024-7-80
               #SBATCH -J job
               #SBATCH -n 1
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml purge  > /dev/null 2>&1
               ml Julia/1.8.5-linux-x86_64
   
               # "time" command is optional
               time julia serial.jl


         .. tab:: job-threaded.sh 
   
            .. code-block:: bash
            
               #!/bin/bash
               #SBATCH -A lu2024-7-80
               #SBATCH -J job
               #SBATCH -n 8
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml purge  > /dev/null 2>&1
               ml Julia/1.8.5-linux-x86_64
   
               # "time" command is optional
               time julia -t 8 threaded.jl               
   
         .. tab:: job-distributed.sh 
   
   
            .. code-block:: sh
           
               #!/bin/bash
               #SBATCH -A lu2024-7-80
               #SBATCH -J job
               #SBATCH -n 8
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml purge  > /dev/null 2>&1
               ml Julia/1.8.5-linux-x86_64
   
               # "time" command is optional
               time julia -p 8 distributed.jl  
   
         .. tab:: job-mpi.sh 
   
            .. code-block:: sh
           
               #!/bin/bash
               #SBATCH -A lu2024-7-80
               #SBATCH -J job
               #SBATCH -n 8
               #SBATCH --time=00:10:00
               #SBATCH --error=job.%J.err
               #SBATCH --output=job.%J.out
   
               ml purge  > /dev/null 2>&1
               ml Julia/1.8.5-linux-x86_64
               ml foss/2021b
   
               # export the PATH of the Julia MPI wrapper
               export PATH=/home/u/username/.julia/bin:$PATH
   
               time mpiexecjl -np 8 julia mpi.jl

 
GPU code
''''''''

In order to use the NVIDIA GPUs with Julia, you will need to load a CUDA toolkit module on the
cluster and install the ``CUDA`` package in Julia as in the next sequence of commands:


.. tabs::

   .. tab:: UPPMAX

      - This can only be done on Snowy or Bianca. 
      - Then either create an interactive session or make a batch job
      - CUDA is installed at system level so they do not need to be loaded. 
        
      - On snowy 
        
      .. code-block:: console
            
         $ interactive -A <proj> -n 1 -M snowy --gres=gpu:1  -t 3:00:00
         
         $ ml Julia/1.8.5   # Julia version
         $ julia
         (v1.8) pkg> add CUDA 
             Updating registry at `~/.julia/registries/General.toml`
             Resolving package versions...
             Installed CEnum ───────── v0.4.2
             ...
        
   .. tab:: HPC2N

        .. code-block:: console

            $ ml Julia/1.8.5-linux-x86_64   # Julia version
            $ ml CUDA/11.4.1                # CUDA toolkit module
            $ julia
            (v1.8) pkg> add CUDA 
                Updating registry at `~/.julia/registries/General.toml`
                Resolving package versions...
                Installed CEnum ───────── v0.4.2
                ...

   .. tab:: LUNARC

        .. code-block:: console

            $ ml Julia/1.8.5-linux-x86_64   # Julia version
            $ ml CUDA/11.4.1                # CUDA toolkit module
            $ julia
            (v1.8) pkg> add CUDA 
                Updating registry at `~/.julia/registries/General.toml`
                Resolving package versions...
                Installed CEnum ───────── v0.4.2
                ...

Once this initial setting is completed, you will be able to use the GPUs available on the
cluster. Here, there is a simple example for computing a matrix-matrix multiplication. As a 
reference point, we show the simulation on CPUs as well. 

.. tabs::

   .. tab:: UPPMAX

        Short GPU example for running on Snowy.         
       
        .. code-block:: sh

          
            #!/bin/bash -l
            #SBATCH -A naiss2024-22-1202    # your project_ID  
            #SBATCH -M snowy
            #SBATCH -p node
            #SBATCH --gres=gpu:1
            #SBATCH -N 1
            #SBATCH --job-name=juliaGPU         # create a short name for your job
            #SBATCH --time=00:15:00          # total run time limit (HH:MM:SS)
            #SBATCH --qos=short              # if test run t<15 min
            #SBATCH --mail-type=begin        # send email when job begins
            #SBATCH --mail-type=end          # send email when job ends
                       
            module load julia/1.8.5      # system CUDA works as of today
            julia script-gpu.jl
            

   .. tab:: HPC2N

        .. code-block:: sh

            #!/bin/bash            
            #SBATCH -A hpc2n2024-114     # your project_ID       
            #SBATCH -J job-serial        # name of the job         
            #SBATCH -n 1                 # nr. tasks  
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file  
            #SBATCH --gres=gpu:v100:1     # 1 GPU v100 card

            ml purge  > /dev/null 2>&1
            ml Julia/1.8.5-linux-x86_64
            ml CUDA/11.4.1

            julia script-gpu.jl

   .. tab:: LUNARC

        .. code-block:: sh

            #!/bin/bash            
            #SBATCH -A lu2024-7-80      # your project_ID       
            #SBATCH -J job-serial        # name of the job         
            #SBATCH -n 1                 # nr. tasks  
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file
            #Asking for one A100 GPU
            #SBATCH -p gpua100
            #SBATCH --gres=gpu:1              

            ml purge  > /dev/null 2>&1
            ml Julia/1.8.5-linux-x86_64
            ml CUDA/11.4.1

            julia script-gpu.jl

   .. tab:: script-gpu.jl 
   
        Julia GPU example code.
   
        .. code-block:: julia
         
            using CUDA 

            CUDA.versioninfo()

            N = 2^8
            x = rand(N, N)
            y = rand(N, N)

            A = CuArray(x)
            B = CuArray(y)

            # Calculation on CPU
            @time x*y
            # Calculation on GPU
            @time A*B

            # Calculation on CPU
            @time x*y
            # Calculation on GPU
            @time A*B
                 

Cluster Managers
''''''''''''''''

The package *ClusterManagers.jl* allows you to submit expensive parts of your simulation
to the batch queue in a more *interactive* manner than by using batch scripts. This can
useful, for instance if you are developing some code where just specific parts are computationally
heavy while the rest is related to data analysis or visualization. In order to use this 
package, you should add it in a Julia session.

.. code-block:: julia

    using Distributed, ClusterManagers
    # Adapted from: https://github.com/JuliaParallel/ClusterManagers.jl 
    # Arguments to the Slurm srun(1) command can be given as keyword
    # arguments to addprocs.  The argument name and value is translated to
    # a srun(1) command line argument as follows:
    # 1) If the length of the argument is 1 => "-arg value",
    #    e.g. t="0:1:0" => "-t 0:1:0"
    # 2) If the length of the argument is > 1 => "--arg=value"
    #    e.g. time="0:1:0" => "--time=0:1:0"
    # 3) If the value is the empty string, it becomes a flag value,
    #    e.g. exclusive="" => "--exclusive"
    # 4) If the argument contains "_", they are replaced with "-",
    #    e.g. mem_per_cpu=100 => "--mem-per-cpu=100"
    # Example: add 2 processes, with your project ID, allocated 5 min, and 2 cores
    addprocs(SlurmManager(2), A="project_ID", t="00:5:00", c="2")
    
    # Define a function that computes the square of a number
    @everywhere function square(x)
        return x^2
    end
    
    hosts = []
    result = []
    for i in workers()
            println(i)
    	host = fetch(@spawnat i gethostname())
    	push!(hosts, host)
    	result_partial = fetch(@spawnat i square(i))
    	push!(result, result_partial)
    end
    
    println(hosts)
    println(result)
    
    # The Slurm resource allocation is released when all the workers have
    # exited
    for i in workers()
    	rmprocs(i)
    end




Exercises
---------

.. challenge:: 1. Run a serial script
    
    Run the serial script ``serial-sum.jl``: 

            .. code-block:: julia

                x = parse( Int32, ARGS[1] )
                y = parse( Int32, ARGS[2] )
                summ = x + y
                println("The sum of the two numbers is ", summ)

    This scripts accepts two integers as command line arguments.

    .. solution:: Solution for HPC2N
        :class: dropdown
        
            This batch script is for Kebnekaise. 
            
            .. code-block:: sh
    
                #!/bin/bash            
                #SBATCH -A hpc2n2024-114     # your project_ID       
                #SBATCH -J job-serial        # name of the job         
                #SBATCH -n 1                 # nr. tasks  
                #SBATCH --time=00:03:00      # requested time
                #SBATCH --error=job.%J.err   # error file
                #SBATCH --output=job.%J.out  # output file                                                                                                                                                                         

                ml purge  > /dev/null 2>&1   # recommended purge
                ml Julia/1.8.5-linux-x86_64  # Julia module
                        
                julia serial-sum.jl Arg1 Arg2    # run the serial script

    .. solution:: Solution for UPPMAX
        :class: dropdown
        
            This batch script is for UPPMAX.
            
            .. code-block:: sh
    
                #!/bin/bash -l
                #SBATCH -A naiss2024-22-1202  # Change to your own after the course
                #SBATCH -J job-serial        # name of the job         
                #SBATCH -n 1                 # nr. tasks  
                #SBATCH --time=00:05:00 # Asking for 5 minutes
                #SBATCH --error=job.%J.err   # error file
                #SBATCH --output=job.%J.out  # output file                                                                                    
                module load julia/1.8.5
                
                julia serial-sum.jl Arg1 Arg2    # run the serial script
                
    .. solution:: Solution for HPC2N
        :class: dropdown
        
            This batch script is for Kebnekaise. 
            
            .. code-block:: sh
    
                #!/bin/bash            
                #SBATCH -A lu2024-7-80      # your project_ID       
                #SBATCH -J job-serial        # name of the job         
                #SBATCH -n 1                 # nr. tasks  
                #SBATCH --time=00:03:00      # requested time
                #SBATCH --error=job.%J.err   # error file
                #SBATCH --output=job.%J.out  # output file                                                                                                                                                                         

                ml purge  > /dev/null 2>&1   # recommended purge
                ml Julia/1.8.5-linux-x86_64  # Julia module
                        
                julia serial-sum.jl Arg1 Arg2    # run the serial script

.. challenge:: 2. Run the GPU script
    
    Run the following script ``script-gpu.jl``. Why are we running the simulations
    twice?
    Note that at UPPMAX you will need a project will access to Snowy

        .. code-block:: julia
         
            using CUDA 

            CUDA.versioninfo()

            N = 2^8
            x = rand(N, N)
            y = rand(N, N)

            A = CuArray(x)
            B = CuArray(y)

            # Calculation on CPU
            @time x*y
            # Calculation on GPU
            @time A*B

            # Calculation on CPU
            @time x*y
            # Calculation on GPU
            @time A*B

    .. solution:: Solution for HPC2N
        :class: dropdown
        
            This batch script is for Kebnekaise. We run the simulation twice because
            in this way, the reported time is more reliable for the computing time as
            in the first simulation, data transfer and other settings could be added to
            the reported time.
            
            .. code-block:: sh
                
                #!/bin/bash            
                #SBATCH -A hpc2n2024-114     # your project_ID       
                #SBATCH -J job-serial        # name of the job         
                #SBATCH -n 1                 # nr. tasks  
                #SBATCH --time=00:03:00      # requested time
                #SBATCH --error=job.%J.err   # error file
                #SBATCH --output=job.%J.out  # output file  
                #SBATCH --gres=gpu:v100:1     # 1 GPU v100 card

                ml purge  > /dev/null 2>&1
                ml Julia/1.8.5-linux-x86_64
                ml CUDA/11.4.1

                julia script-gpu.jl

            Output:
                0.689096 seconds (2.72 M allocations: 132.617 MiB, 6.27% gc time, 99.62% compilation time)

                1.194153 seconds (1.24 M allocations: 62.487 MiB, 3.41% gc time, 55.13% compilation time)

                0.000933 seconds (2 allocations: 512.047 KiB)

                0.000311 seconds (5 allocations: 192 bytes)

    .. solution:: Solution for UPPMAX
        :class: dropdown
        
            This batch script is for UPPMAX. Adding the numbers 2 and 3.
            
            .. code-block:: sh
    
                #!/bin/bash -l
                #SBATCH -A naiss2024-22-1202   # your project_ID  
                #SBATCH -M snowy
                #SBATCH -p node
                #SBATCH --gres=gpu:1
                #SBATCH -N 1
                #SBATCH --job-name=juliaGPU         # create a short name for your job
                #SBATCH --time=00:15:00          # total run time limit (HH:MM:SS)
                #SBATCH --qos=short              # if test run t<15 min
                
                ml julia/1.8.5

                julia script-gpu.jl

            Output:

                Downloading artifact: CUDNN
                Downloading artifact: CUTENSOR
                CUDA toolkit 11.7, artifact installation
                NVIDIA driver 525.85.12, for CUDA 12.0
                CUDA driver 12.0
                
                Libraries:
                - CUBLAS: 11.10.1
                - CURAND: 10.2.10
                - CUFFT: 10.7.2
                - CUSOLVER: 11.3.5
                - CUSPARSE: 11.7.3
                - CUPTI: 17.0.0
                - NVML: 12.0.0+525.85.12
                - CUDNN: 8.30.2 (for CUDA 11.5.0)
                - CUTENSOR: 1.4.0 (for CUDA 11.5.0)
                
                Toolchain:
                - Julia: 1.8.5
                - LLVM: 13.0.1
                - PTX ISA support: 3.2, 4.0, 4.1, 4.2, 4.3, 5.0, 6.0, 6.1, 6.3, 6.4, 6.5, 7.0, 7.1, 7.2
                - Device capability support: sm_35, sm_37, sm_50, sm_52, sm_53, sm_60, sm_61, sm_62, sm_70, sm_72, sm_75, sm_80, sm_86

                1 device:
                  0: Tesla T4 (sm_75, 14.605 GiB / 15.000 GiB available)
                  0.988437 seconds (2.72 M allocations: 132.556 MiB, 4.72% gc time, 99.10% compilation time)
                  5.707402 seconds (1.30 M allocations: 65.564 MiB, 0.72% gc time, 19.70% compilation time)
                  0.000813 seconds (2 allocations: 512.047 KiB)
                  0.000176 seconds (16 allocations: 384 bytes)

    .. solution:: Solution for LUNARC
        :class: dropdown
        
            This batch script is for Cosmos.

            .. code-block:: sh
                
                #!/bin/bash            
                #SBATCH -A lu2024-7-80      # your project_ID       
                #SBATCH -J job-serial        # name of the job         
                #SBATCH -n 1                 # nr. tasks  
                #SBATCH --time=00:03:00      # requested time
                #SBATCH --error=job.%J.err   # error file
                #SBATCH --output=job.%J.out  # output file  
                #Asking for one A100 GPU
                #SBATCH -p gpua100
                #SBATCH --gres=gpu:1   

                ml purge  > /dev/null 2>&1
                ml Julia/1.8.5-linux-x86_64
                ml CUDA/11.4.1

                julia script-gpu.jl
  
.. challenge:: 3. Machine Learning job on GPUs 
    
    Julia has already several packages for ML, one of them is ``Flux`` (https://fluxml.ai/). We will work with one of
    the test cases provided by ``Flux`` which deals with a data set of tiny images (CIFAR10). Follow this steps:

        - Create an environment called ``ML``, move to that environment directory and activate it 
        - Fetch the ``vgg_cifar10.jl`` test case from ``Flux`` repo (wget https://raw.githubusercontent.com/FluxML/model-zoo/master/vision/vgg_cifar10/vgg_cifar10.jl)
        - Load CUDA toolkit 11.4.1
        - Install (add) the following packages: CUDA, MLDatasets, MLUtils
        - The first time you use the data set CIFAR10, it will ask you to download it and accept. Do this in ``Julian`` mode:

        .. code-block:: julia
         
            julia> using MLDatasets: CIFAR10
            julia> x, y = CIFAR10(:train)[:]

        - Change the number of epochs in the ``vgg_cifar10.jl`` script from 50 to something shorter like 5.
        - Submit the job with the script: 

        .. code-block:: sh
        
            #!/bin/bash            
            #SBATCH -A hpc2n2024-114        # your project_ID       
            #SBATCH -J job-serial        # name of the job         
            #SBATCH -n 1                 # nr. tasks        #remove this line for UPPMAX  
            #SBATCH --time=00:15:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file  
            #SBATCH --gres=gpu:v100:1     # 1 GPU v100 card   #remove this line for UPPMAX
            # On Rackham use the follwing lines instead (rm one #) by subsituting the related HPC2N lines, se above
            ##SBATCH -M snowy
            ##SBATCH -p node
            ##SBATCH --gres=gpu:1
            ##SBATCH -N 1
            ##SBATCH --qos=short               

            ml purge  > /dev/null 2>&1
            ml Julia/1.8.5-linux-x86_64
            ml CUDA/11.4.1

            julia <fix-activate-environment> <fix-name-script>.jl 

    .. solution:: Solution for UPPMAX
        :class: dropdown
        
            .. code-block:: sh

               ml julia/1.8.5
               mkdir ML
               cd ML
               wget https://raw.githubusercontent.com/FluxML/model-zoo/master/vision/vgg_cifar10/vgg_cifar10.jl

               julia
               (v1.8) pkg> activate .
               (ML) pkg> add CUDA
               (ML) pkg> add Flux 
               (ML) pkg> add MLDatasets
               (ML) pkg> add MLUtils
               julia> using MLDatasets: CIFAR10
               julia> x, y = CIFAR10(:train)[:] 
 
            The batch script looks like:
            
            .. code-block:: sh
                
               #!/bin/bash -l
               #SBATCH -A naiss2024-22-1202        # your project_ID
               #SBATCH -J job-serial        # name of the job
               #SBATCH -M snowy
               #SBATCH -p node
               #SBATCH --gres=gpu:1
               #SBATCH -N 1
               #SBATCH --time=00:15:00      # requested time
               #SBATCH --qos=short               
               #SBATCH --error=job.%J.err   # error file
               #SBATCH --output=job.%J.out  # output file

               ml julia/1.8.5

               julia --project=. vgg_cifar10.jl



  
    .. solution:: Solution for HPC2N
        :class: dropdown
        
            .. code-block:: sh

               ml Julia/1.8.5-linux-x86_64
               ml CUDA/11.4.1 
               mkdir ML
               cd ML
               wget https://raw.githubusercontent.com/FluxML/model-zoo/master/vision/vgg_cifar10/vgg_cifar10.jl

               julia
               (v1.8) pkg> activate .
               (ML) pkg> add CUDA
               (ML) pkg> add Flux 
               (ML) pkg> add MLDatasets
               (ML) pkg> add MLUtils
               julia> using MLDatasets: CIFAR10
               julia> x, y = CIFAR10(:train)[:] 
 
            The batch script looks like:
            
            .. code-block:: sh
                
                #!/bin/bash            
                #SBATCH -A hpc2n2024-114     # your project_ID       
                #SBATCH -J job-serial        # name of the job         
                #SBATCH -n 1                 # nr. tasks  
                #SBATCH --time=00:20:00      # requested time
                #SBATCH --error=job.%J.err   # error file
                #SBATCH --output=job.%J.out  # output file  
                #SBATCH --gres=gpu:v100:1     # 1 GPU v100 card

                ml purge  > /dev/null 2>&1
                ml Julia/1.8.5-linux-x86_64
                ml CUDA/11.4.1

                julia --project=. vgg_cifar10.jl

            At HPC2N you can use the tool ``job-usage`` on the command line: 

            .. code-block:: sh
                
                job-usage job_ID   # job_ID number you get upon using sbatch      

            This will give you a URL that you can paste on your local browser. It would display
            statistics after a couple of minutes the job started.

  

.. keypoints::

   - The SLURM scheduler handles allocations to the calculation nodes
   - Batch jobs runs without interaction with user
   - A batch script consists of a part with SLURM parameters describing the allocation and a second part describing 
     the actual work within the job, for instance one or several Julia scripts.

    
