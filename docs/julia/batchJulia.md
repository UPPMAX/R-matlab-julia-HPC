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
