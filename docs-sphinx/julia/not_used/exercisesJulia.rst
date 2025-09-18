Exercises
=========

Introduction
------------

.. challenge:: Getting familiar with Julia REPL

    Is is important in this course that you know how to navigate on the
    Julia command line. This exercise will help you to become more familiar
    with the REPL. Do the following steps:

       * Start a Julia session. In the ``Julian`` mode, compute the sum the numbers
         5 and 6
       * Change to the ``shell`` mode and display the current directory
       * Now, go to the ``package`` mode and list the currently installed packages
       * Finally, display help information of the function ``println`` in ``help`` mode.



    .. solution:: Solution for the centres
        :class: dropdown

            .. code-block:: julia

                $ julia
                julia> 5 + 6
                julia>;
                shell> pwd
                julia>]
                pkg> status
                julia>?
                help?> println


Load and run
------------

.. challenge:: Loading modules and running scripts

    Load the Julia version 1.8.5 and run the following serial script (``serial-sum.jl``) which accepts two integer arguments as input:

            .. code-block:: julia

                x = parse( Int32, ARGS[1] )
                y = parse( Int32, ARGS[2] )
                summ = x + y
                println("The sum of the two numbers is ", summ)

    .. solution:: Solution for HPC2N
        :class: dropdown

            This batch script is for Kebnekaise.

            .. code-block:: sh

                $ ml purge  > /dev/null 2>&1       # recommended purge
                $ ml Julia/1.8.5-linux-x86_64      # Julia module

                $ julia serial-sum.jl Arg1 Arg2    # run the serial script

    .. solution:: Solution for UPPMAX
        :class: dropdown

            This batch script is for UPPMAX. Adding the numbers 2 and 3.

            .. code-block:: sh

                $ ml julia/1.8.5      # Julia module

                $ julia serial-sum.jl Arg1 Arg2    # run the serial script



Packages and isolated environments
----------------------------------

.. challenge:: Project environment

    Create a project environment called ``new-env`` and activate it. Then, install the
    package ``CSV`` in this environment. For your knowledge, ``CSV`` is a package that
    offers tools for dealing with ``.csv`` files. After this, check that this package
    was installed. Finally, deactivate the environment.

    .. solution:: Solution for both centres
        :class: dropdown

            .. code-block:: julia

                shell> mkdir new-env
                shell> cd new-env
                (@v1.8) pkg> activate .
                      Activating new project at `path-to-folder\new-env`
                (new-env) pkg> add CSV
                (new-env) pkg> status
                      Status `path-to-folder\new-env\Project.toml`
                      [336ed68f] CSV v0.10.9
                (new-env) pkg> activate


.. challenge:: Package environment

    Create a package environment called ``new_pack`` and activate it. Then, install the
    package ``CSV`` in this environment. For your knowledge, ``CSV`` is a package that
    offers tools for dealing with ``.csv`` files. After this, check that this package
    was installed. Finally, deactivate the environment.

    .. solution:: Solution for both centres
        :class: dropdown

            .. code-block:: julia

                shell> pwd            #Check were you are currently located
                (@v1.8) pkg> generate new_pack
                     Generating  project new_pack:
                     new_pack\Project.toml
                     new_pack\src\new_pack.jl
                shell> cd new_pack
                     `path-to-folder\new_pack`
                (@v1.8) pkg> activate .
                       Activating project at `path-to-folder\new_pack`
                (new_pack) pkg> add CSV
                (new_pack) pkg> status
                       Project new_pack v0.1.0
                       Status `path-to-folder\new_pack\Project.toml`
                       [336ed68f] CSV v0.10.9
                (new_pack) pkg> activate

Batch mode
----------


Serial code
'''''''''''

.. challenge:: Run a serial script

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
                #SBATCH -A hpc2n2023-110     # your project_ID
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

            This batch script is for UPPMAX. Adding the numbers 2 and 3.

            .. code-block:: sh

                #!/bin/bash -l
                #SBATCH -A naiss2023-22-914  # Change to your own after the course
                #SBATCH -J job-serial        # name of the job
                #SBATCH -n 1                 # nr. tasks
                #SBATCH --time=00:05:00 # Asking for 5 minutes
                #SBATCH --error=job.%J.err   # error file
                #SBATCH --output=job.%J.out  # output file
                module load julia/1.8.5

                julia serial-sum.jl Arg1 Arg2    # run the serial script

GPU code
''''''''

.. challenge:: Run the GPU script

    Run the following script ``script-gpu.jl``. Why are we running the simulations
    twice?
    Note that at UPPMAX you will need a project will access to Snowy (or Bianca)

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
                #SBATCH -A hpc2n2024-025     # your project_ID
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

                #SBATCH -A <project with Snowy/Bianca access    # your project_ID
                #SBATCH -M snowy
                #SBATCH -p node
                ##SBATCH -C gpu   #NB: Only for Bianca
                #SBATCH -N 1
                #SBATCH --job-name=juliaGPU         # create a short name for your job
                #SBATCH --gpus-per-node=1             # number of gpus per node (Bianca 2, Snowy 1)
                #SBATCH --time=00:15:00          # total run time limit (HH:MM:SS)
                #SBATCH --qos=short              # if test run t<15 min

                ml Julia/1.8.5-linux-x86_64

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

.. challenge:: Machine Learning job on GPUs (HPC2N)

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
            #SBATCH -A Project-ID        # your project_ID
            #SBATCH -J job-serial        # name of the job
            #SBATCH -n 1                 # nr. tasks
            #SBATCH --time=00:20:00      # requested time
            #SBATCH --error=job.%J.err   # error file
            #SBATCH --output=job.%J.out  # output file
            #SBATCH --gres=gpu:v100:1     # 1 GPU v100 card

            ml purge  > /dev/null 2>&1
            ml Julia/1.8.5-linux-x86_64
            ml CUDA/11.4.1

            julia <fix-activate-environment> <fix-name-script>.jl

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
                #SBATCH -A hpc2n20xx-xyz     # your project_ID
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


