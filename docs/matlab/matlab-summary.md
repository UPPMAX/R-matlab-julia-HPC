# Summary

**Load and run**

- You can use the module system to load a specific version of MATLAB

   ```bash
   module load matlab
   ```

- You can start the MATLAB GUI with

  ```bash
  matlab &
  ```

  - except on LUNARC; then you should use On-Demand instead 

- You can run MATLAB on the terminal using

  ```bash
  matlab -nodisplay [-singleCompThread -nosplash -nodesktop]
  ```

**Slurm job scheduler and MATLAB in terminal**

- You can configure the cluster before starting MATLAB, like this:

   ```bash
   configCluster.sh <project-id if on UPPMAX or LUNARC>
   ```

   or at the MATLAB command line, like this:

   ```bash
   configCluster
   ```   
   
- You can can add job settings needed to run jobs from MATLAB.

   ```matlab
   c.AdditionalProperties.<properties like AccountName/WallTime>
   ```

- You can work in the MATLAB terminal interface.

   - It works almost the same as with GUI.

- You can submit jobs from inside the MATLAB terminal interface.

   ```matlab
   job = batch('myScript');
   ```

- You can write and submit a MATLAB batch script.

   - Create `batchscript.sh`:
  
     ```bash
     !/bin/bash
     #SBATCH -A my_account
     #SBATCH -t 00:10:00
     module load <matlab version>
     matlab -nojvm -nodisplay -r "monte_carlo_pi(100000)"
     ```

   - Run it:
     
     ```bash
     sbatch batchscript.sh``
     ```

- You can use GPUs with MATLAB

   ```matlab
   c.AdditionalProperties.GpusPerNode = 1;
   ```

**MATLAB GUI and Slurm**

- You can submit jobs from inside the MATLAB GUI using the following syntax:

   ```matlab
   c=parcluster('name-of-your-cluster');
   %extra slurm settings
   j = c.batch(@myfunction,'nr. outputs',{'list of input args'},'pool','nr. workers');
   j.wait;                               % wait for the results
   j.fetchOutputs{:};                % fetch the results
   ```
   
   - Note that batch also accepts script names in place of function names, but these must be given in single quotes, with no `@` or `.m`.

- You can work with MATLAB in parallel

   - `parfor`: for simple for-loops with independent iterations
   - `spmd`: for worker-to-worker communication and collaboration
   - `parfeval`: for tasks that may depend on other tasks or need to run in the background

- You can check that you are in an interactive session.

   - After running `interactive..` on UPPMAX or LUNARC you will see that the linux prompt shows another hostname.

**Add-Ons**

- You can view add-ons and toolboxes.

   - It is all more or less graphical.

- You can install add-ons

    - Search in add-ons explorer and install.
    - Installation folder will be in MATLAB's search path, and so should be accessible from anywhere in the file tree.

**Session-UPPMAX: MATLAB client on the desktop**

- You can use the MATLAB client on the desktop

   - download and decompress UPPMAX configure file.
   - run `configCluster` on local MATLAB and set user name.
   - Set `parcluster` settings, like you do otherwise.

**Session: MATLAB in Jupyter**

- You can start run MATLAB in Jupyter

   - You need to configure and install some python packages the first time.
   - After that Jupyter will find the MATLAB kernel during startup.
