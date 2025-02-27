Session: Matlab in Jupyter
==========================


.. questions::

   - How to reach the calculation nodes
   - How do I proceed to work interactively?
   
.. objectives:: 

   - Show how to reach the calculation nodes on UPPMAX and HPC2N by using Jupyter-lab
   - Test some commands on the calculation nodes

.. note::

   - It is possible to run Matlab directly on the login (including ThinLinc) nodes.
   - But this should *only* be done for shorter jobs or jobs that do not use a lot of resources, as the login nodes can otherwise become slow for all users. 
   - If you want to work interactively with your code or data, you should start an interactive session. In the present 
     lesson you will see how to run interactive jobs by using Jupyter-lab. 
   

.. admonition:: Compute allocations in this workshop 

   - Rackham: ``naiss2024-22-1202``
   - Kebnekaise: ``hpc2n2024-114``
   - Cosmos: ``lu2024-7-80``
 
.. admonition:: Storage space for this workshop 

   - Rackham: ``/proj/r-py-jl-m-rackham``
   - Kebnekaise: ``/proj/nobackup/r-py-jl-m`` 
   - Cosmos: your home directory should have plenty of space

There are several ways to run Matlab interactively

- Directly on the login nodes: **only** do this for short jobs that do not take a lot of resources
- As an interactive job on the computer nodes, launched via the batch system or Desktop On-Demand (LUNARC)
- Jupyter notebooks (HPC2N, UPPMAX)

- Like for Python it is possible to run Matlab in a notebook, i.e. in a web interface with possibility of inline 
        figures and debugging. An easy way to do this is to load *Python* and *Matlab* modules. In shell:

.. tabs::

   .. tab:: UPPMAX

      .. code-block:: console

         # Load Matlab 
         $ ml matlab/2023a
         # Load a Python version compatible with Matlab
         $ ml python/3.10.8
         # Create an environment called matlabenv (you can change this name)
         $ python -m venv ./matlabenv
         # Activate this environment
         $ source matlabenv/bin/activate
         # Perform installations: upgrade pip, and packages that you will need
         $ pip install --upgrade pip
         $ pip install -U scikit-learn
         # Install Jupyterlab
         $ pip install jupyterlab
         # Install the Matlab proxy
         $ pip install jupyter-matlab-proxy
         $ deactivate

      Start interactive session to not interfere with other users

      .. code-block:: console

         # Ask for a suitable amount of time. Remember, this is the time the Jupyter notebook will be available! HHH:MM:SS.
         $ interactive -A Project_ID -p core -n 1 -t 1:0:0
         # If you use a GPU node add this snippet to the interactive command (for clarity after project ID
         # -M snowy --gres:gpu:1 

         $ ml matlab/2023a
         $ ml python/3.10.8

         # Source the environment
         $ source matlabenv/bin/activate
         # Start JupyterLab
         $ jupyter lab --no-browser &
         $ <press enter to get to active prompt>
         $ firefox <url from output above> &

      When the Jupyter notebook interface starts, you can choose the **MATLAB kernel** version from the module you loaded. When you try to run a notebook, Matlab will ask for a type of license. Because you are running this notebook on our HPC center, you can choose the option Existing License and then Start MATLAB. It can take a minute or so to start.

   .. tab:: HPC2N

      .. code-block:: console

         # Load Matlab 
         $ ml MATLAB/2023a.Update4
         # Load a Python version compatible with Matlab and also CUDA (if you will run on GPUs)
         $ ml GCCcore/11.3.0  Python/3.10.4 CUDA/11.7.0
         # Create an environment called matlabenv (you can change this name)
         $ python -m venv ./matlabenv
         # Activate this environment
         $ source matlabenv/bin/activate
         # Perform installations: upgrade pip, and packages that you will need
         $ pip install --upgrade pip
         $ pip install -U scikit-learn
         # Install Jupyterlab
         $ pip install jupyterlab
         # Install the Matlab proxy
         $ pip install jupyter-matlab-proxy
         $ deactivate


      Fix the project ID in this batch job job.sh and send it to the queue:

      .. code-block:: bash

         #!/bin/bash
         # Here you should put your own project id
         #SBATCH -A Project_ID
         # This example asks for 1 core
         #SBATCH -n 1         
         # Ask for a suitable amount of time. Remember, this is the time the Jupyter notebook will be available! HHH:MM:SS.
         #SBATCH --time=06:20:00
         # If you use the GPU nodes uncomment the following lines
         #SBATCH --gpus=l40s:1

         # Clear the environment from any previously loaded modules
         module purge > /dev/null 2>&1
         # Load the module environment suitable for the job                                                                                       
         ml MATLAB/2023a.Update4 
         ml GCCcore/11.3.0  Python/3.10.4 
         ml CUDA/11.7.0 

         # Source the environment
         source matlabenv/bin/activate
         # Start JupyterLab
         jupyter lab --no-browser --ip $(hostname)

      Then, in the output file *slurm-<jobID>.out* file, copy the url that starts with *http://b-cn1403.hpc2n.umu.se:8888/lab* and 
      paste it in a Firefox browser on Kebnekaise. When the Jupyter notebook interface starts, you can choose the **MATLAB kernel**
      version from the module you loaded. When you try to run a notebook, Matlab will ask for a type of license. Because you are 
      running this notebook on our HPC center, you can choose the option Existing License and then Start MATLAB.

      If you don't need any longer the Jupyter job, you should cancel the job with ``scancel job_ID``. Otherwise it will keep running
      until the time limit of your batch script is reached.

      .. admonition:: Running Matlab in Jupyter on compute nodes at HPC2N

         - On Kebnekaise, you can run Jupyter notebooks with Matlab kernels by using batch scripts    
         - Notebook example: https://github.com/hpc2n/intro-course/blob/master/exercises/JUPYTERNOTEBOOKS/MATLAB/matlab_kernel.ipynb
         - https://docs.hpc2n.umu.se/tutorials/jupyter/


               
.. keypoints::

   - There are several ways to run MATLAB jobs interactively. One can use the MATLAB GUI, the interactive sessions: 
     ``salloc`` (HPC2N), ``interactive`` (UPPMAX), and also by running a Jupyter notebook on the computing nodes.
   
   - To run a Jupyter notebook on the computing nodes you will need to follow the prerequisites mentioned in the lesson. 
   - If the Jupyter job is no longer needed, cancel it with ``scancel job_ID``. It will not be canceled automatically if you just
     close the web browser.
    
