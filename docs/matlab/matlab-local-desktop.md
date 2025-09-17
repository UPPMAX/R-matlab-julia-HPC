# Session-UPPMAX: MATLAB client on the desktop

!!! info "Use own computer's MATLAB"

    - Would you like to try run batch jobs on the Rackham or Snowy cluster but use the faster graphics that you can achieve on your own computer?
    - Do you have all your work locally but sometimes need the cluster to do parallel runs?
    - UPPMAX offers this now.

!!! warning

    This solution is possible only if
     - you have an UPPMAX compute project
     - a working matlab on your computer with one of the version available on the cluster:

    Check with `module avail matlab` (output shown below):

    ```bash
    $ ml avail matlab
    
    ---------------------------- /sw/mf/rackham/applications ----------------------------
       matlab/R2014a    matlab/R2018a    matlab/R2022b          matlab/7.10
       matlab/R2015a    matlab/R2018b    matlab/R2023a          matlab/7.13
       matlab/R2015b    matlab/R2019a    matlab/R2023b (L,D)    matlab/8.0
       matlab/R2016a    matlab/R2020b    matlab/7.4             matlab/8.1
       matlab/R2017a    matlab/R2022a    matlab/7.8
    
      Where:
       L:  Module is loaded
       D:  Default Module
    
    Use "module spider" to find all possible modules and extensions.
    Use "module keyword key1 key2 ..." to search for all possible modules matching any
    of the "keys".
    ```

!!! tip "Want a video?"

   See [UPPMAX Matlab client on the desktop (Oct 2024)](https://www.youtube.com/watch?v=wwqxy2gVjlk&list=PL6jMHLEmPVLwzXjygOpG__54j6oG4IRFN&index=44)


## Let's get started!

Try to type along with the following demonstration.

The Rackham MATLAB support package can be found in [uppsala.Desktop.zip](https://github.com/UPPMAX/UPPMAX-documentation/raw/main/docs/software/files/matlab/uppsala.Desktop.zip)

- Download the ZIP file and start MATLAB.
- Unzip the ZIP file in the location returned by calling

```matlab
>> userpath
```

- You can unzip from within MATLAB's Command window.
- Configure MATLAB to run parallel jobs on the cluster by calling `configCluster`. `configCluster` only needs to be called once per version of MATLAB.

```matlab
>> configCluster
Username on RACKHAM (e.g. jdoe):
```

- Type your Rackham user name.
- The resulting output will be (using the 2022b release, for example,):

```matlab
>> Complete.  Default cluster profile set to "Rackham R2022b".
```

!!! note

    To submit jobs to the local machine instead of the cluster, run the following:

    ```matlab
    >> % Get a handle to the local resources
    >> c = parcluster('local');
    ```

### Configuring Slurm details

Prior to submitting the job, various parameters can be assigned, such as queue, e-mail, walltime, etc. See AdditionalProperties for the complete list. 

You must always set `AccountName`, `WallTime`, and `ProcsPerNode`. Other parameters, like `Partition`, `MemPerCPU`, `GPUcard`, etc. depend on the type, amount, and distribution of resources you need.

```matlab
>> % Get a handle to the cluster
>> c = parcluster;

c =

Generic Cluster

   Properties:

                  Profile: Rackham R2022b
                 Modified: false
                     Host: UUC-4GM8L33.user.uu.se
               NumWorkers: 100000
               NumThreads: 1

    JobStorageLocation: <path to job outputs locally>
     ClusterMatlabRoot: /sw/apps/matlab/x86_64/R2022b
       OperatingSystem: unix
```

Set some additional parameters related to Slurm on Rackham:

```matlab
>> % Specify the account
>> c.AdditionalProperties.AccountName = 'uppmax2025-2-272';

>> % Specify the wall time (e.g., 1 day, 5 hours, 30 minutes
>> c.AdditionalProperties.WallTime = '00:30:00';

>> % Specify cores per node
>> c.AdditionalProperties.ProcsPerNode = 20;
```

(Optional parameters:)

```matlab
>> % Specify the partition
>> c.AdditionalProperties.Partition = 'devcore';

>> % Specify another cluster: 'snowy'
>> c.AdditionalProperties.ClusterName='snowy'
>> c.AdditionalProperties.ProcsPerNode = 16;

>> % Specify number of GPUs
>> c.AdditionalProperties.GPUsPerNode = 1;
>> c.AdditionalProperties.GPUCard = 'gpu-card';
```

Do not forget to save your changes!

```matlab
>> c.saveProfile
```

To see the values of the current configuration options, display `AdditionalProperties`:

```matlab
>> % To view current properties
>> c.AdditionalProperties
```

Unset a value when no longer needed:

```matlab
>> % Example Turn off email notifications
>> c.AdditionalProperties.EmailAddress = '';
>> c.saveProfile
```

### Start job

Copy the script below and paste into a new file called `parallel_example_local.m`. Save it in your current working directory (check with `pwd` in the MATLAB Command Window).

```matlab
function t = parallel_example_local(nLoopIters, sleepTime)
t0 = tic;
parfor idx = 1:nLoopIters
  A(idx) = idx;
  pause(sleepTime);
end
t = toc(t0);
```

- The script is supposed to loop over `sleepTime` seconds of work `nLoopIters` times.
- We will define the number of processes in the batch submit line.

```matlab
job = c.batch(@parallel_example_local, 1, {16,1}, 'Pool',8,'CurrentFolder','.');
```

- Submission to the cluster requires SSH credentials.
- You will be prompted for username and password or identity file (private key).
    - It will not ask again until you define a new cluster handle `c` or in next session.

<div align="center">
  <img src="../../docs-sphinx/matlab/img/matlab_usercred.PNG" alt="MATLAB user credentials prompt" width="500"/>
</div>

<div align="center">
  <img src="../../docs-sphinx/matlab/img/matlab_enterpassword.PNG" alt="MATLAB password prompt" width="500"/>
</div>

- Jobs will now default to the cluster rather than submit to the local machine.

```matlab
>> job.State

ans =

    'running'
```

- You can run this several times until it gives

```matlab
>> job.State

ans =

   'finished'
```

- You can also watch the queue

<div align="center">
  <img src="../../docs-sphinx/matlab/img/matlab_jobmonitor.PNG" alt="MATLAB job monitor" width="500"/>
</div>

  - Example on Rackham (it really runs there!):

```bash
[bjornc2@rackham2 ~]$ squeue -u bjornc2
         JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
      50827312   devcore MATLAB_R  bjornc2  R       2:20      1 r483
```

- Then fetch the output:

```matlab
>> job.fetchOutputs{:}

ans =

   2.4853
```

- The script looped over 1 s work 16 times, but with 8 processes.
- In an ideal world it would have taken ``16 / 8 = 2 s``. Here it took 2.5 s because there is some "overhead."

!!! info "Run on Snowy"

```matlab
>> c.AdditionalProperties.ClusterName='snowy'
>> c.AdditionalProperties.ProcsPerNode = 16;
```

## Exercises

!!! example "**Challenge 1.** Configure your local MATLAB to talk to UPPMAX"

    - Use the instructions above to try to make it work!

!!! example "**Challenge 2.** Run a script on Snowy."

    - Try to run a script from the [MATLAB GUI and SLURM session](./MatlabGUIslurm)
    - Check in a rackham terminal: `squeue -M snowy --me`

!!! summary

    - Steps to configure  first time
       - download and decompress UPPMAX configure file.
       - run configCluster on local MATLAB and set user name
    - Steps to run
       - set `parcluster` settings, like you do otherwise.
    - Note: only `parcluster` will work, not `parpool`.

!!! faq "Did you have problems?"

    - Send a support ticket to UPPMAX via <a href="https://supr.naiss.se/support/?centre_resource=c4" onclick="window.open(this.href,'_blank','toolbar=1,location=1,status=1,menubar=1,scrollbars=1,resizable=1'); return false;"> supr.naiss.se/support </a>

!!! note "**Extra:** Helper Functions"

    | Function                | Description                                                 | Applies Only to Desktop  |
    |------------------------:|:------------------------------------------------------------|--------------------------|
    | `clusterFeatures`       | List of cluster features/constraints                        | ---                      |
    | `clusterGpuCards`       | List of cluster GPU cards                                   | ---                      |
    | `clusterPartitionNames` | List of cluster partitions                                  | ---                      |
    | `disableArchiving`      | Modify file archive to resolve file mirroring issue         | True                     |
    | `fixConnection`         | Reestablish cluster connection (e.g., after VPN disruption) | True                     |
    | `willRun`               | Explain why job is queued                                   | ---                      |
