# Introduction Julia

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

Useful commands to the batch system
-----------------------------------

- Submit job: ``sbatch <jobscript.sh>``
- Get list of your jobs: ``squeue -u <username>``
- Check on a specific job: ``scontrol show job <job-id>``
- Delete a specific job: ``scancel <job-id>``
- Useful info about a job: ``sacct -l -j <job-id> | less -S``
- Url to a page with info about the job (Kebnekaise only): ``job-usage <job-id>``


