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
