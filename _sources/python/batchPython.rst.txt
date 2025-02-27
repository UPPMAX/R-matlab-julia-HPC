Running Python in batch mode
============================

.. questions::

   - What is a batch job?
   - How to make a batch job?

   
   
.. objectives:: 

   - Short introduction to SLURM scheduler
   - Show structure of a batch script
   - Try example

.. admonition:: Compute allocations in this workshop 

   - Rackham: ``naiss2024-22-1202``
   - Kebnekaise: ``hpc2n2024-114``
   - Cosmos: ``lu2024-7-80``
 
.. admonition:: Storage space for this workshop 

   - Rackham: ``/proj/r-py-jl-m-rackham``
   - Kebnekaise: ``/proj/nobackup/r-py-jl-m`` 

Any longer, resource-intensive, or parallel jobs must be run through a **batch script**.

The batch system used at UPPMAX, HPC2N, and LUNARC is called SLURM. The same is the case at most of the Swedish HPC centres. 

SLURM is an Open Source job scheduler, which provides three key functions

- Keeps track of available system resources
- Enforces local system resource usage and job scheduling policies
- Manages a job queue, distributing work across resources according to policies

In order to run a batch job, you need to create and submit a SLURM submit file (also called a batch submit file, a batch script, or a job script).

Guides and documentation at: 

- HPC2N: https://docs.hpc2n.umu.se/documentation/batchsystem/intro/ 
- UPPMAX: https://docs.uppmax.uu.se/cluster_guides/slurm/  
- LUNARC: https://lunarc-documentation.readthedocs.io/en/latest/manual/submitting_jobs/manual_basic_job/ 

**Workflow**

- Write a batch script

  - Inside the batch script you need to load the modules you need (Python, Python packages ... )
  - Possibly activate an isolated/virtual environment to access own-installed packages
  - Ask for resources depending on if it is a parallel job or a serial job, if you need GPUs or not, etc.
  - Give the command(s) to your Python script

- Submit batch script with ``sbatch <my-python-script.sh>`` 

Common file extensions for batch scripts are ``.sh`` or ``.batch``, but they are not necessary. You can choose any name and extension that makes sense to you. 

Useful commands to the batch system
-----------------------------------

- Submit job: ``sbatch <jobscript.sh>``
- Get list of your jobs: ``squeue -u <username>``
- Check on a specific job: ``scontrol show job <job-id>``
- Delete a specific job: ``scancel <job-id>``
- Useful info about a job: ``sacct -l -j <job-id> | less -S``
- Url to a page with info about the job (Kebnekaise only): ``job-usage <job-id>``
         
Example Python batch scripts
---------------------------- 

Serial code
'''''''''''
            
.. tabs::

   .. tab:: UPPMAX

        Short serial example script for Rackham. Loading Python 3.11.8. Numpy is preinstalled and does not need to be loaded. 

        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A naiss2024-22-1202 # Change to your own after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here Python 3.11.x. 
            module load python/3.11.8 
            
            # Run your Python script 
            python mmmult.py   
            

   .. tab:: HPC2N

        Short serial example for running on Kebnekaise. Loading SciPy-bundle/2023.07 and Python/3.11.3 (+ prerequisites)  
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2n2024-114 # Change to your own after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here for Python 3.11.3 and compatible SciPy-bundle
            module load GCC/12.3.0 Python/3.11.3 SciPy-bundle/2023.07
            
            # Run your Python script 
            python mmmult.py    
            
            
   .. tab:: LUNARC 

        Short serial example for running on Kebnekaise. Loading SciPy-bundle/2023.07, Python/3.11.3 and prerequisites 

        .. code-block:: sh

           #!/bin/bash
           #SBATCH -A lu2024-7-80 # Change to your own after the course
           #SBATCH --time=00:10:00 # Asking for 10 minutes
           #SBATCH -n 1 # Asking for 1 core 

           # Load any modules you need, here for Python 3.11.3 and compatible SciPy-bundle
           module load GCC/12.3.0 Python/3.11.3 SciPy-bundle/2023.07

           # Run your Python script
           python mmmult.py

   .. tab:: mmmult.py 
   
        Python example code
   
        .. code-block:: python
        
            import timeit
            import numpy as np
            
            starttime = timeit.default_timer()
            
            np.random.seed(1701)
            
            A = np.random.randint(-1000, 1000, size=(8,4))
            B = np.random.randint(-1000, 1000, size =(4,4))
            
            print("This is matrix A:\n", A)
            print("The shape of matrix A is ", A.shape)
            print()
            print("This is matrix B:\n", B)
            print("The shape of matrix B is ", B.shape)
            print()
            print("Doing matrix-matrix multiplication...")
            print()
            
            C = np.matmul(A, B)
            
            print("The product of matrices A and B is:\n", C)
            print("The shape of the resulting matrix is ", C.shape)
            print()
            print("Time elapsed for generating matrices and multiplying them is ", timeit.default_timer() - starttime)

Send the script to the batch:

.. code-block:: console

   $ sbatch <batch script>
        
Serial code + self-installed package in virt. env. 
''''''''''''''''''''''''''''''''''''''''''''''''''

Here we are using the virtual environment we created under the "isolated environments" session earlier. It is using the Python package "<a href="https://github.com/mwaskom/seaborn">seaborn</a>". In order to run the seaborn-code.py example, you need to download the data set "tips.csv" which you can find here: <a href="https://github.com/mwaskom/seaborn-data">https://github.com/mwaskom/seaborn-data</a>. If you want, there are other datasets there to play with. (Note: the data set in question can now also be found in the exercises python section). 

.. tabs::

   .. tab:: UPPMAX

        Short serial example for running on Rackham. Loading Python 3.11.x + using any Python packages you have installed yourself with venv. More information under the separate session for UPPMAX. Change to your directory name and venv name below. 

        .. code-block:: sh
        
            #!/bin/bash
            #SBATCH -A naiss2024-22-1202 # Change to your own after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here for Python 3.11.x 
            module load python/3.11.8
            
            # Activate your virtual environment. 
            # CHANGE <path-to-virt-env> to the full path where you installed your virtual environment
            # Example: /proj/r-py-jl-m-rackham/<user-dir>/python/<venv-name>
            source /proj/r-py-jl-m-rackham/<user-dir>/<path-to-virt-env>/<venv-name>/bin/activate
            
            # Run your Python script
            python seaborn-code.py


   .. tab:: HPC2N

        Short serial example for running on Kebnekaise. Loading SciPy-bundle/2023.07, Python/3.11.3, matplotlib + using any Python packages you have installed yourself with virtual environment - the one we named "vpyenv" should work well here. During the isolated environments session there was more about how to install something yourself this way. 
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2n2024-114 # Change to your own after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here for Python 3.11.3 and compatible SciPy-bundle
            module load GCC/12.3.0  Python/3.11.3 SciPy-bundle/2023.07 matplotlib/3.7.2
            
            # Activate your virtual environment. 
            # CHANGE <path-to-virt-env> to the full path where you installed your virtual environment
            # Example: /proj/nobackup/r-py-jl-m/bbrydsoe/python/vpyenv  
            source /proj/nobackup/r-py-jl-m/<user-dir>/<path-to-virt-env>/vpyenv/bin/activate
            
            # Run your Python script 
            python seaborn-code.py

   .. tab:: LUNARC 

        Short serial example for running on Cosmos. Loading SciPy-bundle/2023.07, Python/3.11.3, matplotlib + using any Python packages you have installed yourself with virtual environment - the one we named "vpyenv" should work well here. During the isolated environments session there was more about how to install something yourself this way. 

        .. code-block:: sh 

            #!/bin/bash
            #SBATCH -A lu2024-7-80 # Change to your own after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here for Python 3.11.3 and compatible SciPy-bundle
            module load GCC/12.3.0  Python/3.11.3 SciPy-bundle/2023.07 matplotlib/3.7.2
            
            # Activate your virtual environment. 
            # CHANGE <path-to-virt-env> to the full path where you installed your virtual environment
            # Example: /proj/nobackup/r-py-jl-m/bbrydsoe/python/vpyenv  
            source <path-to-my virt-env>/vpyenv/bin/activate
            
            # Run your Python script 
            python seaborn-code.py

   .. tab:: seaborn-code.py

        An example Python code using the "seaborn" package. It was (with minor changes) taken from <a href="https://seaborn.pydata.org/tutorial/introduction.html">https://seaborn.pydata.org/tutorial/introduction.html</a>. 

        .. code-block:: python

            # Import seaborn, matplotlib
            import matplotlib.pyplot as plt
            import seaborn as sns
            import pandas as pd

            # Apply the default theme
            sns.set_theme()

            # Load an example dataset (local, with pandas)
            tips = pd.read.csv('tips.csv')
            # Load an example dataset (remotely from repo. Only works at HPC2N and LUNARC - remove outcomment to use and comment out above line instead)
            #tips = sns.load_dataset("tips")

            # Create a visualization
            plot=sns.relplot(
                data=tips,
                x="total_bill", y="tip", col="time",
                hue="smoker", style="smoker", size="size",
            )
            plot.savefig('tipsplot.png')

Send the script to the batch:

.. code-block:: console

   $ sbatch <batch script>

Note that the slurm output file will be empty on success, and it will just create the file ``tipsplot.png``.

GPU code
''''''''

**We'll not test this live, but you can try if you have Snowy access or if you have an account on Kebnekaise/Cosmos with GPU access**

.. note:: 

   There is some problem with PyTorch under the ML package on UPPMAX, so you need to use the virtual environment   

.. tabs::

   .. tab:: UPPMAX

        Short GPU example for running on Snowy. This runs the example pytorch_fitting_gpu.py program that you can find in the Exercises/Python directory         
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A naiss2024-22-1202
            #SBATCH -t 00:10:00
            #SBATCH --exclusive
            #SBATCH -n 1
            #SBATCH -M snowy
            #SBATCH --gres=gpu:1
            
            # Load any modules you need, here loading Python 3.9.5 and the corresponding ML packages module 

            module load uppmax
            module load python/3.11.8 python_ML_packages/3.11.8-gpu 
            
            # Run your code
            srun python pytorch_fitting_gpu.py 
            

   .. tab:: HPC2N

        Short GPU example for running on Kebnekaise.         
       
        .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2n2024-114 # Change to your own after the course
            #SBATCH --time=00:10:00  # Asking for 10 minutes
            # Asking for one A100 card
            #SBATCH --gpus=1
            #SBATCH -C a100
            
            # Remove any loaded modules and load the ones we need
            module purge  > /dev/null 2>&1
            module load GCC/12.3.0 OpenMPI/4.1.5 PyTorch/2.1.2-CUDA-12.1.1
            
            # Run your Python script
            srun python pytorch_fitting_gpu.py

   .. tab:: LUNARC 

        Short GPU example for running on Cosmos. 

        .. code-block:: sh 

            #!/bin/bash
            # Remember to change this to your own project ID after the course!
            #SBATCH -A lu2024-7-80
            # We are asking for 5 minutes
            #SBATCH --time=00:05:00
            # The following two lines splits the output in a file for any errors and a file for other output.
            #SBATCH --error=job.%J.err
            #SBATCH --output=job.%J.out
            # This is needed on LUNARC when running on GPUs
            #SBATCH --ntasks-per-node=1
            # Asking for one A100. You need to give the gpua100 partition and then ask for one GPU 
            #SBATCH -p gpua100
            #SBATCH --gres=gpu:1

            # Remove any loaded modules and load the ones we need
            module purge  > /dev/null 2>&1
            ml GCC/11.3.0 OpenMPI/4.1.4 PyTorch/1.12.1-CUDA-11.7.0

            srun python pytorch_fitting_gpu.py


Send the script to the batch:

.. code-block:: console

   $ sbatch <batch script>

Exercises
---------

.. challenge:: Run the first serial example script from further up on the page for this short Python code (sum-2args.py)
    
    .. code-block:: python
    
        import sys
            
        x = int(sys.argv[1])
        y = int(sys.argv[2])
            
        sum = x + y
            
        print("The sum of the two numbers is: {0}".format(sum))
        
    Remember to give the two arguments to the program in the batch script.

.. solution:: Solution for HPC2N
    :class: dropdown
    
          This batch script is for Kebnekaise. Adding the numbers 2 and 3. 
          
          .. code-block:: sh
 
            #!/bin/bash
            #SBATCH -A hpc2n2024-114 # Change to your own after the course
            #SBATCH --time=00:05:00 # Asking for 5 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here for Python 3.11.3
            module load GCC/12.3.0  Python/3.11.3
            
            # Run your Python script 
            python sum-2args.py 2 3 

.. solution:: Solution for UPPMAX
    :class: dropdown
    
          This batch script is for UPPMAX. Adding the numbers 2 and 3. 
          
          .. code-block:: sh
 
            #!/bin/bash
            #SBATCH -A naiss2024-22-1202 # Change to your own after the course
            #SBATCH --time=00:05:00 # Asking for 5 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here for Python 3.11.8
            module load Python/3.11.8
            
            # Run your Python script 
            python sum-2args.py 2 3 

.. solution:: Solution for LUNARC 
    :class: dropdown 

          This batch script is for LUNARC (Cosmos). Adding the numbers 2 and 3. 

          .. code-block:: sh

            #!/bin/bash
            #SBATCH -A lu2024-7-80 # Change to your own after the course
            #SBATCH --time=00:05:00 # Asking for 5 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here for Python 3.11.3
            module load GCC/12.3.0  Python/3.11.3
            
            # Run your Python script 
            python sum-2args.py 2 3 
 
            
.. tip::

   - For parallel computing, you may get an introduction here: (https://uppmax.github.io/HPC-python/parallel.html)



.. keypoints::

   - The SLURM scheduler handles allocations to the calculation nodes
   - Batch jobs runs without interaction with user
   - A batch script consists of a part with SLURM parameters describing the allocation and a second part describing the actual work within the job, for instance one or several Python scripts.
      
      - Remember to include possible input arguments to the Python script in the batch script.
    
