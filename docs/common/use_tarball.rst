.. _common-use-tarball:

Use the tarball with exercises
==============================

.. admonition:: Goal

    You can run the example files needed for the exercises 

A tarball is a file that contains multiple files,
similar to a zip file.
To use the files it contains, it needs to be untarred/unzipped/uncompressed
first.


.. warning:: Do you want the whole repo?

   - If you are happy with just the exercises, the tarballs of the language specific ones are enough.
   - By cloning the whole repo, you get all the materials, planning documents, and exercises.
   - If you think this makes sense type this in the command line in the directory you want it.
     - ``git clone https://github.com/UPPMAX/R-matlab-julia-HPC.git``
   - Note however, that if you during exercise work modify files, they will be overwritten if you make ``git pull`` (like if the teacher needs to modify something).
      - Then make a copy somewhere else with your answers!




Procedure
---------

.. admonition:: Prefer a video?
    :class: dropdown

    See `this YouTube video <https://youtu.be/N-TRzv9LdF4?si=6uIqHI4J8h_2ry7P&t=396>`_.

The procedure has these steps:

- Go to a suitable directory
- Get the tarball
- Uncompress the tarball

Step 1: get the tarball
^^^^^^^^^^^^^^^^^^^^^^^

- In a terminal, ``cd`` to a good directory to keep the exercises (for instance in your just created folder in the project directory)
- You may create a new folder (``mkdir``), called ``exercises`` or similar).
- Use the following command to download the file to your current folder:

.. tabs::

   .. tab:: R

      .. code-block::  console

          wget https://github.com/UPPMAX/R-matlab-julia-HPC/raw/refs/heads/main/exercises/exercisesR.tar.gz

   .. tab:: Matlab (wait until that day)

      .. code-block::  console

          wget https://github.com/UPPMAX/R-matlab-julia-HPC/raw/refs/heads/main/exercises/exercisesMatlab.tar.gz

   .. tab:: Julia (wait until that day)

      .. code-block::  console

          wget https://github.com/UPPMAX/R-matlab-julia-HPC/raw/refs/heads/main/exercises/exercisesJulia.tar.gz

.. admonition:: How does that look like?
   :class: dropdown

    Your output will look somewhat like  this:

    .. code-block::  console

        [sven@rackham3 ~]$ wget https://github.com/UPPMAX/R-matlab-julia-HPC/raw/refs/heads/main/exercises/exercisesR.tar.gz
        --2024-10-23 11:49:30--  https://github.com/UPPMAX/R-matlab-julia-HPC/raw/refs/heads/main/exercises/exercisesR.tar.gz
        Resolving github.com (github.com)... 4.225.11.194
        Connecting to github.com (github.com)|4.225.11.194|:443... connected.
        HTTP request sent, awaiting response... 302 Found
        Location: https://raw.githubusercontent.com/UPPMAX/R-matlab-julia-HPC/refs/heads/main/exercises/exercisesR.tar.gz [following]
        --2024-10-23 11:49:30--  https://raw.githubusercontent.com/UPPMAX/R-matlab-julia-HPC/refs/heads/main/exerciseRs.tar.gz
        Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.111.133, 185.199.108.133, 185.199.109.133, ...
        Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.111.133|:443... connected.
        HTTP request sent, awaiting response... 200 OK
        Length: 56007 (55K) [application/octet-stream]
        Saving to: ‘exercisesR.tar.gz’

        100%[======================================>] 56,007      --.-K/s   in 0.002s  

        2024-10-23 11:49:30 (31.4 MB/s) - ‘exercisesR.tar.gz’ saved [56007/56007]



Step 2: Uncompress the tarball
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In a terminal, use the following command to uncompress the file:

.. tabs::

   .. tab:: R

      .. code-block::  console

         tar -xvzf exercisesR.tar.gz 

   .. tab:: Matlab (wait until that day)

      .. code-block::  console

         tar -xvzf exercisesMatlab.tar.gz 

   .. tab:: Julia (wait until that day)

      .. code-block::  console

         tar -xvzf exercisesJulia.tar.gz 

.. admonition:: How does that look like?
   :class: dropdown

   Your output will look similar to this:

   .. tabs::
      
      .. tab:: R
         
         .. code:: console
           
            [sven@rackham3 ~]$ tar -xvzf exercisesR.tar.gz 
            r/iris_ml-rackham.sh
            r/Rscript_ML-kebnekaise.sh
            r/hello.R
            r/script-df.R
            r/add2-cosmos.sh
            r/Rscript_ML-cosmos.sh
            r/script-df-rackham.sh
            r/serial-rackham.sh
            r/iris.csv
            r/Rmpi-cosmos.sh
            r/validation-cosmos.sh
            r/validation-rackham.sh
            r/parallel_foreach.R
            r/serial_sum.R
            r/iris_ml.R
            r/serial.R
            r/serial-cosmos.sh
            r/parallel_foreach-cosmos.sh
            r/clusterapply.R
            r/parallel_foreach-kebnekaise.sh
            r/add2-kebnekaise.sh
            r/validation-kebnekaise.sh
            r/README.md
            r/Rmpi.R
            r/Rmpi-kebnekaise.sh
            r/serial-kebnekaise.sh
            r/Rscript_ML-rackham.sh
            r/parallel_foreach-rackham.sh
            r/script-df-kebnekaise.sh
            r/add2.R
            r/Rscript.R
            r/add2-rackham.sh
            r/sleep.R
            r/script-df-fixme.R
            r/Rmpi-rackham.sh
            r/iris_ml-kebnekaise.sh
            r/iris_ml-cosmos.sh
            r/validation.R
            r/script-df-cosmos.sh

      .. tab:: Matlab
         
         .. code:: console
            
            [sven@rackham3 ~]$ tar -xvzf exercisesMatlab.tar.gz 
            matlab/
            matlab/parallel_example.m
            matlab/example-parallel-matlab.sh
            matlab/serial-monte-rackham.sh
            matlab/parallel_example-rackham.sh
            matlab/serial-monte-kebnekaise.sh
            matlab/parallel_example-kebnekaise.sh
            matlab/mmult.m
            matlab/parfeval_mean.m
            matlab/monte_carlo_pi.m
            matlab/parallel_example-cosmos.sh
            matlab/parfor-greet.m
            matlab/MorePractice.rst
            matlab/add2.m
            matlab/serial-monte-cosmos.sh
            matlab/dice_stats_par.m
            
      .. tab:: Julia
         
         .. code:: console

            [sven@rackham3 ~]$ tar -xvzf exercisesJulia.tar.gz 
            julia/
            julia/script-df-rackham.sh
            julia/parallelJulia/
            julia/parallelJulia/solution/
            julia/parallelJulia/solution/script-df-sol.jl
            julia/parallelJulia/script-df.jl
            julia/parallelJulia/runHPC2N.sh
            julia/parallelJulia/runUPPMAX.sh
            julia/parallelJulia/1.md
            julia/script-df.jl
            julia/batchJulia/
            julia/batchJulia/3.md
            julia/batchJulia/2.md
            julia/batchJulia/3.uppmax-batch-script.sh
            julia/batchJulia/serial-sum.jl
            julia/batchJulia/3.kebnekaise-batch-script.sh
            julia/batchJulia/script-gpu.jl
            julia/batchJulia/Solutions/
            julia/batchJulia/Solutions/2/
            julia/batchJulia/Solutions/2/Kebnekaise.md
            julia/batchJulia/Solutions/2/Rackham.sh
            julia/batchJulia/Solutions/3/
            julia/batchJulia/Solutions/3/3.kebnekaise-batch-script.sh
            julia/batchJulia/Solutions/3/Solution.md
            julia/batchJulia/Solutions/1/
            julia/batchJulia/Solutions/1/Rackham.md
            julia/batchJulia/Solutions/1/Kebnekaise.md
            julia/batchJulia/1.md
            julia/README.md
            julia/sleep-threads.jl
            julia/script-df-kebnekaise.sh
            julia/script-df-fixme.jl
            julia/isolatedJulia/
            julia/isolatedJulia/2.md
            julia/isolatedJulia/Solutions/
            julia/isolatedJulia/Solutions/2/
            julia/isolatedJulia/Solutions/2/Solution.md
            julia/isolatedJulia/Solutions/1/
            julia/isolatedJulia/Solutions/1/Solution.md
            julia/isolatedJulia/1.md
            julia/loadRun/
            julia/loadRun/2.md
            julia/loadRun/serial-sum.jl
            julia/loadRun/Solutions/
            julia/loadRun/Solutions/2/
            julia/loadRun/Solutions/2/Rackham.md
            julia/loadRun/Solutions/2/Kebnekaise.md
            julia/loadRun/Solutions/1/
            julia/loadRun/Solutions/1/Solution.md
            julia/loadRun/1.md
            

After decompressing, there is a folder called ``r``, or ``matlab`` or `julia``
that contains the exercises.
