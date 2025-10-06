# Matlab interactively

!!! info "Learning outcomes for today"

    - Be able to start interactive sessions with several cores
    - Be able to run MATLAB and seae the available workers

??? note "Instructor note"

    - Intro 5 min
    - Lecture and 10 min

!!! important "Notes"

    - It is possible to run MATLAB directly on the login (including ThinLinc) nodes.
    - But this should *only* be done for shorter jobs or jobs that do not use a lot of resources, as the login nodes can otherwise become slow for all users.
    - If you want to work interactively with your code or data, you should start an interactive session.
    - If you rather will run a script which won't use any interactive user input while running, you can instead start a batch job, see next session.

## General

In order to run interactively with more memory or more threads/processes, you need to have compute nodes allocated to run on, and this is done through the Slurm system.

## Interactive sessions at NSC, PDC, HPC2N, UPPMAX and LUNARC

Here we define an interactive session as a session with direct access to a compute node.
Or alternatively: an interactive session is a session, in which there is no queue before a command is run on a compute node.

This differs between HPC2N and UPPMAX :

- HPC2N: the user remains on a login node.
  All commands can be sent directly to the compute node using `srun`
- UPPMAX: the user is actually on a computer node.
  Whatever command is done, it is run on the compute node
- LUNARC: the user is actually on a computer node if the correct menu option is chosen. Whatever command is done, it is run on the compute node
- NSC: the user is actually on a computer node if the correct menu option is chosen. Whatever command is done, it is run on the compute node
- PDC: the user is actually on a computer node if the correct menu option is chosen. Whatever command is done, it is run on the compute node

### Start an interactive session

To start an interactive session,
one needs to allocate resources on the cluster first.

The command to request an interactive node differs per HPC cluster:

| Cluster | `interactive` | `salloc`     | GfxLauncher |
|---------|:-------------:|--------------|-------------|
| HPC2N   | Works         | Recommended  | N/A         |
| UPPMAX  | Recommended   | Works        | N/A         |
| LUNARC  | Works         | N/A          | Recommended |
| NSC     | Recommended   | N/A          | N/A         |
| PDC     | N/A           | Recommended  | Possible    |

Example, HPC2N vs. UPPMAX (also valid for NSC, PDC and LUNARC):

```mermaid
graph TD
  subgraph uppmax[UPPMAX]
  subgraph login_node[Login nodes]
    user_on_login_node[User on login node]
  end

  subgraph compute_node[Compute nodes]
    user_on_computer_node[User on compute node]
    job_on_compute_node[Job on compute node]
  end
  end

  subgraph hpc2n[HPC2N]
  subgraph hpc2n_login_node[Login nodes]
    hpc2n_user_on_login_node[User on login node]
    hpc2n_user_in_interactive_mode[User on login node in interactive session]
  end

  subgraph hpc2n_compute_node[Compute nodes]
    hpcn2_job_on_compute_node[Job on compute node]
  end
  end

  user_on_login_node --> |interactive| user_on_computer_node
  user_on_login_node --> |sbatch| job_on_compute_node

  user_on_computer_node --> |exit| user_on_login_node
  user_on_computer_node --> |srun| user_on_computer_node

  hpc2n_user_on_login_node --> |salloc| hpc2n_user_in_interactive_mode
  hpc2n_user_in_interactive_mode --> |exit| hpc2n_user_on_login_node
  hpc2n_user_on_login_node --> |sbatch| hpcn2_job_on_compute_node
  hpc2n_user_in_interactive_mode --> |srun| hpcn2_job_on_compute_node
```

- First, you make a request for resources with ``interactive``/``salloc``, like this:

!!! important "Interactive jobs"

    Short serial example for running on different clusters.

    === "NSC"

        ```bash
        $ interactive -n <tasks> --time=HHH:MM:SS -A naiss2025-22-262
        ```

    === "PDC"

        ```bash
        $ salloc -n <ntasks> --time=HHH:MM:SS -A naiss2025-22-262 -p <partition>
        ```

        Where <partition> is ``shared``, ``main`` or ``gpu``

        - We recommend ``shared``
        - Wait until you get the node
        - ``ssh``  to the node given and then work there
            - Example:

                ```bash
                $ ssh nid001057
                ```

    === "UPPMAX" 

        ```bash
        $ interactive -n <tasks> --time=HHH:MM:SS -A uppmax2025-2-272
        ```

    === "LUNARC"

        ```bash
        $ interactive -n <tasks> --time=HHH:MM:SS -A lu2025-7-24
        ```

    === "HPC2N"

        ```bash
        $ salloc -n <tasks> --time=HHH:MM:SS -A hpc2n2023-114
        ```

where <tasks> is the number of tasks (or cores, for default 1 task per core), time is given in hours, minutes, and seconds 
(maximum T168 hours), and then you give the id for your project.

Then, when you get the allocation, do one of:

- ``srun -n <ntasks> ./program``

- Your request enters the job queue just like any other job, and interactive/salloc will tell you that it is waiting for the requested resources.
- When salloc tells you that your job has been allocated resources, you can interactively run programs on those resources with ``srun``.
- The commands you run with ``srun`` will then be executed on the resources your job has been allocated.

!!! important "On HPC2N"

   - If you do not preface with ``srun`` the command is run on the login node!
   - You can now run Julia scripts on the allocated resources directly instead of waiting for your batch job to return a result.
   - This is an advantage if you want to test your Julia script or perhaps figure out which parameters are best.

!!! important "Documentation at the centers"

   - [Interactive allocation on PDC](https://support.pdc.kth.se/doc/contact/contact_support/?sub=login/interactive_hpc/){:target="_blank"}
   - [Interactive allocation on NSC](https://www.nsc.liu.se/support/running-applications/#interactive-jobs){:target="_blank"}
   - [Interactive allocation on UPPMAX](https://docs.uppmax.uu.se/cluster_guides/start_interactive_session/){:target="_blank"}
   - [Interactive allocation on HPC2N](https://docs.hpc2n.umu.se/documentation/batchsystem/job_submission/#interactive){:target="_blank"}
   - [Interactive allocation on LUNARC](https://lunarc-documentation.readthedocs.io/en/latest/manual/manual_interactive/#starting-an-interactive-session){:target="_blank"}

### Example 

!!! important "Interactive jobs"
    
    Requesting 4 cores for 10 minutes, then running Julia
    Short serial example for running on different clusters.

    === "NSC"

        ```bash
        [sm_bcarl@tetralith3 ~]$ interactive -n 4 -t 0:30:0 -A naiss2025-22-262
        salloc: Pending job allocation 43071298
        salloc: job 43071298 queued and waiting for resources
        salloc: job 43071298 has been allocated resources
        salloc: Granted job allocation 43071298
        salloc: Waiting for resource configuration
        salloc: Nodes n760 are ready for job

        [bjornc@r483 ~]$ module load julia/1.10.2-bdist
        ```

        Let us check that we actually run on the compute node:

        ```bash
        [sm_bcarl@n760 ~]$ srun hostname
        n760
        n760
        n760
        n760
        ```

        We are. Notice that we got a response from all four cores we have allocated.

    === "PDC"

        ```bash
        claremar@login1:~> salloc --ntasks=4 -t 0:30:00 -p shared --qos=normal -A naiss2025-22-262
        salloc: Pending job allocation 9102757
        salloc: job 9102757 queued and waiting for resources
        salloc: job 9102757 has been allocated resources
        salloc: Granted job allocation 9102757
        salloc: Waiting for resource configuration
        salloc: Nodes nid001057 are ready for job

        claremar@login1:~> module load PDC/23.12 julia/1.10.2-cpeGNU-23.12
        ```

        Let us check that we actually run on the compute node. This has to be done differently

        ```bash
        claremar@login1:~> srun hostname
        nid001064
        nid001063
        nid001064
        nid001063
        ```

        Now, it seems that Dardel allows for "hyperthreading", that is 2 threads per core.

        ```bash
        claremar@login1:~> srun -n 8 hostname
        nid001064
        nid001064
        nid001063
        nid001063
        nid001064
        nid001064
        nid001063
        nid001063
        ```

        We are. Notice that we got a response from all four cores we have allocated.

    === "UPPMAX"

        ```bash
        [bjornc@rackham2 ~]$ interactive -A uppmax2025-2-272 -p core -n 4 -t 0:30:00
        You receive the high interactive priority.
        There are free cores, so your job is expected to start at once.

        Please, use no more than 6.4 GB of RAM.

        Waiting for job 29556505 to start...
        Starting job now -- you waited for 1 second.

        [bjornc@r483 ~]$ module load julia/1.8.5
        ```

        Let us check that we actually run on the compute node:

        ```bash
        [bjornc@r483 ~]$ srun hostname
        r483.uppmax.uu.se
        r483.uppmax.uu.se
        r483.uppmax.uu.se
        r483.uppmax.uu.se
        ```

        We are. Notice that we got a response from all four cores we have allocated.

    === "HPC2N"

        ```bash
        [~]$ salloc -n 4 --time=00:30:00 -A hpc2n2025-062
        salloc: Pending job allocation 20174806
        salloc: job 20174806 queued and waiting for resources
        salloc: job 20174806 has been allocated resources
        salloc: Granted job allocation 20174806
        salloc: Waiting for resource configuration
        salloc: Nodes b-cn0241 are ready for job
        [~]$ module load GCC/11.2.0 OpenMPI/4.1.1 julia/1.8.5
        [~]$
        ```

        Let us check that we actually run on the compute node:

        ```bash
        [~]$ srun hostname
        b-cn0241.hpc2n.umu.se
        b-cn0241.hpc2n.umu.se
        b-cn0241.hpc2n.umu.se
        b-cn0241.hpc2n.umu.se
        ```

        We are. Notice that we got a response from all four cores we have allocated.

    === "LUNARC"

        ```bash
        [bjornc@cosmos1 ~]$ interactive -A lu2025-7-24 -n 4 -t 30:00
        Cluster name: COSMOS
        Waiting for JOBID 930844 to start

        [bjornc@cn050 ~]$ module load Julia/1.8.5-linux-x86_64
        ```

        Let us check that we actually run on the compute node:

        ```bash
        [bjornc@cn050 ~]$ echo $SLURM_CPUS_ON_NODE
        4
        ```

        We are, because the *$SLURM* environment variable gves an output. Notice that we got 4, whihc is nt the size of the physcial node bt the allocation size.


