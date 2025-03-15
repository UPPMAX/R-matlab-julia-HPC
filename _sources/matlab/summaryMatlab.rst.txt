Summary
=======

**Load and run**

- You can use the module system to load a specific version of Matlab

   .. code-block:: console

      module load matlab

- You can start the Matlab GUI

   .. code-block:: console

      matlab &

   - or On-demand on LUNARC

- You can run Matlab on the terminal

   .. code-block:: console

      matlab -nodisplay [-singleCompThread -nosplash -nodesktop]


**Slurm job scheduler and Matlab in terminal**

- You can configure the cluster

   .. code-block:: matlab

      configCluster.sh <project-id if on UPPMAX or LUNARC>

- You can can add job settings needed to run jobs from Matlab

   .. code-block:: matlab

      c.AdditionalProperties.<properties like AccountName/WallTime>

- You can work in the Matlab terminal interface

   - It works almost the same as with GUI.

- You can submit jobs from inside the Matlab terminal interface

   .. code-block:: matlab

      job = batch('myScript');

- You can write and submit a Matlab batch script

   - Create a ``batchscript.sh``

   .. code-block:: bash

      !/bin/bash
      #SBATCH -A my_account
      #SBATCH -t 00:10:00
      module load <matlab version>
      matlab -nojvm -nodisplay -r "monte_carlo_pi(100000)"

   .. code-block:: console
   
      sbatch batchscript.sh``

- You can use GPUs with Matlab
 
   .. code-block:: matlab

      c.AdditionalProperties.GpusPerNode = 1;

**Matlab GUI and Slurm** 

- You can submit jobs from inside the Matlab GUI

   .. code-block:: matlab

      c=parcluster('name-of-your-cluster');
      %extra slurm settings
      j = c.batch(@myfunction,'nr. outputs',{'list of input args'},'pool','nr. workers');
      j.wait;                               % wait for the results
      j.fetchOutputs{:};                % fetch the results

   - Note that batch also accepts script names in place of function names, but these must be given in single quotes, with no @ or .m. 

- You can work with Matlab in parallel

   .. code-block:: matlab

      parfor
      spmd
      parfeval

- You can check that you are in an interactive session

   - After running ``interactive..`` on UPPMAX or LUNARC you will see that the linux prompt shows another hostname

**Add-Ons**

- You can view add-ons and toolboxes

   - It is all more or less graphical

- You can install add-ons

    - Search in add-ons explorer and install.
    - Ends up in local folder and is in the path so it should be reached wherever you are in the file tree.

**Session-UPPMAX: Matlab client on the desktop** 

- You can use the Matlab client on the desktop

   - download and decompress UPPMAX configure file.
   - run configCluster on local MATLAB and set user name
   - Steps to run
      - set parcluster settings, like you do otherwise.

**Session: Matlab in Jupyter**

- You can start run Matlab in Jupyter

   - You need to configure and install some python packages the first time
   - After that starting jupyter will find the Matlab kernel 

