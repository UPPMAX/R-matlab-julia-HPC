Interactive work on compute nodes
=================================

.. note::

   - It is possible to run Matlab directly on the login (including ThinLinc) nodes.
   - But this should *only* be done for shorter jobs or jobs that do not use a lot of resources, as the login nodes can otherwise become slow for all users.
   - If you want to work interactively with your code or data, you should start an interactive session.
   - If you rather will run a script which won't use any interactive user input while running, you can instead start a batch job, see next session.

.. questions::

   - How to reach the calculation nodes
   - How do I proceed to work interactively?

.. objectives::

   - Show how to reach the calculation nodes on UPPMAX and HPC2N
   - Test some commands on the calculation nodes

.. admonition:: Compute allocations in this workshop

   - Rackham: ``naiss2024-22-107``
   - Kebnekaise: ``hpc2n2024-025``

There are several ways to run Matlab interactively

- Directly on the login nodes: **only** do this for short jobs that do not take a lot of resources
- As an interactive job on the computer nodes, launched via the batch system or Desktop On-Demand (LUNARC)
- Jupyter notebooks (HPC2N, UPPMAX)

General
-------

In order to run interactively, you need to have compute nodes allocated to run on, and this is done through the batch system.

Because you will have to wait until the nodes are allocated, and because you cannot know when this happens,
this is not usually a recommended way to run MATLAB, but it is possible.

.. warning::

    (HPC2N) Do note that it is not *real* interactivity as you probably mean it, as you will have to run it as a
    batch script instead of by starting it and giving commands inside it.
    - The reason for this is that you are not actually logged into the compute node and only sees the output of the commands you run.

    Another option would be to use Jupyter notebooks.


Matlab "interactively" on the compute nodes
-------------------------------------------

To run interactively, you need to allocate resources on the cluster first.
You can use the command salloc to allow interactive use of resources allocated to your job.
When the resources are allocated, you need to preface commands with ``srun`` in order to
run on the allocated nodes instead of the login node.

- First, you make a request for resources with ``interactive``/``salloc``, like this:

.. tabs::

   .. tab:: UPPMAX (interactive)

      .. code-block:: console

         $ interactive -n <tasks> --time=HHH:MM:SS -A naiss2024-22-107

   .. tab:: HPC2N (salloc)

      .. code-block:: console

         $ salloc -n <tasks> --time=HHH:MM:SS -A hpc2n2023-110

   .. tab:: LUNARC (On-Demand Desktop/GfxLauncher)


where <tasks> is the number of tasks (or cores, for default 1 task per core), time is given in
      hours, minutes, and seconds (maximum T168 hours), and then you give the id for your project
      (**naiss2024-22-107** for this course)

Your request enters the job queue just like any other job, and interactive/salloc will tell you that it is
      waiting for the requested resources. When salloc tells you that your job has been allocated
      resources, you can interactively run programs on those resources with ``srun``. The commands
      you run with ``srun`` will then be executed on the resources your job has been allocated.
      If you do not preface with ``srun`` the command is run on the login node!


You can now run MATLAB scripts on the allocated resources directly instead of waiting for
      your batch job to return a result. This is an advantage if you want to test your MATLAB
      script or perhaps figure out which parameters are best.


Example **Code along**
######################

.. type-along::

   **Requesting 4 cores for 10 minutes, then running MATLAB**

   .. tabs::

      .. tab:: UPPMAX

         .. code-block:: console

            [bjornc@rackham2 ~]$ interactive -A naiss2024-22-107 -p core -n 4 -t 10:00
            You receive the high interactive priority.
            There are free cores, so your job is expected to start at once.

            Please, use no more than 6.4 GB of RAM.

            Waiting for job 29556505 to start...
            Starting job now -- you waited for 1 second.

            [bjornc@r483 ~]$ module load matlab

         Let us check that we actually run on the compute node:

         .. code-block:: console

            [bjornc@r483 ~]$ srun hostname
            r483.uppmax.uu.se
            r483.uppmax.uu.se
            r483.uppmax.uu.se
            r483.uppmax.uu.se

         We are. Notice that we got a response from all four cores we have allocated.

      .. tab:: HPC2N

         .. code-block:: console

            [~]$ salloc -n 4 --time=00:30:00 -A hpc2n2024-025
            salloc: Pending job allocation 20174806
            salloc: job 20174806 queued and waiting for resources
            salloc: job 20174806 has been allocated resources
            salloc: Granted job allocation 20174806
            salloc: Waiting for resource configuration
            salloc: Nodes b-cn0241 are ready for job

         Let us check that we actually run on the compute node:

         .. code-block:: console

            [~]$ srun hostname
            b-cn0241.hpc2n.umu.se
            b-cn0241.hpc2n.umu.se
            b-cn0241.hpc2n.umu.se
            b-cn0241.hpc2n.umu.se

         We are. Notice that we got a response from all four cores we have allocated.


parpool command
---------------

parpool starts a parallel pool of workers using the default profile. With default preferences, MATLAB® starts a pool on the local machine with one worker per physical CPU core up to the limit set in the default profile. For more information on parallel preferences, see

Running Matlab in a Jupyter notebook
------------------------------------

.. tabs::

   .. tab:: UPPMAX

      - For more interactiveness you can run

   .. tab:: HPC2N

      - Like for Python it is possible to run Matlab in a notebook, i.e. in a web interface with possibility of inline
        figures and debugging. An easy way to do this is to load *Python* and *Matlab* modules. In shell:

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
         pip install jupyter-matlab-proxy


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

      .. admonition:: Running Julia in Jupyter on compute nodes at HPC2N

         - On Kebnekaise, you can run Jupyter notebooks with Matlab kernels by using batch scripts
         - Notebook example: https://github.com/hpc2n/intro-course/blob/master/exercises/JUPYTERNOTEBOOKS/MATLAB/matlab_kernel.ipynb
         - https://www.hpc2n.umu.se/resources/software/jupyter-julia





.. keypoints::

   - **FIX**
   - Start an interactive session on a calculation node by a SLURM allocation

      - At HPC2N: ``salloc`` ...
      - At UPPMAX: ``interactive`` ...
   - Follow the same procedure as usual by loading the Julia module and possible prerequisites.

