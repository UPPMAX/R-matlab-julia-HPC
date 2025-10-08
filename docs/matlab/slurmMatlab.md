# Slurm job scheduler and MATLAB in terminal

!!! info "Objectives"

    - Understand and use the Slurm scheduler
    - Configure the cluster
    - Start (MATLAB) batch jobs from the command line
    - Try example

!!! important

    **Compute allocations in this workshop**

    - Pelle/Rackham: ``uppmax2025-2-360``
    - Kebnekaise: ``hpc2n2025-151``
    - Cosmos: ``lu2025-2-94``
    - Tetralith: ``naiss2025-22-934``
    - Dardel: ``naiss2025-22-934``
    - Alvis: ``naiss2025-22-934`` 
     
    **Storage space for this workshop**

    - Rackham: ``/proj/r-matlab-julia-pelle``
    - Kebnekaise: ``/proj/nobackup/fall-courses``
    - Tetralith: ``/proj/courses-fall-2025/users/``
    - Dardel: ``/cfs/klemming/projects/snic/courses-fall-2025``
    - Alvis: ``/mimer/NOBACKUP/groups/courses-fall-2025/``

!!! warning

    Any longer, resource-intensive, or parallel jobs must be run through a **batch script**.

The batch system used at UPPMAX, HPC2N, LUNARC, NSC, and PDC is called SLURM. The same is the case at most of the Swedish HPC centres.

SLURM is an Open Source job scheduler, which provides three key functions:
- Keeps track of available system resources
- Enforces local system resource usage and job scheduling policies
- Manages a job queue, distributing work across resources according to policies

Users ask for compute resources via the `sbatch` command (as those who attended yesterday's R session will already know).

- To run a batch job, you must create and submit a SLURM submit file (also called a batch submit file, a batch script, or a job script).
- Guides and documentation at: 
    - <a href="https://docs.hpc2n.umu.se/documentation/batchsystem/intro/" target="_blank">https://docs.hpc2n.umu.se/documentation/batchsystem/intro/</a> 
    - <a href="https://docs.uppmax.uu.se/cluster_guides/slurm/" target="_blank">https://docs.uppmax.uu.se/cluster_guides/slurm/</a> 
    - <a href="https://lunarc-documentation.readthedocs.io/en/latest/manual/submitting_jobs/manual_basic_job/" target="_blank">https://lunarc-documentation.readthedocs.io/en/latest/manual/submitting_jobs/manual_basic_job/</a> 
    - <a href="https://www.nsc.liu.se/support/batch-jobs/introduction/" target="_blank">https://www.nsc.liu.se/support/batch-jobs/introduction/</a> 
    - <a href="https://support.pdc.kth.se/doc/run_jobs/job_scheduling/" target="_blank">https://support.pdc.kth.se/doc/run_jobs/job_scheduling/</a>
    - <a href="https://www.c3se.chalmers.se/documentation/submitting_jobs/running_jobs/" target="_blank">https://www.c3se.chalmers.se/documentation/submitting_jobs/running_jobs/</a> 

MATLAB is well integrated with SLURM, so there are several ways to run these jobs:

- Using the job scheduler (``batch`` command) in MATLAB Desktop/graphical interface (This is the Recommended Use).
- Starting a ``parpool`` with a predefined cluster (This allows for more interactivity).
- Writing a batch script as for any other software and submitting the job with the ``sbatch`` command from SLURM
    - (This could be particularly useful if you want to run long jobs and you don't need to modify the code in the meantime).

In the following sections we will extend these concepts.

## Useful commands to the batch system

Before going into MATLAB specifics for batch jobs, we should look briefly at some useful commands:

- Submit job: ``sbatch <jobscript.sh>``
- Get list of your jobs: ``squeue --me``
- Check on a specific job: ``scontrol show job <job-id>``
- Delete a specific job: ``scancel <job-id>``
- Useful info about a job: ``sacct -l -j <job-id> | less -S``
- Url to a page with info about the job (Kebnekaise only): ``job-usage <job-id>``

## First time configuration

In order to be able to submit jobs to the SLURM queue, you usually need to configure MATLAB the first time you load any particular version. This configuration step will provide a set of default specifications for batch and parallel jobs called a **cluster profile**.

Configuration only needs to be run once per version of MATLAB on each cluster. These specifications can be changed or added to at runtime, and it is possible to have more than one profile for a single release.

The instructions for each facility are linked below: 

- [HPC2N: Configure MATLAB](https://www.hpc2n.umu.se/resources/software/configure-matlab-2018)
- [UPPMAX: MATLAB configuration](https://docs.uppmax.uu.se/software/matlab_conf/)
- [LUNARC: Configuration at the command line](https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/MATLAB/#configuration-at-the-command-line)
- [NSC: MATLAB (scroll down to "Before submitting your first job")](https://www.nsc.liu.se/software/installed/tetralith/matlab/).
- PDC: no need to configure
- C3SE: no need to configure 

!!! warning

    - On Dardel you need to either have your own Mathworks account, or contact them ahead of time and ask for access to run MATLAB there!
    - **Do NOT run configCluster(.sh) on Dardel!**

For most clusters, configuration can be done at the regular terminal using a shell script called `configCluster.sh`.
At most clusters, it is possible to run `configCluster` (without ".sh") on the MATLAB command line; for NSC, this is the only way to run the configuration program.
The tabs below demonstrate the preferred method for each cluster where configuration is required the first time you use a given version of MATLAB.

=== "UPPMAX"

     ```bash
     configCluster.sh <project-id>
     ```

     On Pelle, `configCluster` does not work properly inside the MATLAB GUI.
            
=== "HPC2N"

     ```bash
     configCluster.sh
     ```
     
     **Example:**
     [running configCluster.sh at HPC2N](../../img/configcluster.png)

=== "LUNARC"

     ```bash
     configCluster.sh <project-id>
     ```
     
     Choose "cosmos" when prompted.

     **Example:**
      ```bash
      [bbrydsoe@cosmos3 ~]$ configCluster.sh lu2024-7-68
      salloc: Granted job allocation 927531
      salloc: Waiting for resource configuration
      salloc: Nodes cn011 are ready for job
      
                                 < M A T L A B (R) >
                       Copyright 1984-2023 The MathWorks, Inc.
                  R2023b Update 7 (23.2.0.2515942) 64-bit (glnxa64)
                                   January 30, 2024
      
      To get started, type doc.
      For product information, visit www.mathworks.com.
      
      ip =
      
         "10.21.0.11"
      
         [1] aurora
         [2] cosmos
      2
      Select a cluster [1-2]: >>Complete.  Default cluster profile set to "cosmos R2023b".
      
         Must set AccountName and WallTime before submitting jobs to COSMOS.  E.g.
      
         >> c = parcluster;
         >> c.AdditionalProperties.AccountName = 'account-name';
         >> % 5 hour walltime
         >> c.AdditionalProperties.WallTime = '05:00:00';
         >> c.saveProfile
      
      MATLAB is configured for multi-node parallelism.
      
      salloc: Relinquishing job allocation 927531
      salloc: Job allocation 927531 has been revoked.
      [bbrydsoe@cosmos3 ~]$
      ```
      
=== "NSC"

     ```bash
     module load MATLAB/2024a-hpc1-bdist
     matlab -nodisplay -nodesktop -nosplash -softwareopengl
     >> configCluster
     ```
     
     Choose "tetralith" when prompted.

!!! example "**Challenge 1.** Log in and Configure MATLAB."

    1. Log into your chosen HPC cluster if you have not already.
    2. Load the newest version of MATLAB (find with ``ml spider MATLAB``). Note that on Dardel it has a prerequisite which you must load first, and that only the matlab/r2024a-ps (prerequisite PDCOLD/23.12) allows access from the shell/terminal without you having to give your own Mathworks credentials.
    3. Depending on cluster, now do 
        - NSC: Run configCluster inside MATLAB on the terminal (start with ``matlab -singleCompThread -nodisplay -nosplash -nodesktop ``).
        - PDC: You do not do ``configCluster``
        - C3SE: You do not do ``configCluster``
        - HPC2N. Run ``configCluster.sh`` on the terminal
        - UPPMAX: Run ``configCluster.sh <project-id>`` on the terminal
        - LUNARC. Run ``configCluster.sh <project-id> on the terminl  

## MATLAB terminal interface

Here we will discuss:

 - Starting MATLAB on the command line
 - Job settings
    - ``c.parcluster``
    - ``c.AdditionalProperties.``
    - ``c.batch``
 - Starting a job from within MATLAB

This section will show you how to use MATLAB completely from the shell/terminal without having to open the GUI. This can be useful if you only have a regular SSH connection or otherwise need to run something fast and lightweight instead of having to open the GUI. This is an extra advantage when you have a poor network connection.

### Starting MATLAB

To start MATLAB on the command line, without running the GUI, load the MATLAB version and do

```bash
matlab -singleCompThread -nodisplay -nosplash -nodesktop
```

This starts MATLAB. Not all of the flags shown are needed at every center, but it does no harm to include them.

!!! danger

    On the login-nodes MATLAB ***must*** be started with the option `-singleCompThread` to prevent MATLAB from starting an arbitrary number of threads, potentially occupying the whole node.

### Working in MATLAB

Of course, we can work in MATLAB like this in exactly the same way as in the GUI, as the example below shows

```bash
$ matlab -singleCompThread -nodisplay -nosplash -nodesktop
Opening log file:  /home/b/bbrydsoe/java.log.43927

                                 < M A T L A B (R) >
                       Copyright 1984-2023 The MathWorks, Inc.
                  R2023a Update 4 (9.14.0.2306882) 64-bit (glnxa64)
                                    June 19, 2023


To get started, type doc.
For product information, visit www.mathworks.com.

>> a = [ 1 2 3 ; 4 5 6; 7 8 9];
>> b = [ 7 5 6 ; 2 0 8; 5 7 1];
>> c = a + b

c =

    8     7     9
    6     5    14
   12    15    10

>> d = a - b

d =

   -6    -3    -3
    2     5    -2
    2     1     8

>> e = c + d;
>> e

e =

    2     4     6
    8    10    12
   14    16    18

>>
```

## Running MATLAB code with batch

Now going to look at running in batch on the compute nodes.

### Job settings at the command line

If you want to run a MATLAB program on the cluster with batch, you have to set some things for the job. Start MATLAB and input the following:

!!! note "NSC, HPC2N, LUNARC, UPPMAX"

    ```matlab
    >> c=parcluster('CLUSTER');
    >> c.AdditionalProperties.AccountName = 'PROJECT-ID';
    >> c.AdditionalProperties.WallTime = 'HHH1:MM:SS';
    >> c.saveProfile
    ```

    To list the content of your profile, enter `c.AdditionalProperties` at the prompt.

!!! important

    On UPPMAX and PDC you should use `c=parcluster;` instead of `c=parcluster('CLUSTER')`. On UPPMAX you also need to add ``c.AdditionalProperties.ProcsPerNode=20;``.

!!! info "C3SE" 

    The parallel toolbox does not allow multi-node jobs. You should run an interactive job on a compute node, so do this first: 

    ```bash
    srun --account=naiss2025-22-934 --gpus-per-node=T4:1 --time=01:00:00 --pty /bin/bash
    ```

    Now start Matlab on the compute node: 

    ```bash 
    matlab -singleCompThread -nodisplay -nosplash -nodesktop
    ```

    And do the example (we already set account and walltime when allocating the compute node): 

    ```matlab
    >> c=parcluster('local');
    ```

!!! info "Additional instructions specific to Dardel"

    The process at PDC (Dardel) is more involved than at other facilities:

    - At PDC, you do **NOT** set any ``AdditionalProperties``. You instead work in an interactive session.
    - To start an interactive session at **PDC**...
       - ...on a full node: use `salloc -N 1 -t 00:30:00 -A naiss2025-22-934 -p main`
       - ...on a subset of the cores on a node (here 24): use `salloc -c 24 -t 1:00:00 -A naiss2025-22-262 -p shared`
    - When the job is allocated, start an SSH connection to the compute node.

    If you need the GUI on Dardel, you need to start both the SSH connection to the Dardel login node and to the compute node with `ssh -X` (i.e. use `ssh -X <node-allocated-to-you>`). Then, you can load MATLAB and start it (on shell) as usual with

    ```bash
    ml PDCOLD/23.12 matlab/r2024a-ps
    matlab -nodisplay -nodesktop -nosplash
    ```

**Example, for C3SE** 

Asking for one hour. Starting from the login node. 

```bash
$ srun --account=naiss2025-22-934 --gpus-per-node=T4:1 --time=01:00:00 --pty /bin/bash
```

Then on the compute node: 

```bash
$ ml MATLAB/2024b
$ matlab -singleCompThread -nodisplay -nosplash -nodesktop
Opening log file:  /cephyr/users/brydso/Alvis/java.log.65485

                              < M A T L A B (R) >
                    Copyright 1984-2024 The MathWorks, Inc.
                   R2024b (24.2.0.2712019) 64-bit (glnxa64)
                                August 22, 2024

 
To get started, type doc.
For product information, visit www.mathworks.com.
 
>> c=parcluster('local');
```

**Example, for HPC2N**

Asking for 1 hour walltime.

```matlab
>> c=parcluster('kebnekaise');
>> c.AdditionalProperties.AccountName = 'hpc2n2025-062';
>> c.AdditionalProperties.WallTime = '01:00:00';
>> c.saveProfile
```

**Example, for PDC**

Asking for 1 hour. Starting from personal computer.

```bash
bbrydsoe@enterprise:~$ ssh -X dardel.pdc.kth.se
Last login: Thu Mar 20 17:02:49 2025 from enterprise.hpc2n.umu.se

 2025-03-14 at 15:39 [dardel]

System maintenance done, Dardel is running jobs since a few hours.

 --== Welcome to Dardel! ==--
bbrydsoe@login1:~>

bbrydsoe@login1:~> salloc -c 24 -t 1:00:00 -A naiss2025-22-934 -p shared
salloc: Pending job allocation 9050479
salloc: job 9050479 queued and waiting for resources
salloc: job 9050479 has been allocated resources
salloc: Granted job allocation 9050479
salloc: Waiting for resource configuration
salloc: Nodes nid002585 are ready for job
bbrydsoe@login1:~> ssh nid002585
bbrydsoe@nid002585:~> ml PDCOLD/23.12 matlab/r2024a-ps
bbrydsoe@nid002585:~> matlab -nodisplay -nodesktop -nosplash

                                    < M A T L A B (R) >
                          Copyright 1984-2024 The MathWorks, Inc.
                     R2024a Update 3 (24.1.0.2603908) 64-bit (glnxa64)
                                        May 2, 2024


To get started, type doc.
For product information, visit www.mathworks.com.

>> c=parcluster;
>>
```

!!! example "**Challenge 2.** Set MATLAB job settings."

    Fill in the job settings on one of:

    - **HPC2N:** `CLUSTER=kebnekaise`
    - **UPPMAX:** no CLUSTER, as said above - i.e. just ``c=parcluster;``
    - **LUNARC:** `CLUSTER=cosmos R2023b`
    - **NSC:** `CLUSTER=tetralith`
    - **C3SE:** `c=parcluster('local');` NO OTHER JOB SETTINGS! Here you start an interactive session first, as shown above! 
    - **PDC:** no `CLUSTER`, as said above - i.e. just ``c=parcluster;`` NO OTHER JOB SETTINGS! Here you instead start an interactive session first!
    
    Remember, the `project-id` is the compute allocation number given for your choice of cluster at the top of this webpage.
    
    Since we are just doing a short test, you can use 15 min instead of 1 hour. Also remember the `c.AdditionalProperties.ProcsPerNode=20` if you are on UPPMAX. Test that the settings were added by viewing `c.AdditionalProperties` (not PDC or C3SE).


### Running a job from within the MATLAB terminal interface

When starting a simple MATLAB program inside MATLAB on the terminal, by default, it will use your cluster profile which you just created and saved above. If you have a script file called `myScript.m`, the code to run it as a batch job with the default settings is:

```matlab
>> job = batch('myScript');
```

The batch command does not block MATLAB so you can continue working while computations take place. If you want to block MATLAB until the job finishes, use the wait function on the job object, like this:

```matlab
wait(job);
```

By default, MATLAB saves the Command Window output from the batch job to the diary of the job. To retrieve it, use the diary function:

```matlab
diary(job)
```

After the job finishes, fetch the results by using the `load` function:

```matlab
load(job,'x');
```

or using the `.fetchOutputs` attribute:

```matlab
job.fetchOutputs{:}
```

!!! tip

    Other useful job monitoring commands:
    
    - If you need the Job id, run ``squeue --me`` on the command line.
    - To get the MATLAB jobid do ``id=job.ID`` within MATLAB.
    - To see if the job is running, inside MATLAB, do ``job.State``

#### Serial

After starting MATLAB, you can get a handle to the cluster (remember, on Rackham/Pelle and Dardel, just use ``c=parcluster;``) like this:

```matlab
>> c=parcluster('CLUSTER')
```

For example, given that

- myfcn is a command or serial MATLAB program.
- N is the number of output arguments from the evaluated function
- x1, x2, x3,... are the input arguments

then starting a batch job with these inputs would look like:

```matlab
j = c.batch(@myfcn, N, {x1,x2,x3,...})
```

This job handle `j` then allows us to:

- Query the job status with `j.State`
- Fetch the result, if the job is finished, using `j.fetchOutputs{:}`, and 
- Delete the job when it is not needed anymore using `j.delete`

If you are running a lot of jobs, or if you want to quit MATLAB and restart it at a later time, you can retrieve the list of jobs and fetch the outputs of a specific job by index. For example:

Get the list of jobs:

```matlab
jobs = c.Jobs
```

Retrieve the output of the second job:

```matlab
j2=jobs(2)
output = j2.fetchOutputs{:}
```

!!! example "**Type-along.**"
    
    After doing the job settings further up, let us try running an example. We will use the example ``add2.m`` which adds two numbers. This example uses 1 and 2, but you can pick any numbers you want. You can find the ``add2.m`` script in the exercises/matlab directory or you can [download it from here](https://raw.githubusercontent.com/UPPMAX/R-matlab-julia-HPC/refs/heads/main/exercises/matlab/add2.m).

    1. Create a parcluster (`c=parcluster;` or `c=parcluster('CLUSTER');`or `c=parcluster('local'=;`
    1. Set up the job with `job = c.batch(@add2, 1, {1,2})`
    2. Check if it has finished with `job.State`
    3. When it has finished, retrieve the result with `job.fetchOutputs{:}`

#### Parallel

Running parallel batch jobs are quite similar to running serial jobs. We just need to specify a MATLAB Pool to use and of course MATLAB code that is parallelized. This is easiest illustrated with an example.

To make a pool of workers, and to give input etc., the basic syntax is:

```matlab
>> job = c.batch(@SCRIPT, #output, {input1, input2, input3, ...}, 'pool', #workers);
```

**Example:** Running a simple MATLAB script, parallel-example.m, giving the input "16", creating 4 workers, expecting 1 output. The name of the job handle is up to you (here it is `j`).

```matlab
>> j = c.batch(@parallel_example, 1, {16}, 'pool', 4);
```

Let us try running this on Kebnekaise, including checking state and then getting output:

```matlab

>> j = c.batch(@parallel_example, 1, {16}, 'pool', 4);

additionalSubmitArgs =

  '--ntasks=5 --cpus-per-task=1 -A hpc2n2025-062 -t 01:00:00'

>> j.State

ans =

   'running'

>> j.State

ans =

   'finished'

>> j.fetchOutputs{:}

ans =

   9.3387

>>
```

!!! example "**Challenge 3.** Try the above example."

    This exercise assumes you did the previous ones on this page; loading MATLAB, doing the configCluster.sh, adding the job settings. It should work on all the clusters.
    
    You can download [parallel_example.m here](https://raw.githubusercontent.com/UPPMAX/R-matlab-julia-HPC/refs/heads/main/exercises/matlab/parallel_example.m>).

##### `parpool`

On the clusters where this works, you can start a ``parpool`` and then (for instance) run a parallel code inside MATLAB.

**Parpool Example, for PDC:** As shown earlier, first start an interactive session, login to the compute node you got, then load matlab and start it. Then create a parpool of the size (at most) that you asked for in number of cores.

```matlab
>> p=parpool(24)
Starting parallel pool (parpool) using the 'Processes' profile ... connected to 24 workers.
p =
Pool with properties:
Connected: true
NumWorkers: 24
Cluster: local
AttachedFiles: {}
IdleTimeout: 30 minute(s) (30 minutes remaining)
SpmdEnabled: true
>> parallel_example
ans =
8.9287
```

There is more information about batch jobs [here on Mathworks](https://se.mathworks.com/help/parallel-computing/batch.html).

## Batch scripts containing MATLAB code

Here we will discuss creating a batch script to run MATLAB in
- Serial
- Parallel

While we can submit batch jobs (or even batch jobs of batch jobs) from inside MATLAB (and that may be the most common way of using the batch system with MATLAB), it is also possible to create a batch submit script and use that to run MATLAB.

The difference here is that when the batch script has been submitted, you cannot make changes to your job. It is not interactive. That is also an advantage - you can submit the job, log out, and then come back later and see the results.

!!! warning

    `parpool` can only be used on UPPMAX, Cosmos, Dardel, Kebnekaise, and Alvis.


### Serial batch jobs

Here is an example of a serial batch job formatted for each of the 6 facilities covered.

=== "UPPMAX"

     ```bash
     #!/bin/bash
     # Change to your actual project number later
     #SBATCH -A uppmax2025-2-360
     # Asking for 1 core
     #SBATCH -n 1
     # Asking for 30 min (change as you want)
     #SBATCH -t 00:30:00
     #SBATCH --error=matlab_%J.err
     #SBATCH --output=matlab_%J.out

     # Clean the environment
     module purge > /dev/null 2>&1

     # Change depending on resource and MATLAB version
     # to find out available versions: module spider MATLAB 
     module add MATLAB/2024a

     # Executing the matlab program monte_carlo_pi.m for the value n=100000
     # (n is number of steps - see program).
     # The command 'time' is timing the execution
     time matlab -nojvm -nodisplay -r "monte_carlo_pi(100000)"
     ```

=== "HPC2N"

     ```bash 
     #!/bin/bash
     # Change to your actual project number later
     #SBATCH -A hpc2n2025-151
     # Asking for 1 core
     #SBATCH -n 1
     # Asking for 30 min (change as you want)
     #SBATCH -t 00:30:00
     #SBATCH --error=matlab_%J.err
     #SBATCH --output=matlab_%J.out

     # Clean the environment
     module purge > /dev/null 2>&1

     # Change depending on resource and MATLAB version
     # to find out available versions: module spider matlab
     module add MATLAB/2023a.Update4

     # Executing the matlab program monte_carlo_pi.m for the value n=100000
     # (n is number of steps - see program).
     # The command 'time' is timing the execution
     time matlab -nojvm -nodisplay -r "monte_carlo_pi(100000)"
     ```

=== "LUNARC"

     ```bash
     #!/bin/bash
     # Change to your actual project number later
     #SBATCH -A lu2025-7-94
     # Asking for 1 core
     #SBATCH -n 1
     # Asking for 30 min (change as you want)
     #SBATCH -t 00:30:00
     #SBATCH --error=matlab_%J.err
     #SBATCH --output=matlab_%J.out

     # Clean the environment
     module purge > /dev/null 2>&1

     # Change depending on resource and MATLAB version
     # to find out available versions: module spider matlab
     module add matlab/2023b

     # Executing the matlab program monte_carlo_pi.m for the value n=100000
     # (n is number of steps - see program).
     # The command 'time' is timing the execution
     time matlab -nojvm -nodisplay -r "monte_carlo_pi(100000)"
     ```
         
=== "NSC"

     ```bash
     #!/bin/bash
     # Change to your actual project number later
     #SBATCH -A naiss2025-22-934
     #SBATCH --ntasks=1
     #SBATCH --cpus-per-task=1
     #SBATCH --ntasks-per-core=1
     # Asking for 15 min (change as you want)
     #SBATCH -t 00:15:00
     #SBATCH --error=matlab_%J.err
     #SBATCH --output=matlab_%J.out

     # Clean the environment
     module purge > /dev/null 2>&1
     module load MATLAB/2024a-hpc1-bdist

     # Executing the matlab program monte_carlo_pi.m for the value n=100000
     # (n is number of steps - see program).
     # The command 'time' is timing the execution
     time matlab -singleCompThread -nojvm -nodisplay -r "monte_carlo_pi(100000)"
     ```

=== "PDC"

     ```bash
     #!/bin/bash
     # Change to your actual project number later
     #SBATCH -A naiss2025-22-934
     #SBATCH -n 1
     # Asking for 15 min (change as you want)
     #SBATCH -t 00:15:00
     #SBATCH --error=matlab_%J.err
     #SBATCH --output=matlab_%J.out
     #SBATCH -p main

     # Clean the environment
     module purge > /dev/null 2>&1
     module load  PDCOLD/23.12 matlab/r2024a-ps

     # Executing the matlab program monte_carlo_pi.m for the value n=100000
     # (n is number of steps - see program).
     # The command 'time' is timing the execution
     time matlab -singleCompThread -nojvm -nodisplay -r "monte_carlo_pi(100000)"
     ```

=== "C3SE" 

    ```bash
    #!/bin/bash
    # Remember to change this to your own project ID after the course!
    #SBATCH -A NAISS2025-22-934
    #SBATCH -t 00:05:00
    #SBATCH -p alvis
    #SBATCH -N 1 --gpus-per-node=T4:1

    ml purge > /dev/null 2>&1
    module load MATLAB/2024b 

    time matlab -singleCompThread -nojvm -nodisplay -r "monte_carlo_pi(100000)" 
    ```

You can download [monte_carlo_pi.m here](https://raw.githubusercontent.com/UPPMAX/R-matlab-julia-HPC/refs/heads/main/exercises/matlab/monte_carlo_pi.m) here or find it under `matlab` in the exercises directory.

You submit it with

```bash
sbatch <batchscript.sh>
```

Where `<batchscript.sh>` is the name you gave your batchscript. You can find ones for each of the clusters in the `exercises -> matlab` directory, named `monte_carlo_pi_<cluster>.sh`.

!!! example "**Challenge 4:** Try run the serial batch script." 

    Submit it, then check that it is running with `squeue --me`.
    Check the output in the `matlab_JOBID.out` (and the error in the ``matlab_JOBID.err`` file).

### Parallel batch script

This is an example batch script for parallel MATLAB. Adjust to your preferred facility by cross-referencing the tabs above.

```bash
#!/bin/bash
# Change to your actual project number
#SBATCH -A XXXX-YY-ZZZ
#SBATCH --ntasks-per-node=<how many tasks>
#SBATCH --nodes <how many nodes>

# Asking for 30 min (change as you want)
#SBATCH -t 00:30:00
#SBATCH --error=matlab_%J.err
#SBATCH --output=matlab_%J.out

# Clean the environment
module purge > /dev/null 2>&1

# Change depending on resource and MATLAB version
# to find out available versions: module spider matlab
module add MATLAB/<version>

# Executing a parallel matlab program
srun matlab -nojvm -nodisplay -nodesktop -nosplash -r parallel-matlab-script.m
```

Inside the MATLAB code, the number of CPU-cores (`NumWorkers` in MATLAB terminology) can be specified when creating the parallel pool, for example, with 8 processes:

```matlab
>> poolobj = parpool('local', 8);
```

!!! example "**Challenge 5.** Write a batch script."
     
     Try making a batch script to run the ``parallel_example.m`` in the example from inside MATLAB above. You can use the above batch script as template.

??? note "Solutions"

    === "UPPMAX"
            
        ```bash
        #!/bin/bash
        # Change to your actual project number
        #SBATCH -A uppmax2025-2-360
        # Remember, there are 4 workers and 1 master!
        #SBATCH --ntasks=5
        #SBATCH --cpus-per-task=1
        #SBATCH --ntasks-per-node=5
        #SBATCH --ntasks-per-core=1
        # Asking for 30 min (change as you want)
        #SBATCH -t 00:30:00
        #SBATCH --error=matlab_%J.err
        #SBATCH --output=matlab_%J.out
          
        # Clean the environment
        module purge > /dev/null 2>&1
          
        # Change depending on resource and MATLAB version
        # to find out available versions: module spider MATLAB
        module add MATLAB/2024a
          
        # Executing a parallel matlab program
        srun matlab -nojvm -nodisplay -nodesktop -nosplash -r "parallel_example(16)"
        ```
        
    === "HPC2N"

        ```bash
        #!/bin/bash
        # Change to your actual project number
        #SBATCH -A hpc2n2025-151
        # Remember, there are 4 workers and 1 master!
        #SBATCH --ntasks=5
        #SBATCH --cpus-per-task=1
        #SBATCH --ntasks-per-node=5
        #SBATCH --ntasks-per-core=1
        # Asking for 30 min (change as you want)
        #SBATCH -t 00:30:00
        #SBATCH --error=matlab_%J.err
        #SBATCH --output=matlab_%J.out

        # Clean the environment
        module purge > /dev/null 2>&1

        # Change depending on resource and MATLAB version
        # to find out available versions: module spider matlab
        module add MATLAB/2023a.Update4

        # Executing a parallel matlab program
        srun matlab -nojvm -nodisplay -nodesktop -nosplash -r "parallel_example(16)"
        ```

    === "LUNARC"

        ```bash
        #!/bin/bash
        # Change to your actual project number
        #SBATCH -A lu2025-7-94
        # Remember, there are 4 workers and 1 master!
        #SBATCH --ntasks=5
        #SBATCH --cpus-per-task=1
        #SBATCH --ntasks-per-node=5
        #SBATCH --ntasks-per-core=1
        # Asking for 30 min (change as you want)
        #SBATCH -t 00:30:00
        #SBATCH --error=matlab_%J.err
        #SBATCH --output=matlab_%J.out

        # Clean the environment
        module purge > /dev/null 2>&1

        # Change depending on resource and MATLAB version
        # to find out available versions: module spider matlab
        module add matlab/2023b

        # Executing a parallel matlab program
        srun matlab -nojvm -nodisplay -nodesktop -nosplash -r "parallel_example(16)"
        ```

    === "NSC"

        ```bash
        #!/bin/bash
        # Change to your actual project number
        #SBATCH -A naiss2025-22-934
        # Remember, there are 4 workers and 1 master!
        #SBATCH --ntasks=5
        #SBATCH --cpus-per-task=1
        #SBATCH --ntasks-per-core=1
        # Asking for 30 min (change as you want)
        #SBATCH -t 00:30:00
        #SBATCH --error=matlab_%J.err
        #SBATCH --output=matlab_%J.out

        # Clean the environment
        module purge > /dev/null 2>&1

        # Change depending on resource and MATLAB version
        # to find out available versions: module spider matlab
        module add MATLAB/2024a-hpc1-bdist

        # Executing a parallel matlab program
        srun matlab -nojvm -nodisplay -nodesktop -nosplash -r "parallel_example(16)"
        ```

    === "PDC"

        ```bash
        #!/bin/bash
        # Change to your actual project number
        #SBATCH -A naiss2025-22-934
        # Remember, there are 4 workers and 1 master!
        #SBATCH -p shared
        #SBATCH -n 5
        # Asking for 30 min (change as you want)
        #SBATCH -t 00:30:00
        #SBATCH --error=matlab_%J.err
        #SBATCH --output=matlab_%J.out

        # Clean the environment
        module purge > /dev/null 2>&1

        # Change depending on resource and MATLAB version
        # to find out available versions: module spider matlab
        module add PDCOLD/23.12 matlab/r2024a-ps

        # Executing a parallel matlab program
        matlab -nodisplay -nodesktop -nosplash -r "parallel_example(16)"
        ```

    === "C3SE" 

        ```bash
        #!/bin/bash
        # Remember to change this to your own project ID after the course!
        #SBATCH -A NAISS2025-22-934
        #SBATCH -t 00:05:00
        #SBATCH -p alvis
        #You always need to ask for GPUs on Alvis! And you should not use it for anything but GPU jobs! 
        #SBATCH -N 1 --gpus-per-node=T4:1

        ml purge > /dev/null 2>&1
        module load MATLAB/2024b

        time matlab -singleCompThread -nojvm -nodisplay -r "parallel_example(16)"
        ```

!!! note "GPU code"

    Using MATLAB with GPUs will be covered in the [Introduction to GPUs](../advanced/gpus.md) section on the fourth day ("Advanced material"). 

!!! summary

    - The SLURM scheduler handles allocations to the calculation/compute nodes
    - Batch jobs run without interaction with user
    - A batch script consists of a part with SLURM parameters describing the allocation and a second part describing the actual work within the job, for instance one or several MATLAB scripts.
    - You can run MATLAB as a batch job through a batch script or from inside MATLAB (shell or GUI)
    - Remember to include possible input arguments to the MATLAB script in the batch script.
    - **You need to configure MATLAB before submitting batch jobs** (except on Dardel).
