# ML with Julia

!!! note "Questions"

    - Is Julia suitable for Machine Learning (ML)?
    - Which machine learning tools are installed at HPCs?
    - How to run Julia ML jobs on an HPC system (NSC, PDC, C3SE, UPPMAX, HPC2N, LUNARC)

!!! note "Objectives"

    - Short introduction to ML with Julia
    - Overview of installed ML tools at Swedish HPC centres
    - Workflow
    - Show the structure of a suitable batch script
    - Examples to try
    - **We will not learn about:**
        - How to write and optimize ML/DL code.
        - How to use multi-node setup for training models on CPU and GPU.


### GPU code

In order to use the NVIDIA GPUs with Julia (UPPMAX, HPC2N, and LUNARC), you will need to load a CUDA toolkit module on the
cluster and install the ``CUDA`` package in Julia.

In the case of AMD GPUs for Julia (PDC and HPC2N), you will need to load a ROCM toolkit module on the
cluster and install the ``AMDGPU`` package in Julia as in the next sequence of commands.

!!! important "Using GPUs"


    === "UPPMAX"

        - This can only be done on Snowy or Bianca.
        - Then either create an interactive session or make a batch job
        - CUDA is installed at system level so they do not need to be loaded.

        - On snowy

        
        ```bash
        $ interactive -A <proj> -n 1 -M snowy --gres=gpu:1  -t 3:00:00

        $ ml Julia/1.8.5   # Julia version
        $ julia
        (v1.8) pkg> add CUDA
            Updating registry at `~/.julia/registries/General.toml`
            Resolving package versions...
            Installed CEnum ───────── v0.4.2
            ...
        ```

    === "HPC2N"

        ```bash
        $ ml Julia/1.8.5-linux-x86_64   # Julia version
        $ ml CUDA/11.4.1                # CUDA toolkit module
        $ julia
        (v1.8) pkg> add CUDA
            Updating registry at `~/.julia/registries/General.toml`
            Resolving package versions...
            Installed CEnum ───────── v0.4.2
            ...
        ```

    === "LUNARC"


        ```bash
        $ ml Julia/1.8.5-linux-x86_64   # Julia version
        $ ml CUDA/11.4.1                # CUDA toolkit module
        $ julia
        (v1.8) pkg> add CUDA
            Updating registry at `~/.julia/registries/General.toml`
            Resolving package versions...
            Installed CEnum ───────── v0.4.2
            ...
        ```
    === "PDC"

        ```bash
        $ ml PDC/23.12 julia/1.10.2-cpeGNU-23.12   # Julia version
        $ ml rocm/5.7.0  craype-accel-amd-gfx90a   # ROCM toolkit module
        $ julia
        (v1.10) pkg> add AMDGPU
            Updating registry at `~/.julia/registries/General.toml`
            Resolving package versions...
            Installed CEnum ───────── v0.4.2
        ```

    === "NSC"

        - Then either create an interactive session or make a batch job

        ```bash
        $ interactive -A <proj> -n 1 -c 32 --gpus-per-task=1 -t 1:00:00

        $ ml buildenv-gcccuda/11.6.2-gcc9-hpc1  # Load tool chain with CUDA
        $ ml julia/1.9.4-bdist                  # Julia version
        $ julia
        (v1.9) pkg> add LinearAlgebra
        (v1.9) pkg> add CUDA
            Updating registry at `~/.julia/registries/General.toml`
            Resolving package versions...
            ...
        ```

Once this initial setting is completed, you will be able to use the GPUs available on the
cluster. Here, there is a simple example for computing a matrix-matrix multiplication. As a
reference point, we show the simulation on CPUs as well. You can call the batch script ``job-gpu.sh``,
for instance.

!!! important "batch scripts for GPUs"

    === "UPPMAX"

        Short GPU example for running on Snowy.

        ```bash
        #!/bin/bash -l
        #SBATCH -A naiss202t-uv-wxyz     # your project_ID
        #SBATCH -M snowy
        #SBATCH -p node
        #SBATCH --gres=gpu:1
        #SBATCH -N 1
        #SBATCH --job-name=job-gpu       # create a short name for your job
        #SBATCH --time=00:15:00          # total run time limit (HH:MM:SS)
        #SBATCH --qos=short              # if test run t<15 min
        #SBATCH --mail-type=begin        # send email when job begins
        #SBATCH --mail-type=end          # send email when job ends

        module load julia/1.8.5      # system CUDA works as of today
        julia script-gpu.jl
        ```

    === "HPC2N"

        ```bash
        #!/bin/bash
        #SBATCH -A hpc2n202w-xyz     # your project_ID
        #SBATCH -J job-gpu           # name of the job
        #SBATCH -n 1                 # nr. tasks
        #SBATCH --time=00:03:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file
        #SBATCH --gres=gpu:v100:1     # 1 GPU v100 card

        ml purge  > /dev/null 2>&1
        ml Julia/1.8.5-linux-x86_64
        ml CUDA/11.4.1

        julia script-gpu.jl
        ```

    === "LUNARC"

        ```bash
        #!/bin/bash
        #SBATCH -A lu202w-x-yz       # your project_ID
        #SBATCH -J job-gpu           # name of the job
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
        ```

    === "NSC"

        ```bash
        #!/bin/bash
        #SBATCH -A naiss202t-uv-wxyz # your project_ID
        #SBATCH -J job-gpu           # name of the job
        #SBATCH -n 1                 # nr. tasks
        #SBATCH -c 32                # nr. cores
        #SBATCH --gpus-per-task=1    # nr. GPU cards
        #SBATCH --time=00:04:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        ml buildenv-gcccuda/11.6.2-gcc9-hpc1
        ml julia/1.9.4-bdist

        julia script-gpu.jl
        ```

    === "script-gpu.jl"

        Julia GPU example code.

        ```julia
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
        ```

    === "PDC"

        ```bash
        #!/bin/bash
        #SBATCH -A naiss202t-uv-wxyz # your project_ID
        #SBATCH -J job               # name of the job
        #SBATCH  -p gpu              # name of the queue
        #SBATCH  --ntasks=1          # nr. of tasks
        #SBATCH --cpus-per-task=1    # nr. of cores per-task
        #SBATCH --time=00:03:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        # Load dependencies and Julia version
        ml PDC/23.12 julia/1.10.2-cpeGNU-23.12
        # ROCM toolkit module
        ml rocm/5.7.0  craype-accel-amd-gfx90a

        julia script-gpu.jl
        ```
        
    === "script-gpu.jl"

        Julia AMD GPU example code.

        ```julia
        using AMDGPU

        AMDGPU.versioninfo()  # Display AMD GPU information

        N = 2^8
        x = rand(N, N)
        y = rand(N, N)

        A = ROCArray(x)  # Transfer data to AMD GPU
        B = ROCArray(y)

        # Calculation on CPU
        @time x * y

        # Calculation on AMD GPU
        @time A * B

        # Calculation on CPU (again)
        @time x * y

        # Calculation on AMD GPU (again)
        @time A * B
        ```
        
## Exercise 2. Run the GPU script

Run the following script ``script-gpu.jl``. Why are we running each simulation
twice in this script?
Note that at UPPMAX you will need a project will access to Snowy. Remember that at PDC
we will use AMD GPUs.

??? hint "Answer"

    === "HPC2N"

        This batch script is for Kebnekaise. We run the simulation twice because
        in this way, the reported time is more reliable for the computing time as
        in the first simulation, data transfer and other settings could be added to
        the reported time.

        ```bash
        #!/bin/bash
        #SBATCH -A hpc2n202w-xyz     # your project_ID
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
        ```

        Output:
            0.689096 seconds (2.72 M allocations: 132.617 MiB, 6.27% gc time, 99.62% compilation time)

            1.194153 seconds (1.24 M allocations: 62.487 MiB, 3.41% gc time, 55.13% compilation time)

            0.000933 seconds (2 allocations: 512.047 KiB)

            0.000311 seconds (5 allocations: 192 bytes)

    === "UPPMAX"
        
        This batch script is for UPPMAX. Adding the numbers 2 and 3.

        ```bash
        #!/bin/bash -l
        #SBATCH -A naiss202t-uv-wxyz   # your project_ID
        #SBATCH -M snowy
        #SBATCH -p node
        #SBATCH --gres=gpu:1
        #SBATCH -N 1
        #SBATCH --job-name=juliaGPU         # create a short name for your job
        #SBATCH --time=00:15:00          # total run time limit (HH:MM:SS)
        #SBATCH --qos=short              # if test run t<15 min

        ml julia/1.8.5

        julia script-gpu.jl
        ``` 

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

    === "LUNARC"

        This batch script is for Cosmos.

        ```bash
        #!/bin/bash
        #SBATCH -A lu202w-x-yz       # your project_ID
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
        ```

    === "PDC"

        This batch script is for Dardel.

        ```bash
        #!/bin/bash
        #SBATCH -A naiss202t-uv-wxyz # your project_ID
        #SBATCH -J job               # name of the job
        #SBATCH  -p gpu              # name of the queue
        #SBATCH  --ntasks=1          # nr. of tasks
        #SBATCH --cpus-per-task=1    # nr. of cores per-task
        #SBATCH --time=00:03:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        # Load dependencies and Julia version
        ml PDC/23.12 julia/1.10.2-cpeGNU-23.12
        # ROCM toolkit module
        ml rocm/5.7.0  craype-accel-amd-gfx90a

        julia script-gpu.jl
        ```

        OUTPUT:

            ┌───────────┬──────────────────┬─...
            │ Available │ Name             │ ...
            ├───────────┼──────────────────┼─...
            │     +     │ LLD              │ ...
            │     +     │ Device Libraries │ ...
            │     +     │ HIP              │ ...
            │     +     │ rocBLAS          │ ...
            │     +     │ rocSOLVER        │ ...
            │     +     │ rocSPARSE        │ ...
            │     +     │ rocRAND          │ ...
            │     +     │ rocFFT           │ ...
            │     +     │ MIOpen           │ ...
            └───────────┴──────────────────┴─...

            ┌────┬─────────────────────┬─────...
            │ Id │                Name │     ...
            ├────┼─────────────────────┼─────...
            │  1 │ AMD Instinct MI250X │ gfx9...
            │  2 │ AMD Instinct MI250X │ gfx9...
            │  3 │ AMD Instinct MI250X │ gfx9...
            │  4 │ AMD Instinct MI250X │ gfx9...
            │  5 │ AMD Instinct MI250X │ gfx9...
            │  6 │ AMD Instinct MI250X │ gfx9...
            │  7 │ AMD Instinct MI250X │ gfx9...
            │  8 │ AMD Instinct MI250X │ gfx9...
            └────┴─────────────────────┴─────...

            1.241600 seconds (2.27 M allocations: 152.229 MiB, 8.28% gc time, 91.71% compilation time)
            0.604009 seconds (624.95 k allocations: 38.360 MiB, 68.01% compilation time)
            0.001051 seconds (2 allocations: 512.047 KiB)
            0.000077 seconds (13 allocations: 352 bytes)

    === "NSC"

        This batch script is for NSC.

        ```bash
        #!/bin/bash
        #SBATCH -A naiss202t-uv-wxyz # your project_ID
        #SBATCH -J job-gpu           # name of the job
        #SBATCH -n 1                 # nr. tasks
        #SBATCH -c 32                # nr. cores
        #SBATCH --gpus-per-task=1    # nr. GPU cards
        #SBATCH --time=00:04:00      # requested time
        #SBATCH --error=job.%J.err   # error file
        #SBATCH --output=job.%J.out  # output file

        ml buildenv-gcccuda/11.6.2-gcc9-hpc1
        ml julia/1.9.4-bdist

        julia script-gpu.jl
        ```

## Exercise 3. Machine Learning job on GPUs

Julia has already several packages for ML, one of them is [``Flux``](https://fluxml.ai/). We will work with one of
the test cases provided by ``Flux`` which deals with a data set of tiny images (CIFAR10). Follow this steps:

- Create an environment called ``ML``, move to that environment directory and activate it
- Fetch the ``vgg_cifar10.jl`` test case from ``Flux`` repo (``wget https://raw.githubusercontent.com/FluxML/model-zoo/master/vision/vgg_cifar10/vgg_cifar10.jl``)
- Load CUDA toolkit 11.4.1
- Install (add) the following packages: CUDA, MLDatasets, MLUtils
- The first time you use the data set CIFAR10, it will ask you to download it and accept. Do this in ``Julian`` mode:

```julia
    julia> using MLDatasets: CIFAR10
    julia> x, y = CIFAR10(:train)[:]
```

- Change the number of epochs in the ``vgg_cifar10.jl`` script from 50 to something shorter like 5.
- Submit the job with the script:

```bash
#!/bin/bash
#SBATCH -A hpc2n202w-xyz        # your project_ID
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
```

??? hint "Answer"

    === "UPPMAX"

        ```bash
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
        ```

        The batch script looks like:

        ```bash
        #!/bin/bash -l
        #SBATCH -A naiss202t-uv-wxyz        # your project_ID
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
        ```

    === "HPC2N"

        ```bash
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
        ```

        The batch script looks like:

        ```bash
        #!/bin/bash
        #SBATCH -A hpc2n202w-xyz     # your project_ID
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
        ```

        At HPC2N you can use the tool ``job-usage`` on the command line:

        ```bash
        job-usage job_ID   # job_ID number you get upon using sbatch
        ```

        This will give you a URL that you can paste on your local browser. It would display
        statistics after a couple of minutes the job started.
