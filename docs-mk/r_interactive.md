Interactive work on the compute nodes
=========================================================

.. note::

   - It is possible to run R directly on the login (including ThinLinc) nodes.
      - *only* be done for short and small jobs 
      - otherwise become slow for all users. 
   - If you want to work interactively with your code or data, you should 
      - start an **interactive session**.
   - If you rather will run a script which **won't use any interactive user input while running**, you should
      - start a **batch job**, see previous session.
   
.. questions::

   - How do I proceed to work interactively on a compute node
   
.. objectives:: 

   - Show how to reach the calculation nodes on UPPMAX and HPC2N
   - Test some commands on the calculation nodes

.. admonition:: Compute allocations in this workshop 

   - Rackham: ``naiss2024-22-107``
   - Kebnekaise: ``hpc2n2024-025``

Overview of the UPPMAX systems
------------------------------

.. mermaid:: ../mermaid/uppmax2.mmd

Overview of the HPC2N system
----------------------------

.. mermaid:: ../mermaid/kebnekaise.mmd

General
-------

In order to run interactively, you need to have compute nodes allocated to run
on, and this is done through the batch system.  

.. warning::

    (HPC2N) Do note that it is not *real* interactivity as you probably mean
    it, as you will have to run it as a R script instead of by starting
    R and giving commands inside it. The reason for this is that you are
    not actually logged into the compute node and only sees the output of the
    commands you run. 


R "interactively" on the compute nodes 
--------------------------------------

To run interactively, you need to allocate resources on the cluster first. You
can use the command ``salloc``/``intereactive`` to allow interactive use of resources allocated to
your job. When the resources are allocated, you need to preface commands with
``srun`` in order to run on the allocated nodes instead of the login node. 
      
- First, you make a request for resources with ``interactive``/``salloc``, like this:

.. tabs::

   .. tab:: UPPMAX (interactive)

      .. code-block:: console
          
         $ interactive -n <tasks> --time=HHH:MM:SS -A naiss2024-22-107 
      
   .. tab:: HPC2N (salloc)

      .. code-block:: console
          
         $ salloc -n <tasks> --time=HHH:MM:SS -A hpc2n2024-025 
         
      
where <tasks> is the number of tasks (or cores, for default 1 task per core), time is given in 
      hours, minutes, and seconds (maximum T168 hours), and then you give the id for your project 
      (**naiss2023-22-44** for this course)

Your request enters the job queue just like any other job, and interactive/salloc will tell you that it is
      waiting for the requested resources. When salloc tells you that your job has been allocated 
      resources, you can interactively run programs on those resources with ``srun``. The commands 
      you run with ``srun`` will then be executed on the resources your job has been allocated. 
      If you do not preface with ``srun`` the command is run on the login node! 
      

You can now run R scripts on the allocated resources directly instead of waiting for 
      your batch job to return a result. This is an advantage if you want to test your R 
      script or perhaps figure out which parameters are best.
                  

.. warning::

   **Let us use ThinLinc**

   - ThinLinc app: ``<user>@rackham-gui.uppmax.uu.se``
   - ThinLinc in web browser: ``https://rackham-gui.uppmax.uu.se``   This requires 2FA!

   **Using terminal**

   - Remember to have X11 installed!
   - On Mac

      - install XQuartz

   - On Windows

      - Use MobaXterm or
      - install XMING and use with Putty or PowerShell



Example **Type along**
######################

.. type-along::

   **Requesting 4 cores for 10 minutes, then running R**

   .. tabs::

      .. tab:: UPPMAX

         .. code-block:: console
      
            [bjornc@rackham2 ~]$ interactive -A naiss2024-22-107 -p devcore -n 4 -t 10:00
            You receive the high interactive priority.
            There are free cores, so your job is expected to start at once.
      
            Please, use no more than 6.4 GB of RAM.
      
            Waiting for job 29556505 to start...
            Starting job now -- you waited for 1 second.
          

         Let us check that we actually run on the compute node: 

         .. code-block:: console
      
            [bjornc@r483 ~]$ srun hostname
            r483.uppmax.uu.se
            r483.uppmax.uu.se
            r483.uppmax.uu.se
            r483.uppmax.uu.se

         We are! Notice that we got a response from all four cores we have allocated.   

      .. tab:: HPC2N
         
         .. code-block:: console
      
            [~]$ salloc -n 4 --time=00:30:00 -A hpc2n2024-025
            salloc: Pending job allocation 20174806
            salloc: job 20174806 queued and waiting for resources
            salloc: job 20174806 has been allocated resources
            salloc: Granted job allocation 20174806
            salloc: Waiting for resource configuration
            salloc: Nodes b-cn0241 are ready for job
            [~]$ module load GCC/12.2.0  OpenMPI/4.1.4 R/4.2.2
            [~]$ 
                  
      
         Let us check that we actually run on the compute node: 
      
         .. code-block:: console
                  
            [~]$ srun hostname
            b-cn0241.hpc2n.umu.se
            b-cn0241.hpc2n.umu.se
            b-cn0241.hpc2n.umu.se
            b-cn0241.hpc2n.umu.se
      
         We are. Notice that we got a response from all four cores we have allocated.   
      
   **Running a script**
   
   .. warning::

      - You need to reload all modules you used on the login node!!!


   **The script** 

   Adding two numbers from user input (``serial_sum.R``)
   
   - You will find it in the exercise directory ``exercises/r/`` so go there with ``cd``.
   - Otherwise, use your favourite editor and add the text below and save as ``serial_sum.R``.
   
         
   .. code-block:: R
      
          # This program will add two numbers that are provided by the user
          args = commandArgs(trailingOnly = TRUE)
          res = as.numeric(args[1]) + as.numeric(args[2])
          print(paste("The sum of the two numbers is", res))
      
   **Running the script**

   - Note that the commands are the same for both HPC2N and UPPMAX!
      
   Running a R script in the allocation we made further up. Notice that since we asked for 4 cores, the script is run 4 times, since it is a serial script
         
   .. code-block:: console

          $ srun Rscript serial_sum.R 3 4
          [1] "The sum of the two numbers is 7"
          [1] "The sum of the two numbers is 7"
          [1] "The sum of the two numbers is 7"
          [1] "The sum of the two numbers is 7"
 
   Without the ``srun`` command, R won't understand that it can use several  cores. Therefore the program is run only once.
                  
   .. code-block:: console 
                  
          $ Rscript serial_sum.R 3 4
          [1] "The sum of the two numbers is 7"

   **Running R with workers**

   - First start R and check available workers with ``future``. 
   - Create a R script called `script-workers.R`` with the following content:

   .. code-block:: R 

         library(future)
         availableWorkers()
         availableCores()

   - Execute the code with ``srun -n 1 -c 4 Rscript script-workers.R``


Exit
####

When you have finished using the allocation, either wait for it to end, or close it with ``exit``

**Don't do it now!** 

- We shall test RStudio first in the next session!

   .. tabs::

      .. tab:: UPPMAX
   
         .. code-block:: console 
                  
                  [bjornc@r483 ~]$ exit
      
                  exit
                  [screen is terminating]
                  Connection to r483 closed.
      
                  [bjornc@rackham2 ~]$
     
      .. tab:: HPC2N
   
         .. code-block:: sh 
                  
                  [~]$ exit
                  exit
                  salloc: Relinquishing job allocation 20174806
                  salloc: Job allocation 20174806 has been revoked.
                  [~]$

.. keypoints::

   - Start an interactive session on a calculation node by a SLURM allocation
   
      - At HPC2N: ``salloc`` ...
      - At UPPMAX: ``interactive`` ...
   - Follow the same procedure as usual by loading the R module and possible prerequisites.
    
