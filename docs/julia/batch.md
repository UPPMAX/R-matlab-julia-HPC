!!! info "Learning outcomes for today"

    - Short introduction to SLURM scheduler
    - Show structure of a batch script
    - Run the provided batch scrip examples

!!! info "Your expectations?"

    - What is a batch job?
    - How to make a batch job?
    - How can I run a Julia simulation in batch mode?


??? note "Instructor note"

    - Intro 5 min
    - Lecture and 10 min

!!! warning
    - Any longer, resource-intensive, or parallel jobs must be run through a **batch script**.

# Batch system

The batch system used at HPC clusters in Sweden is called SLURM.

SLURM is an Open Source job scheduler, which provides three key functions

- Keeps track of available system resources
- Enforces local system resource usage and job scheduling policies
- Manages a job queue, distributing work across resources according to policies

In order to run a batch job, you need to create and submit a SLURM submit file (also called a batch submit file, a batch script, or a job script).
Guides and documentation at: [HPC2N](http://www.hpc2n.umu.se/support){:target="_blank"}, [UPPMAX](https://docs.uppmax.uu.se/cluster_guides/slurm/){:target="_blank"},
[LUNARC](https://lunarc-documentation.readthedocs.io/en/latest/manual/submitting_jobs/manual_basic_job/){:target="_blank"}, and
[PDC](https://support.pdc.kth.se/doc/contact/contact_support/){:target="_blank"}.

**Workflow**

- Write a batch script

  - Inside the batch script you need to load the modules you need, for instance Julia
  - Possibly activate an isolated/virtual environment to access own-installed packages
  - Ask for resources depending on if it is a parallel job or a serial job, if you need GPUs or not, etc.
  - Give the command(s) to your Julia script

- Submit batch script with ``sbatch <my-julia-script.sh>``

Common file extensions for batch scripts are ``.sh`` or ``.batch``, but they are not necessary. You can choose any name that makes sense to you.

## Useful commands

- Submit job: ``sbatch <jobscript.sh>``
- Get list of your jobs: ``squeue -u <username>``
- Check on a specific job: ``scontrol show job <job-id>``
- Delete a specific job: ``scancel <job-id>``
- Useful info about a job: ``sacct -l -j <job-id> | less -S``
- Url to a page with info about the job (Kebnekaise only): ``job-usage <job-id>``

## Examples of batch scripts

### Serial code

!!! important "Hello World"

    Short serial example for running on different clusters.

    === "UPPMAX"

        ```bash
        #!/bin/bash -l  # -l cleans the environment in the batch job, recommended at UPPMAX
        #SBATCH -A naiss202t-uv-wxyz    # your project_ID
        #SBATCH --time=00:10:00        # Asking for 10 minutes
        #SBATCH -n 1                   # Asking for 1 core
        #SBATCH --error=job.%J.err     # error file
        #SBATCH --output=job.%J.out    # output file
        ml julia/1.8.5 # Julia module

        julia script.jl              # run the serial script
        ```

    === "HPC2N"

        ```bash
        #!/bin/bash
        #SBATCH -A hpc2n202w-xyz     # your project_ID
        #SBATCH -J job-serial        # name of the job
        #SBATCH -n 1                 # nr. tasks
        #SBATCH --time=00:03:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        ml purge  > /dev/null 2>&1   # recommended purge
        ml Julia/1.8.5-linux-x86_64  # Julia module

        julia script.jl              # run the serial script
        ```

    === "LUNARC"

        ```bash
        #!/bin/bash
        #SBATCH -A lu202w-x-yz       # your project_ID
        #SBATCH -J job-serial        # name of the job
        #SBATCH -n 1                 # nr. tasks
        #SBATCH --time=00:03:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        ml purge  > /dev/null 2>&1   # recommended purge
        ml Julia/1.8.5-linux-x86_64  # Julia module

        julia script.jl              # run the serial script
        ```

    === "PDC"

        ```bash
        #!/bin/bash
        #SBATCH -A naiss202t-uv-wxyz # your project_ID
        #SBATCH -J job-serial        # name of the job
        #SBATCH  -p shared           # name of the queue
        #SBATCH  --ntasks=1          # nr. of tasks
        #SBATCH --cpus-per-task=1    # nr. of cores per-task
        #SBATCH --time=00:03:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        # Load dependencies and Julia version
        ml PDC/23.12 julia/1.10.2-cpeGNU-23.12

        julia script.jl              # run the serial script
        ```

    === "NSC"

        ```bash
        #!/bin/bash
        #SBATCH -A naiss202t-uv-xyz  # your project_ID
        #SBATCH -J job-serial        # name of the job
        #SBATCH -n *FIXME*           # nr. tasks
        #SBATCH --time=00:20:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        # Load any modules you need, here for Julia
        ml julia/1.9.4-bdist

        julia script.jl              # run the serial script
        ```

    === "script.jl"

        Julia example code.

        ```julia
        y = "Hello World"
        println(y)
        ```

    Send the script to the batch:

    ```bash
    $ sbatch <batch script>
    ```

### Serial code + self-installed package in virt. env.


!!! important "Virtual environment"

    Short serial example for running on Julia with a virtual environment. Create an environment ``my-third-env``
    and install the package ``DFTK``. Here, there are batch scripts for using this environment (it is assumed that
    the batch scripts are in the ``my-third-env`` folder):

    === "UPPMAX"

        ```bash
        #!/bin/bash -l     # -l cleans the environment in the batch job, recommended at UPPMAX
        #SBATCH -A naiss202t-uv-wxyz  # Change to your own after the course
        #SBATCH --time=00:10:00       # Asking for 10 minutes
        #SBATCH -n 1                  # Asking for 1 core
        #SBATCH --error=job.%J.err    # error file
        #SBATCH --output=job.%J.out   # output file

        ml julia/1.8.5                # Julia module

        # Move to the directory where the ".toml" files for the environment are located
        julia --project=. serial-env.jl  # run the script
        ```


    === "HPC2N"

        ```bash
        #!/bin/bash
        #SBATCH -A hpc2n202w-xyz     # your project_ID
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
        ```

    === "LUNARC"

        ```bash
        #!/bin/bash
        #SBATCH -A lu202w-x-yz       # your project_ID
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
        ```

    === "PDC"

        ```bash
        #!/bin/bash
        #SBATCH -A naiss202t-uv-wxyz # your project_ID
        #SBATCH -J job-serial        # name of the job
        #SBATCH  -p shared           # name of the queue
        #SBATCH  --ntasks=1          # nr. of tasks
        #SBATCH --cpus-per-task=1    # nr. of cores per-task
        #SBATCH --time=00:03:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        # Load dependencies and Julia version
        ml PDC/23.12 julia/1.10.2-cpeGNU-23.12

        # Move to the directory where the ".toml" files
        # for the environment are located
        julia --project=. serial-env.jl  # run the script
        ```

    === "NSC"

        ```bash
        #!/bin/bash
        #SBATCH -A naiss202t-uv-xyz  # your project_ID
        #SBATCH -J job-serial        # name of the job
        #SBATCH -n *FIXME*           # nr. tasks
        #SBATCH --time=00:20:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        # Load any modules you need, here for Julia
        ml julia/1.9.4-bdist

        # Move to the directory where the ".toml" files
        # for the environment are located
        julia --project=. serial-env.jl  # run the script
        ```

    === "serial-env.jl"

        Julia example code where an environment is used.

        ```julia
            using Pkg
            Pkg.status()
        ```

    You should see the installed packages in the output file. In the present case
    because I installed the ``DFTK`` package only in ``my-third-env`` environment, I can
    see the following output:

    ```julia
    Status `/path-to-project-storage/my-third-env/Project.toml`
    [acf6eb54] DFTK v0.6.2
    ```

### Parallel code

!!! important "Required packages for parallel jobs"

    The ``Threaded`` and ``Distributed`` packages are included in the Base installation. However,
    in order to use MPI with Julia you will need to follow the next steps (only the first time):

    === "UPPMAX"

        ```bash
        # Load the tool chain which contains a MPI library
        $ ml gcc/11.3.0 openmpi/4.1.3
        # Load Julia
        $ ml Julia/1.8.5
        # Start Julia on the command line
        $ julia
        # Change to ``package mode`` and add the ``MPI`` package
        ```

        ```julia
        (v1.8) pkg> add MPI
        # In the ``julian`` mode run these commands:
        julia> using MPI
        julia> MPI.install_mpiexecjl()
                [ Info: Installing `mpiexecjl` to `/home/u/username/.julia/bin`...
                [ Info: Done!
        ```

        ```bash
        # Add the installed ``mpiexecjl`` wrapper to your path on the Linux command line
        $ export PATH=~/.julia/bin:$PATH
        # Now the wrapper should be available on the command line
        ```

    === "HPC2N"

        ```bash
        # Load the tool chain which contains a MPI library
        $ ml foss/2021b
        # Load Julia
        $ ml Julia/1.8.5-linux-x86_64
        # Start Julia on the command line
        $ julia
        # Change to ``package mode`` and add the ``MPI`` package
        ```

        ```julia
        (v1.8) pkg> add MPI
        # In the ``julian`` mode run these commands:
        $ julia> using MPI
        $ julia> MPI.install_mpiexecjl()
                [ Info: Installing `mpiexecjl` to `/home/u/username/.julia/bin`...
                [ Info: Done!
        ```

        ```bash
        # Add the installed ``mpiexecjl`` wrapper to your path on the Linux command line
        $ export PATH=/home/u/username/.julia/bin:$PATH
        # Now the wrapper should be available on the command line
        ```

    === "LUNARC"

        ```bash
        # Load the tool chain which contains a MPI library
        $ ml foss/2021b
        # Load Julia
        $ ml Julia/1.8.5-linux-x86_64
        # Start Julia on the command line
        $ julia
        # Change to ``package mode`` and add the ``MPI`` package
        ```

        ```julia
        (v1.8) pkg> add MPI
        # In the ``julian`` mode run these commands:
        julia> using MPI
        julia> MPI.install_mpiexecjl()
                [ Info: Installing `mpiexecjl` to `/home/u/username/.julia/bin`...
                [ Info: Done!
        ```

        ```bash
        # Add the installed ``mpiexecjl`` wrapper to your path on the Linux command line
        $ export PATH=/home/u/username/.julia/bin:$PATH
        # Now the wrapper should be available on the command line
        ```

    === "PDC"

        ```bash
        # Load the tool chain for Julia which already contains a MPI library
        $ ml PDC/23.12 julia/1.10.2-cpeGNU-23.12
        # Start Julia on the command line
        $ julia
        # Change to ``package mode`` and add the ``MPI`` package
        ```

        ```julia
        (v1.10) pkg> add MPI
        # In the ``julian`` mode run these commands:
        $ julia> using MPI
        $ julia> MPI.install_mpiexecjl()
                [ Info: Installing `mpiexecjl` to `/cfs/klemming/home/u/username/.julia/bin`...
                [ Info: Done!
        ```

        ```bash
        # Add the installed ``mpiexecjl`` wrapper to your path on the Linux command line
        $ export PATH=/cfs/klemming/home/u/username/.julia/bin:$PATH
        # Now the wrapper should be available on the command line
        ```

    === "NSC"

        ```bash
        # Load the tool chain which contains a MPI library
        $ ml buildtool-easybuild/4.8.0-hpce082752a2 foss/2023b
        # Load Julia
        $ ml julia/1.9.4-bdist
        # Start Julia on the command line
        $ julia
        # Change to ``package mode`` and add the ``MPI`` package
        ```

        ```julia
        (v1.9) pkg> add MPI
        # In the ``julian`` mode run these commands:
        $ julia> using MPI
        $ julia> MPI.install_mpiexecjl()
                [ Info: Installing `mpiexecjl` to `/home/username/.julia/bin`...
                [ Info: Done!
        ```

        ```bash
        # Add the installed ``mpiexecjl`` wrapper to your path on the Linux command line
        $ export PATH=/home/username/.julia/bin:$PATH
        # Now the wrapper should be available on the command line
        ```

!!! important "Julia scripts"

    === "serial.jl"

        ```julia
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
        ```

    === "threaded.jl"

        ```julia
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
        ```

    === "distributed.jl"

        ```julia
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
        ```

    === "mpi.jl"

        ```julia
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
        workload = div(n,numworkers)
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
        ```

!!! important "batch scripts"

    The corresponding batch scripts for these examples are given here:

    === "UPPMAX"

        === "serial.sh"

            ```bash
            #!/bin/bash -l
            #SBATCH -A naiss202t-uv-wxyz
            #SBATCH -J job
            #SBATCH -n 1
            #SBATCH --time=00:10:00
            #SBATCH --error=job.%J.err
            #SBATCH --output=job.%J.out

            ml julia/1.8.5

            # "time" command is optional
            time julia serial.jl
            ```

        === "threaded.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A naiss202t-uv-wxyz
            #SBATCH -J job
            #SBATCH -n 8
            #SBATCH --time=00:10:00
            #SBATCH --error=job.%J.err
            #SBATCH --output=job.%J.out

            ml julia/1.8.5

            # "time" command is optional
            time julia -t 8 threaded.jl
            ```

        === "distributed.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A naiss202t-uv-wxyz
            #SBATCH -J job
            #SBATCH -n 8
            #SBATCH --time=00:10:00
            #SBATCH --error=job.%J.err
            #SBATCH --output=job.%J.out

            ml julia/1.8.5

            # "time" command is optional
            time julia -p 8 distributed.jl
            ```

        === "mpi.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A naiss202t-uv-wxyz
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
            ```

    === "HPC2N"

        === "serial.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A hpc2n202w-xyz
            #SBATCH -J job
            #SBATCH -n 1
            #SBATCH --time=00:10:00
            #SBATCH --error=job.%J.err
            #SBATCH --output=job.%J.out

            ml purge  > /dev/null 2>&1
            ml Julia/1.8.5-linux-x86_64

            # "time" command is optional
            time julia serial.jl
            ```

        === "threaded.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A hpc2n202w-xyz
            #SBATCH -J job
            #SBATCH -n 8
            #SBATCH --time=00:10:00
            #SBATCH --error=job.%J.err
            #SBATCH --output=job.%J.out

            ml purge  > /dev/null 2>&1
            ml Julia/1.8.5-linux-x86_64

            # "time" command is optional
            time julia -t 8 threaded.jl
            ```

        === "distributed.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A hpc2n202w-xyz
            #SBATCH -J job
            #SBATCH -n 8
            #SBATCH --time=00:10:00
            #SBATCH --error=job.%J.err
            #SBATCH --output=job.%J.out

            ml purge  > /dev/null 2>&1
            ml Julia/1.8.5-linux-x86_64

            # "time" command is optional
            time julia -p 8 distributed.jl
            ```

        === "mpi.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A hpc2n202w-xyz
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
            ```

    === "LUNARC"

        === "serial.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A lu202w-x-yz
            #SBATCH -J job
            #SBATCH -n 1
            #SBATCH --time=00:10:00
            #SBATCH --error=job.%J.err
            #SBATCH --output=job.%J.out

            ml purge  > /dev/null 2>&1
            ml Julia/1.8.5-linux-x86_64

            # "time" command is optional
            time julia serial.jl
            ```

        === "threaded.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A lu202w-x-yz
            #SBATCH -J job
            #SBATCH -n 8
            #SBATCH --time=00:10:00
            #SBATCH --error=job.%J.err
            #SBATCH --output=job.%J.out

            ml purge  > /dev/null 2>&1
            ml Julia/1.8.5-linux-x86_64

            # "time" command is optional
            time julia -t 8 threaded.jl
            ```

        === "distributed.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A lu202w-x-yz
            #SBATCH -J job
            #SBATCH -n 8
            #SBATCH --time=00:10:00
            #SBATCH --error=job.%J.err
            #SBATCH --output=job.%J.out

            ml purge  > /dev/null 2>&1
            ml Julia/1.8.5-linux-x86_64

            # "time" command is optional
            time julia -p 8 distributed.jl
            ```

        === "mpi.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A lu202w-x-yz
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
            ```

    === "PDC"

        === "serial.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A naiss202t-uv-wxyz # your project_ID
            #SBATCH -J job               # name of the job
            #SBATCH  -p shared           # name of the queue
            #SBATCH  --ntasks=1          # nr. of tasks
            #SBATCH --cpus-per-task=1    # nr. of cores per-task
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file

            # Load dependencies and Julia version
            ml PDC/23.12 julia/1.10.2-cpeGNU-23.12

            # "time" command is optional
            time julia serial.jl
            ```

        === "threaded.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A naiss202t-uv-wxyz # your project_ID
            #SBATCH -J job               # name of the job
            #SBATCH  -p shared           # name of the queue
            #SBATCH  --ntasks=1          # nr. of tasks
            #SBATCH --cpus-per-task=8    # nr. of cores per-task
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file

            # Load dependencies and Julia version
            ml PDC/23.12 julia/1.10.2-cpeGNU-23.12

            # "time" command is optional
            time julia -t 8 threaded.jl
            ```

        === "distributed.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A naiss202t-uv-wxyz # your project_ID
            #SBATCH -J job               # name of the job
            #SBATCH  -p shared           # name of the queue
            #SBATCH  --ntasks=1          # nr. of tasks
            #SBATCH --cpus-per-task=8    # nr. of cores per-task
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file

            # Load dependencies and Julia version
            ml PDC/23.12 julia/1.10.2-cpeGNU-23.12

            # "time" command is optional
            time julia -p 8 distributed.jl
            ```

        === "mpi.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A naiss202t-uv-wxyz # your project_ID
            #SBATCH -J job               # name of the job
            #SBATCH  -p shared           # name of the queue
            #SBATCH  --ntasks=8          # nr. of tasks
            #SBATCH --cpus-per-task=1    # nr. of cores per-task
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file

            # Load dependencies and Julia version
            ml PDC/23.12 julia/1.10.2-cpeGNU-23.12

            # export the PATH of the Julia MPI wrapper
            export PATH=/cfs/klemming/home/u/username/.julia/bin:$PATH

            time mpiexecjl -np 8 julia mpi.jl
            ```

    === "NSC"

        === "serial.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A naiss202t-uv-wxyz # your project_ID
            #SBATCH -J job               # name of the job
            #SBATCH -n 1                 # nr. of tasks
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file

            # Load dependencies and Julia version
            ml julia/1.9.4-bdist

            # "time" command is optional
            time julia serial.jl
            ```

        === "threaded.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A naiss202t-uv-wxyz # your project_ID
            #SBATCH -J job               # name of the job
            #SBATCH -n 8                 # nr. of tasks
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file

            # Load dependencies and Julia version
            ml julia/1.9.4-bdist

            # "time" command is optional
            time julia -t 8 threaded.jl
            ```

        === "distributed.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A naiss202t-uv-wxyz # your project_ID
            #SBATCH -J job               # name of the job
            #SBATCH -n 8                 # nr. of tasks
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file

            # Load dependencies and Julia version
            ml julia/1.9.4-bdist

            # "time" command is optional
            time julia -p 8 distributed.jl
            ```

        === "mpi.sh"

            ```bash
            #!/bin/bash
            #SBATCH -A naiss202t-uv-wxyz # your project_ID
            #SBATCH -J job               # name of the job
            #SBATCH -n 8                 # nr. of tasks
            #SBATCH --time=00:03:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file

            # Load dependencies and Julia version
            ml buildtool-easybuild/4.8.0-hpce082752a2 foss/2023b
            ml julia/1.9.4-bdist

            # export the PATH of the Julia MPI wrapper
            export PATH=/home/username/.julia/bin:$PATH

            time mpiexecjl -np 8 julia mpi.jl
            ```

### Cluster Managers

The package *ClusterManagers.jl* allows you to submit expensive parts of your simulation
to the batch queue in a more *interactive* manner than by using batch scripts. *ClusterManagers.jl*
needs to be installed through **Pkg**. This can useful, for instance if you are developing some
code where just specific parts are computationally heavy while the rest is related to data analysis
or visualization. In order to use this package, you should add it in a Julia session.

```julia
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
addprocs(SlurmManager(2), A="project_ID", partition="name-of-partition", t="00:05:00", c="2")

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
```

# Exercises

## Exercise 1. Run a serial script

Run the serial script ``serial-sum.jl``:

```julia 
    x = parse( Int32, ARGS[1] )
    y = parse( Int32, ARGS[2] )
    summ = x + y
    println("The sum of the two numbers is ", summ)
```

This scripts accepts two integers as command line arguments.


??? hint "Answer"

    === "HPC2N"

        This batch script is for Kebnekaise.

        ```bash
        #!/bin/bash
        #SBATCH -A hpc2n202w-xyz     # your project_ID
        #SBATCH -J job-serial        # name of the job
        #SBATCH -n 1                 # nr. tasks
        #SBATCH --time=00:03:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        ml purge  > /dev/null 2>&1   # recommended purge
        ml Julia/1.8.5-linux-x86_64  # Julia module

        julia serial-sum.jl Arg1 Arg2    # run the serial script
        ```

    === "UPPMAX"

        This batch script is for UPPMAX.

        ```bash
        #!/bin/bash -l
        #SBATCH -A naiss202t-uv-wxyz # Change to your own after the course
        #SBATCH -J job-serial        # name of the job
        #SBATCH -n 1                 # nr. tasks
        #SBATCH --time=00:05:00 # Asking for 5 minutes
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file
        module load julia/1.8.5

        julia serial-sum.jl Arg1 Arg2    # run the serial script
        ```

    === "LUNARC"

        This batch script is for LUNARC.

        ```bash
        #!/bin/bash
        #SBATCH -A lu202w-x-yz       # your project_ID
        #SBATCH -J job-serial        # name of the job
        #SBATCH -n 1                 # nr. tasks
        #SBATCH --time=00:03:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        ml purge  > /dev/null 2>&1   # recommended purge
        ml Julia/1.8.5-linux-x86_64  # Julia module

        julia serial-sum.jl Arg1 Arg2    # run the serial script
        ```

    === "PDC"

        This batch script is for PDC.

        ```bash
        #!/bin/bash
        #SBATCH -A naiss202t-uv-wxyz # your project_ID
        #SBATCH -J job               # name of the job
        #SBATCH  -p shared           # name of the queue
        #SBATCH  --ntasks=1          # nr. of tasks
        #SBATCH --cpus-per-task=1    # nr. of cores per-task
        #SBATCH --time=00:03:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        # Load dependencies and Julia version
        ml PDC/23.12 julia/1.10.2-cpeGNU-23.12

        julia serial-sum.jl Arg1 Arg2    # run the serial script
        ```

    === "NSC"
        
        This batch script is for NSC.

        ```bash
        #!/bin/bash
        #SBATCH -A naiss202t-uv-wxyz # your project_ID
        #SBATCH -J job               # name of the job
        #SBATCH -n 1                 # nr. tasks
        #SBATCH --time=00:04:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        ml julia/1.9.4-bdist

        julia serial-sum.jl Arg1 Arg2    # run the serial script
        ```

!!! summary

   - The SLURM scheduler handles allocations to the calculation nodes
   - Batch jobs runs without interaction with user
   - A batch script consists of a part with SLURM parameters describing the allocation and a second part describing 
   the actual work within the job, for instance one or several Julia scripts.


