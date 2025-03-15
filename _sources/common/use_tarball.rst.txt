Use the tarball with exercises
==============================

.. admonition:: Goal

    You can run the example files needed for the exercises 

A tarball is a file that contains multiple files,
similar to a zip file.
To use the files it contains, it needs to be untarred/unzipped/uncompressed
first.

Procedure
---------

.. admonition:: Prefer a video?
    :class: dropdown

    See `this YouTube video <https://youtu.be/N-TRzv9LdF4?si=6uIqHI4J8h_2ry7P&t=396>`_.

The procedure has these steps:

- Get the tarbal
- Uncompress the tarbal

Step 1: get the tarbal
^^^^^^^^^^^^^^^^^^^^^^

In a terminal, use the following command to download the file
to your current folder:

.. code-block::  console

    wget https://github.com/UPPMAX/R-python-julia-matlab-HPC/raw/refs/heads/main/exercises/exercises.tar.gz

.. admonition:: How does that look like?
   :class: dropdown

    Your output will look similar to this:

    .. code-block::  console

        [sven@rackham3 ~]$ wget https://github.com/UPPMAX/R-python-julia-matlab-HPC/raw/refs/heads/main/exercises/exercises.tar.gz
        --2024-10-23 11:49:30--  https://github.com/UPPMAX/R-python-julia-matlab-HPC/raw/refs/heads/main/exercises/exercises.tar.gz
        Resolving github.com (github.com)... 4.225.11.194
        Connecting to github.com (github.com)|4.225.11.194|:443... connected.
        HTTP request sent, awaiting response... 302 Found
        Location: https://raw.githubusercontent.com/UPPMAX/R-python-julia-matlab-HPC/refs/heads/main/exercises/exercises.tar.gz [following]
        --2024-10-23 11:49:30--  https://raw.githubusercontent.com/UPPMAX/R-python-julia-matlab-HPC/refs/heads/main/exercises/exercises.tar.gz
        Resolving raw.githubusercontent.com (raw.githubusercontent.com)... 185.199.111.133, 185.199.108.133, 185.199.109.133, ...
        Connecting to raw.githubusercontent.com (raw.githubusercontent.com)|185.199.111.133|:443... connected.
        HTTP request sent, awaiting response... 200 OK
        Length: 56007 (55K) [application/octet-stream]
        Saving to: ‘exercises.tar.gz’

        100%[======================================>] 56,007      --.-K/s   in 0.002s  

        2024-10-23 11:49:30 (31.4 MB/s) - ‘exercises.tar.gz’ saved [56007/56007]



Step 2: Uncompress the tarbal
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

In a terminal, use the following command to uncompress the file:

.. code-block::  console

    tar -xvzf exercises.tar.gz 

.. admonition:: How does that look like?
   :class: dropdown

    Your output will look similar to this:

    .. code-block::  console

        [sven@rackham3 ~]$ tar -xvzf exercises.tar.gz 
        exercises/
        exercises/julia/
        exercises/julia/script-df-rackham.sh
        exercises/julia/parallelJulia/
        exercises/julia/parallelJulia/solution/
        exercises/julia/parallelJulia/solution/script-df-sol.jl
        exercises/julia/parallelJulia/script-df.jl
        exercises/julia/parallelJulia/runHPC2N.sh
        exercises/julia/parallelJulia/runUPPMAX.sh
        exercises/julia/parallelJulia/1.md
        exercises/julia/script-df.jl
        exercises/julia/batchJulia/
        exercises/julia/batchJulia/3.md
        exercises/julia/batchJulia/2.md
        exercises/julia/batchJulia/3.uppmax-batch-script.sh
        exercises/julia/batchJulia/serial-sum.jl
        exercises/julia/batchJulia/3.kebnekaise-batch-script.sh
        exercises/julia/batchJulia/script-gpu.jl
        exercises/julia/batchJulia/Solutions/
        exercises/julia/batchJulia/Solutions/2/
        exercises/julia/batchJulia/Solutions/2/Kebnekaise.md
        exercises/julia/batchJulia/Solutions/2/Rackham.sh
        exercises/julia/batchJulia/Solutions/3/
        exercises/julia/batchJulia/Solutions/3/3.kebnekaise-batch-script.sh
        exercises/julia/batchJulia/Solutions/3/Solution.md
        exercises/julia/batchJulia/Solutions/1/
        exercises/julia/batchJulia/Solutions/1/Rackham.md
        exercises/julia/batchJulia/Solutions/1/Kebnekaise.md
        exercises/julia/batchJulia/1.md
        exercises/julia/README.md
        exercises/julia/sleep-threads.jl
        exercises/julia/script-df-kebnekaise.sh
        exercises/julia/script-df-fixme.jl
        exercises/julia/isolatedJulia/
        exercises/julia/isolatedJulia/2.md
        exercises/julia/isolatedJulia/Solutions/
        exercises/julia/isolatedJulia/Solutions/2/
        exercises/julia/isolatedJulia/Solutions/2/Solution.md
        exercises/julia/isolatedJulia/Solutions/1/
        exercises/julia/isolatedJulia/Solutions/1/Solution.md
        exercises/julia/isolatedJulia/1.md
        exercises/julia/loadRun/
        exercises/julia/loadRun/2.md
        exercises/julia/loadRun/serial-sum.jl
        exercises/julia/loadRun/Solutions/
        exercises/julia/loadRun/Solutions/2/
        exercises/julia/loadRun/Solutions/2/Rackham.md
        exercises/julia/loadRun/Solutions/2/Kebnekaise.md
        exercises/julia/loadRun/Solutions/1/
        exercises/julia/loadRun/Solutions/1/Solution.md
        exercises/julia/loadRun/1.md
        exercises/exercises.tar.gz
        exercises/python/
        exercises/python/scikit-learn-kebnekaise.sh
        exercises/python/integration2d_gpu.sh
        exercises/python/integration2d_gpu-cosmos.sh
        exercises/python/serial-python-virt-cosmos.sh
        exercises/python/pytorch_fitting_gpu-snowy.sh
        exercises/python/multiproc-cosmos.sh
        exercises/python/sequential-python-snowy.sh
        exercises/python/script-df-rackham.sh
        exercises/python/multiproc-kebnekaise.sh
        exercises/python/integration2d_gpu.py
        exercises/python/sequential-python-cosmos.sh
        exercises/python/integration2d_gpu-snowy.sh
        exercises/python/mmmult-kebnekaise.sh
        exercises/python/sleep.py
        exercises/python/seaborn-code-kebnekaise.py
        exercises/python/add2.py
        exercises/python/seaborn-code-rackham.py
        exercises/python/script-df-fixme.py
        exercises/python/my_tf_program.py
        exercises/python/README.md
        exercises/python/pytorch_fitting_gpu.py
        exercises/python/sequential-python-kebnekaise.sh
        exercises/python/script-df.py
        exercises/python/integration2d_gpu_shared.py
        exercises/python/sum-2args-kebnekaise.sh
        exercises/python/add-list-cosmos.sh
        exercises/python/mmmult.py
        exercises/python/sum-2args.py
        exercises/python/integration2d_gpu-kebnekaise.sh
        exercises/python/gpu-python-snowy.sh
        exercises/python/script-df-kebnekaise.sh
        exercises/python/scikit-learn.py
        exercises/python/scikit-learn-snowy.sh
        exercises/python/scikit-learn-kebnekaise.py
        exercises/python/serial-python-scipybundle-kebnekaise.sh
        exercises/python/mmmult-cosmos.sh
        exercises/python/add-list-snowy.sh
        exercises/python/serial-python-scipybundle-cosmos.sh
        exercises/python/multiproc.py
        exercises/python/mmmult-rackham.sh
        exercises/python/sum-2args-rackham.sh
        exercises/python/scikit-learn-cosmos.sh
        exercises/python/serial-python-scipybundle-rackham.sh
        exercises/python/serial-python-virt-kebnekaise.sh
        exercises/python/multiproc-rackham.sh
        exercises/python/serial-python-virt-rackham.sh
        exercises/python/sum-2args-cosmos.sh
        exercises/python/example.py
        exercises/python/add-list-kebnekaise.sh
        exercises/python/seaborn-code-cosmos.py
        exercises/python/add-list.py
        exercises/python/pytorch_fitting_gpu-kebnekaise.sh
        exercises/python/gpu-python-cosmos.sh
        exercises/python/gpu-python-kebnekaise.sh
        exercises/python/tips.csv
        exercises/python/script-df-cosmos.sh
        exercises/python/pytorch_fitting_gpu-cosmos.sh
        exercises/README.md
        exercises/matlab/
        exercises/matlab/parallel_example.m
        exercises/matlab/example-parallel-matlab.sh
        exercises/matlab/serial-monte-rackham.sh
        exercises/matlab/parallel_example-rackham.sh
        exercises/matlab/serial-monte-kebnekaise.sh
        exercises/matlab/parallel_example-kebnekaise.sh
        exercises/matlab/mmult.m
        exercises/matlab/parfeval_mean.m
        exercises/matlab/monte_carlo_pi.m
        exercises/matlab/parallel_example-cosmos.sh
        exercises/matlab/parfor-greet.m
        exercises/matlab/MorePractice.rst
        exercises/matlab/add2.m
        exercises/matlab/serial-monte-cosmos.sh
        exercises/matlab/dice_stats_par.m
        exercises/r/
        exercises/r/iris_ml-rackham.sh
        exercises/r/Rscript_ML-kebnekaise.sh
        exercises/r/hello.R
        exercises/r/script-df.R
        exercises/r/add2-cosmos.sh
        exercises/r/Rscript_ML-cosmos.sh
        exercises/r/script-df-rackham.sh
        exercises/r/serial-rackham.sh
        exercises/r/iris.csv
        exercises/r/Rmpi-cosmos.sh
        exercises/r/validation-cosmos.sh
        exercises/r/validation-rackham.sh
        exercises/r/parallel_foreach.R
        exercises/r/serial_sum.R
        exercises/r/iris_ml.R
        exercises/r/serial.R
        exercises/r/serial-cosmos.sh
        exercises/r/parallel_foreach-cosmos.sh
        exercises/r/clusterapply.R
        exercises/r/parallel_foreach-kebnekaise.sh
        exercises/r/add2-kebnekaise.sh
        exercises/r/validation-kebnekaise.sh
        exercises/r/README.md
        exercises/r/Rmpi.R
        exercises/r/Rmpi-kebnekaise.sh
        exercises/r/serial-kebnekaise.sh
        exercises/r/Rscript_ML-rackham.sh
        exercises/r/parallel_foreach-rackham.sh
        exercises/r/script-df-kebnekaise.sh
        exercises/r/add2.R
        exercises/r/Rscript.R
        exercises/r/add2-rackham.sh
        exercises/r/sleep.R
        exercises/r/script-df-fixme.R
        exercises/r/Rmpi-rackham.sh
        exercises/r/iris_ml-kebnekaise.sh
        exercises/r/iris_ml-cosmos.sh
        exercises/r/validation.R
        exercises/r/script-df-cosmos.sh

After decompressing, there is a folder called ``exercises``
that contains the exercises.
