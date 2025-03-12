Exercises
=========


Isolated
--------

.. challenge:: Create a virtual environment with a requirements file below

   - Create a virtual environment with Python 3.11.X (check what is available on your cluster) with the name ``analysis``.
   - Install packages defined by the ``requirements.txt`` file (save it).
  
   .. code-block:: sh
   
      numpy==1.22.3
      matplotlib==3.5.2
      pandas==1.4.2
    
   - Check that the packages were installed.
   - Don't forget to deactivate afterwards.

.. solution:: Solution for UPPMAX
    :class: dropdown
    
     .. code-block:: sh

          $ module load python/3.11.8
          $ python -m venv --system-site-packages /proj/naiss2024-22-107/<user>/python/analysis
    
      Activate it.

      .. code-block:: sh

         $ source /proj/naiss2024-22-107/<user>/python/analysis/bin/activate

      - Note that your prompt is changing to start with (analysis) to show that you are within an environment.
      - Install the packages from the file::
      
        pip install -r requirements.txt
      
      .. code-block:: sh

         $ pip list
	 $ deactivate
      
.. solution:: Solution for HPC2N
    :class: dropdown
    
     .. code-block:: sh

          $ module load GCC/12.3.0 Python/3.11.3
          $ virtualenv --system-site-packages /proj/nobackup/hpc2n2024-025/<your-directory>/analysis 
      
      Activate it.

      .. code-block:: sh

         $ source /proj/nobackup/hpc2n2024-025/<your-directory>/analysis/bin/activate

      - Note that your prompt is changing to start with (analysis) to show that you are within an environment.
      - Install the packages from the file::
      
        pip install -r requirements.txt
      
      .. code-block:: sh

         $ pip list
	 $ deactivate
      


Conda (UPPMAX)
--------------

.. challenge:: UPPMAX: Create a conda environment and install some packages
    
   - Be sure to deactivate any virtual environment. 
   - First check the current installed packages while having ``python/3.11.8`` loaded
   - Open a new terminal and have the old one available for later comparison
   - Use the conda module on Rackham and create an environment with name ``HPC-python24`` with ``python 3.11``  and ``numpy 1.22``
   
   	- Use your a path for ``CONDA_ENVS_PATH`` of your own choice or ``/proj/naiss2024-22-107/<user>/python``
        - (It may take a minute or so)
	
   - Activate!
   - Check with ``pip list`` what is there. Compare with the environment given from the python module in the first terminal window. 
   
   	- Which version of Python did you get?
	
   - Don't forget to deactivate the Conda environment before doing other exercises!

.. solution:: Solution for UPPMAX
    :class: dropdown
    
          Write this in the terminal
          
          .. code-block:: sh

            $ module load conda
            $ export CONDA_ENVS_PATH=/proj/naiss2024-22-107/<user>/python
            $ conda create --name HPC-python24 python=3.11 numpy=1.22
            $ source activate HPC-python24
            $ pip list
            $ python -V
            $ source deactivate

Batch
-----

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
            #SBATCH -A hpc2n2025-062 # Change to your own after the course
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
            #SBATCH -A uppmax2025-2-272 # Change to your own after the course
            #SBATCH --time=00:05:00 # Asking for 5 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here for Python 3.11.8
            module load python/3.11.8
            
            # Run your Python script 
            python sum-2args.py 2 3 

