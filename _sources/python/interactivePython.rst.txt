Interactive work on the compute nodes
=====================================

.. tabs::

   .. tab:: Learning objectives

      - Understand what an interactive session is
      - Understand why one may need an interactive session
      - Start an interactive session
      - Test to be on an interactive node with the right amount of cores
      - End an interactive session
      - Start an interactive session with multiple cores
      - Test to be on an interactive node with multiple cores
      - Run an interactive-friendly Python script on multiple cores
      - Run an interactive-unfriendly Python script on multiple cores
      - End an interactive session with multiple cores

   .. tab:: For teachers

      Teaching goals are:

      - Learners have heard what an interactive session is
      - Learners have heard why one may need an interactive session
      - Learners have started an interactive session
      - Learners have tested to be on an interactive node
      - Learners have ended an interactive session
      - Learners have started an interactive session with multiple cores
      - Learners have tested to be on an interactive node with multiple cores
      - Learners have ended an interactive session with multiple cores

      Lesson plan (60 minutes in total):

      - 5 mins: prior knowledge
         - What types of nodes do our HPC clusters have?
         - What is the purpose of each of these nodes?
         - Imagine you are developing a Python script in a line-by-line fashion. How to do so best?
         - Why not do so on the login node?
         - Why not do so by using ``sbatch``?
      - 5 mins: presentation
      - 20 mins: challenge
      - 5 mins: feedback
      - 20 mins: continue challenge
      - 5 mins: feedback
         - What is the drawback of using an interactive node?

      Shortened lesson plan (20 minutes in total):

      - 5 mins: prior knowledge
         - What types of nodes do our HPC clusters have?
         - What is the purpose of each of these nodes?
         - Imagine you are developing a Python script in a line-by-line fashion. How to do so best?
         - Why not do so on the login node?
         - Why not do so by using ``sbatch``?
      - 5 mins: presentation
      - 5 mins: challenge
      - 5 mins: recap
         - What is the drawback of using an interactive node?

.. admonition:: Compute allocations in this workshop 

   - Rackham: ``naiss2024-22-1202``
   - Kebnekaise: ``hpc2n2024-114``
   - Cosmos: ``lu2024-7-80``

.. admonition:: Storage space for this workshop 

   - Rackham: ``/proj/r-py-jl-m-rackham``
   - Kebnekaise: ``/proj/nobackup/r-py-jl-m``

Introduction
------------

Some users develop Python code in a line-by-line fashion. 
These users typically want to run a (calculation-heavy) 
script frequently, to test if the code works.
However, scheduling each new line is too slow, as it
can take minutes before the new code is run.
Instead, there is a way to directly work 
with such code: use an interactive session.

Some other users want to run programs that 
(1) use a lot of CPU and memory, and (2) need to be persistent/available.
One good example is Jupyter. 
Running such a program on a login nodes would
harm all other users on the login node.
Running such a program on a computer node using ``sbatch``
would not allow a user to connect to it.
In such a case: use an interactive session.

.. admonition:: **About Jupyter**

    For HPC2N, using 
    `Jupyter on HPC2N <https://docs.hpc2n.umu.se/tutorials/jupyter/>`_ is possible, 
    through a batch job. This will be show in the Kebnekaise part of the simultaneous session. 

    For UPPMAX, using Jupyter is easier 
    and this will be shown in this course, in `the UPPMAX-only session on Jupyter <https://uppmax.github.io/HPC-python/jupyter.html>`_.

    For LUNARC, using Jupyter https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Python/#jupyter-lab() works best using the `LUNARC HPC Desktop <https://lunarc-documentation.readthedocs.io/en/latest/getting_started/using_hpc_desktop/>`_. Go to the Applications menu, hover over Applications - Python, and select Jupyter Lab from the menu that pops up to the right.

An interactive session is a session with direct access to a compute node.
Or alternatively: an interactive session is a session,
in which there is no queue before a command is run on a compute node.

In this session, we show how to:

- the different ways HPC2N, UPPMAX, and LUNARC provide for an interactive session
- start an interactive session
- check to be in an interactive session
- check to have booked the expected amount of cores
- end the interactive session

The different way HPC2N, UPPMAX, and LUNARC provide for an interactive session
------------------------------------------------------------------------------

.. mermaid:: interactive_node_transitions.mmd 

.. figure:: ../../img/cosmos-interactive.png
      :width: 400
      :align: center

Here we define an interactive session as a session 
with direct access to a compute node.
Or alternatively: an interactive session is a session,
in which there is no queue before a command is run on a compute node.

This differs between HPC2N, UPPMAX, and LUNARC:

- HPC2N: the user remains on a login node. 
  All commands can be sent directly to the compute node using ``srun``
- UPPMAX: the user is actually on a computer node.
  Whatever command is done, it is run on the compute node
- LUNARC: the user is actually on a computer node if the correct menu option is chosen.
  Whatever command is done, it is run on the compute node

Start an interactive session
----------------------------

To start an interactive session, one needs to allocate resources on the cluster first.
On the LUNARC HPC desktop, this is done by choosing applications from the Desktop On Demand
Applications menu and selecting/filling in resources in the GfxLauncher popup.
For HPC2N and UPPMAX, this must be done at the command line. See also the following table:

+---------+-----------------+-------------+-------------+
| Cluster | ``interactive`` | ``salloc``  | GfxLauncher |
+=========+=================+=============+=============+
| HPC2N   | Works           | Recommended | N/A         |
+---------+-----------------+-------------+-------------+
| UPPMAX  | Recommended     | Works       | N/A         |
+---------+-----------------+-------------+-------------+
| LUNARC  | Works           | N/A         | Recommended |
+---------+-----------------+-------------+-------------+


Start an interactive session in the simplest way
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To start an interactive session in the simplest way, is shown here:

.. tabs::

   .. tab:: UPPMAX

     Use:

      .. code-block:: console

         interactive -A [project_name]

      Where ``[project_name]`` is the UPPMAX project name,
      for example ``interactive -A naiss2024-22-107``.

      The output will look similar to this:

      .. code-block:: console

          [richel@rackham4 ~]$ interactive -A naiss2024-22-107
          You receive the high interactive priority.
          You may run for at most one hour.
          Your job has been put into the devcore partition and is expected to start at once.
          (Please remember, you may not simultaneously have more than one devel/devcore job, running or queued, in the batch system.)

          Please, use no more than 8 GB of RAM.

          salloc: Pending job allocation 9093699
          salloc: job 9093699 queued and waiting for resources
          salloc: job 9093699 has been allocated resources
          salloc: Granted job allocation 9093699
          salloc: Waiting for resource configuration
          salloc: Nodes r314 are ready for job
           _   _ ____  ____  __  __    _    __  __
          | | | |  _ \|  _ \|  \/  |  / \   \ \/ /   | System:    r314
          | | | | |_) | |_) | |\/| | / _ \   \  /    | User:      richel
          | |_| |  __/|  __/| |  | |/ ___ \  /  \    | 
           \___/|_|   |_|   |_|  |_/_/   \_\/_/\_\   | 

          ###############################################################################

                        User Guides: http://docs.uppmax.uu.se/

                        Write to support@uppmax.uu.se, if you have questions or comments.


          [richel@r314 ~]$ 

      Note that the prompt has changed to show that one is on an interactive node.
      
   .. tab:: HPC2N

      .. code-block:: console
          
         salloc -A [project_name]

      Where ``[project_name]`` is the HPC2N project name,
      for example ``interactive -A hpc2n2024-025``.

      This will look similar to this:

      .. code-block:: console

          b-an01 [~]$ salloc -n 4 --time=00:10:00 -A hpc2n2024-025 
          salloc: Pending job allocation 20174806
          salloc: job 20174806 queued and waiting for resources
          salloc: job 20174806 has been allocated resources
          salloc: Granted job allocation 20174806
          salloc: Waiting for resource configuration
          salloc: Nodes b-cn0241 are ready for job
          b-an01 [~]$ module load GCC/12.3.0 Python/3.11.3
          b-an01 [~]$ 

   .. tab:: LUNARC

      See https://uppmax.github.io/R-python-julia-matlab-HPC/common/ondemand-desktop.html#how-do-i-start


Indeed, all you really need is the project name.
However, this way may have some default settings 
that do not fit you.

Start an interactive session in a more elaborate way
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The simplest way to start an interactive session
may have some defaults settings that do not fit you:

- session duration is too short
- the session has too few cores available

Here we show how start an interactive session in a more elaborate way,
with a custom session duration and a custom amount of cores:
      
.. tabs::

   .. tab:: UPPMAX

      Here we start an interactive session on the ``devcore`` partition,
      with a custom session duration and a custom amount of cores:

      .. code-block:: console
          
         interactive -p devcore -n [n_tasks] --time=[duration] -A naiss2024-22-107

      where ``[n_tasks]`` is the number of tasks,
      ``[duration]`` is the time given in ``HHH:MM:SS`` format,
      and ``[project_name]`` is the UPPMAX project name.

      The parameters ``-p devcore`` mean that the ``devcore`` partition is used,
      which results in jobs that start either faster or just as fast. Nice!

      As an example, here an interactive job is started with 4 tasks,
      for 1 hour, for the UPPMAX project ``naiss2024-22-107``:

      .. code-block:: console

         interactive -p devcore -n 4 --time=1:00:00 -A naiss2024-22-107

      Note that, as Slurm uses 1 task per core by default, we request 4 cores.

      The output will be similar to this:

      .. code-block:: console
      
          [bjornc@rackham2 ~]$ interactive -A naiss2024-22-107 -p devcore -n 4 -t 10:00
          You receive the high interactive priority.
          There are free cores, so your job is expected to start at once.
      
          Please, use no more than 6.4 GB of RAM.
      
          Waiting for job 29556505 to start...
          Starting job now -- you waited for 1 second.

      
   .. tab:: HPC2N

      Here we start an interactive session,
      with a custom session duration and a custom amount of cores:

      .. code-block:: console
          
         interactive -n [n_tasks] --time=[duration] -A naiss2024-22-107

      where ``[n_tasks]`` is the number of tasks,
      ``[duration]`` is the time given in ``HHH:MM:SS`` format,
      and ``[project_name]`` is the HPC2N project name.

      As an example, here an interactive job is started with 4 tasks,
      for 1 hour, for the HPC2N project ``hpc2n2024-025``:

      .. code-block:: console
          
         salloc -n 4 --time=1:00:00 -A hpc2n2024-025

      Note that, as Slurm uses 1 task per core by default, we request 4 cores.

Check to be in an interactive session
-------------------------------------

.. tabs::

   .. tab:: UPPMAX

      To check to be in an interactive session, do:

      .. code-block:: console

         hostname

      If the output is ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you are on a computer node. Well done!

      If the output is ``rackham[number].uppmax.uu.se``, where ``[number]``
      is a number, you are still on a login node.
      
   .. tab:: HPC2N

      To check to be in an interactive session, do:

      .. code-block:: console

         srun hostname

      If the output is ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you are more-or-less on a computer node. Well done!

      If the output is ``[something else]``, where ``[number]``
      is a number, you are still on a login node.

      This is an example of output when 4 cores have been booked:

      .. code-block:: console
                  
           b-an01 [~]$ srun hostname
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se

      Misleading would be to use:

      .. code-block:: console

         hostname

      This will always show that you are on a login node

Check to have booked the expected amount of cores
-------------------------------------------------

.. tabs::

   .. tab:: UPPMAX

      To check to have booked the expected amount of cores:

      .. code-block:: console

         srun hostname

      The output should be one line of ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you have booked one core.

      If the output is more than one line of ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you have booked more than one core. 

      If the output is ``rackham[number].uppmax.uu.se``, where ``[number]``
      is a number, you are still on a login node.

      Here is an example of output when 4 cores had been booked:

      .. code-block:: console
      
          [bjornc@r483 ~]$ srun hostname
          r483.uppmax.uu.se
          r483.uppmax.uu.se
          r483.uppmax.uu.se
          r483.uppmax.uu.se
      
   .. tab:: HPC2N

      To check to have booked the expected amount of cores:

      .. code-block:: console

         srun hostname

      The output should be one line of ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you have booked one core.

      If the output is more than one line of ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you have booked more than one core. 

      If the output is ``[something else]``, where ``[number]``
      is a number, you are still on a login node.

      This is an example of output when 4 cores have been booked:

      .. code-block:: console
                  
           b-an01 [~]$ srun hostname
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se
           b-cn0241.hpc2n.umu.se

Running a Python script in an interactive session
-------------------------------------------------

.. tabs::

   .. tab:: UPPMAX

      To run a Python script in an interactive session,
      first load the Python modules:

      .. code-block:: console

         module load python/3.11.8

      To run a Python script on 1 core, do:

      .. code-block:: console

         python [my_script.py]

      where `[my_script.py]` is the path to a Python script, for example
      ``srun python ~/my_script.py``.

      To run a Python script on each of the requested cores, do:

      .. code-block:: console

         srun python [my_script.py]

      where `[my_script.py]` is the path to a Python script, for example
      ``srun python ~/my_script.py``.
      
   .. tab:: HPC2N

      To run a Python script in an interactive session,
      first load the Python modules:

      .. code-block:: console

         module load python/3.11.8

      To run a Python script on each of the requested cores, do:

      .. code-block:: console

         srun python [my_script.py]

      where `[my_script.py]` is the path to a Python script, for example
      ``srun python ~/my_script.py``.

Not all Python scripts are suitable for an interactive session.
This will be demonstrated by two Python example scripts.

Our first example Python script is called `sum-2args.py <https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/sum-2args.py>`_:
it is a simple script that adds two numbers from command-line arguments:
 
.. code-block:: python

    import sys
  
    x = int(sys.argv[1])
    y = int(sys.argv[2])
  
    sum = x + y
  
    print("The sum of the two numbers is: {0}".format(sum))

Our second example Python script is called `add2.py <https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/add2.py>`_:
it is a simple script that adds two numbers from user input:
 
.. code-block:: python

    # This program will add two numbers that are provided by the user

    # Get the numbers
    a = int(input("Enter the first number: ")) 
    b = int(input("Enter the second number: "))

    # Add the two numbers together
    sum = a + b

    # Output the sum
    print("The sum of {0} and {1} is {2}".format(a, b, sum))


End the interactive session
---------------------------

.. tabs::

   .. tab:: UPPMAX

      To end and interactive session, do:

      .. code-block:: console

         exit

      This will look similar to this:

      .. code-block:: console 
                  
          [bjornc@r484 ~]$ exit

          exit
          [screen is terminating]
          Connection to r484 closed.

          [bjornc@rackham2 ~]$

      Note that the prompt has changed to contain ``rackham[number].uppmax.uu.se``, 
      where ``[number]`` is a number, which indicates one is back on a login node.
      
   .. tab:: HPC2N

      To end and interactive session, do:

      .. code-block:: console

         exit

      It will look similar to this:

      .. code-block:: console 
                  
          b-an01 [~]$ exit
          exit
          salloc: Relinquishing job allocation 20174806
          salloc: Job allocation 20174806 has been revoked.
          b-an01 [~]$

      The prompt will remain the same.

Exercises
---------

In these exercises:

- we prepare to use two Python example scripts
- we use a minimal interactive session
- we use a more optimized interactive session

Exercise 0: be able to use the Python scripts
---------------------------------------------

Exercise 0.1. be able to use the first Python script
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. tabs::

   .. tab:: Exercise 0.1. be able to use the first Python script

      Find or download the first Python script, `sum-2args.py <https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/sum-2args.py>`_.

      Run it using ``python sum-2args.py 3 14``.

   .. tab:: UPPMAX

      Navigate to the folder with exercises, or download the script locally:

      .. code-block:: console
      
          # Go to the folder with exercises:
          cd /proj/r-py-jl/[username]/[exercise_folder]
          # For example
          # cd /proj/r-py-jl/sven/my_exercises

          # Download the script locally:
          wget https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/sum-2args.py

      After loading a Python module, run it.
      
   .. tab:: HPC2N

      Navigate to the folder with exercises, or download the script locally:

      .. code-block:: console
      
          # Go to the folder with exercises:
          cd /proj/nobackup/hpc2n2024-025/[username]/[exercise_folder]
          # For example
          # cd /proj/nobackup/hpc2n2024-025/sven/my_exercises

          # Download the script locally:
          wget https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/sum-2args.py

      After loading the modules needed to run Python, run the script as indicated.
                  
Exercise 0.2. be able to use the second Python script
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 0.2. be able to use the second Python script

      Find or download the second Python script, `add2.py <https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/add2.py>`_,

      Run it using ``python add2.py``.

   .. tab:: UPPMAX

      Navigate to the folder with exercises, or download the script locally:

      .. code-block:: console
      
          # Go to the folder with exercises:
          cd /proj/r-py-jl/[username]/[exercise_folder]
          # For example
          # cd /proj/r-py-jl/sven/my_exercises

          # Download the script locally:
          wget https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/add2.py

      After loading a Python module, run it.
      
   .. tab:: HPC2N

      Navigate to the folder with exercises, or download the script locally:

      .. code-block:: console
      
          # Go to the folder with exercises:
          cd /proj/nobackup/hpc2n2024-025/[username]/[exercise_folder]
          # For example
          # cd /proj/nobackup/hpc2n2024-025/sven/my_exercises

          # Download the script locally:
          wget https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/add2.py

      After loading the modules needed to run Python, run the script as indicated.

Exercise 1
----------

.. admonition:: Learning objectives

    - Start an interactive session with 1 core
    - Test to be on an interactive node
    - Test to be on an interactive session with 1 core
    - Run Python scripts on 1 core
    - End an interactive session

Exercise 1.1: start an interactive node
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 1.1: start an interactive node

      Start an interactive node in the simplest way possible.

   .. tab:: UPPMAX

      On UPPMAX, ``interactive`` is recommended:

      .. code-block:: console

         interactive -A naiss2024-22-107
      
   .. tab:: HPC2N

      .. code-block:: console
          
         salloc -A hpc2n2024-025

Exercise 1.2: check to be in an interactive session
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 1.2: confirm to be on a compute node

      Confirm to be on a compute node.

   .. tab:: UPPMAX

      Use:

      .. code-block:: console

         hostname

      If the output is ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you are on a computer node. Well done!

      If the output is ``rackham[number].uppmax.uu.se``, where ``[number]``
      is a number, you are still on a login node.
      
   .. tab:: HPC2N

      Use:

      .. code-block:: console

         srun hostname

      If the output is ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you are more-or-less on a computer node. Well done!

      If the output is ``[something else]``, where ``[number]``
      is a number, you are still on a login node.

      Misleading would be to use:

      .. code-block:: console

         hostname

      This will always show that you are on a login node


Exercise 1.3: check to have booked the expected amount of cores
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 1.3: confirm to have booked one core

      Confirm to have booked one core.

   .. tab:: UPPMAX

      Use:

      .. code-block:: console

         srun hostname

      The output should be one line of ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you have booked one core.

      If the output is more than one line of ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you have booked more than one core. 

      If the output is ``rackham[number].uppmax.uu.se``, where ``[number]``
      is a number, you are still on a login node.
      
   .. tab:: HPC2N

      Use:

      .. code-block:: console

         srun hostname

      The output should be one line of ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you have booked one core.

      If the output is more than one line of ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you have booked more than one core. 

      If the output is ``[something else]``, where ``[number]``
      is a number, you are still on a login node.

Exercise 1.4.1. Running the first Python script in an interactive session
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. tabs::

   .. tab:: Exercise 1.4.1. Running the first Python script in an interactive session

      Run the first Python example script, `sum-2args.py <https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/sum-2args.py>`_,
      in the interactive session.

   .. tab:: UPPMAX

      Run the script using ``python``:
         
      .. code-block:: console
      
          b-an01 [~]$ python sum-2args.py 3 4
          The sum of the two numbers is: 7
          b-an01 [~]$             
      
   .. tab:: HPC2N

      Run the script using ``srun``:
         
      .. code-block:: console
      
          b-an01 [~]$ srun python sum-2args.py 3 4
          The sum of the two numbers is: 7
          b-an01 [~]$             

                  
Exercise 1.4.2. Running a second Python script in an interactive session on all nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 1.4.2. Running a second Python script in an interactive session

      Run the second Python example script, `add2.py <https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/add2.py>`_,
      in the interactive session.

   .. tab:: UPPMAX

      Run the script using ``python``:
                  
      .. code-block:: console 
                  
          b-an01 [~]$ python add2.py 
          Enter the first number: 2
          Enter the second number: 3
          The sum of 2 and 3 is 5
      
   .. tab:: HPC2N

      Run the script using ``srun``:
                  
      .. code-block:: console 
                  
          b-an01 [~]$ srun python add2.py 
          Enter the first number: 2
          Enter the second number: 3
          The sum of 2 and 3 is 5

Exercise 1.5: exit
^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 1.5: exit

      Exit the interactive node

   .. tab:: UPPMAX

      Use:

      .. code-block:: console

         exit

      The prompt should change to contain ``rackham[number].uppmax.uu.se``, 
      where ``[number]`` is a number, which indicates you are back on a login node.
      
   .. tab:: HPC2N

      Use:

      .. code-block:: console

         exit

      The prompt will remain the same.


Exercise 2
----------

.. admonition:: Learning objectives

    - Start an interactive session with multiple cores
    - Test to be on an interactive node with multiple cores
    - Run an interactive-friendly Python script on multiple cores
    - Run an interactive-unfriendly Python script on multiple cores
    - End an interactive session

Exercise 2.1: start an interactive node
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 2.1: start an interactive node

      Start an interactive node in the simplest way possible.

   .. tab:: UPPMAX

      On UPPMAX, ``interactive`` is recommended:

      .. code-block:: console

         interactive -A naiss2024-22-107
      
   .. tab:: HPC2N

      .. code-block:: console
          
         salloc -A hpc2n2024-025

Exercise 2.2: check to be in an interactive session
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 2.2: confirm to be on a compute node

      Confirm to be on a compute node.

   .. tab:: UPPMAX

      Use:

      .. code-block:: console

         hostname

      If the output is ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you are on a computer node. Well done!

      If the output is ``rackham[number].uppmax.uu.se``, where ``[number]``
      is a number, you are still on a login node.
      
   .. tab:: HPC2N

      Use:

      .. code-block:: console

         srun hostname

      If the output is ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you are more-or-less on a computer node. Well done!

      If the output is ``[something else]``, where ``[number]``
      is a number, you are still on a login node.

      Misleading would be to use:

      .. code-block:: console

         hostname

      This will always show that you are on a login node


Exercise 2.3: check to have booked the expected amount of cores
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 2.3: confirm to have booked one core

      Confirm to have booked one core.

   .. tab:: UPPMAX

      Use:

      .. code-block:: console

         srun hostname

      The output should be one line of ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you have booked one core.

      If the output is more than one line of ``r[number].uppmax.uu.se``, where ``[number]``
      is a number, you have booked more than one core. 

      If the output is ``rackham[number].uppmax.uu.se``, where ``[number]``
      is a number, you are still on a login node.
      
   .. tab:: HPC2N

      Use:

      .. code-block:: console

         srun hostname

      The output should be one line of ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you have booked one core.

      If the output is more than one line of ``b-cn[number].hpc2n.umu.se``, where ``[number]``
      is a number, you have booked more than one core. 

      If the output is ``[something else]``, where ``[number]``
      is a number, you are still on a login node.

Exercise 2.4.1. Running the first Python script in an interactive session on all nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 2.4.1. Running the first Python script in an interactive session

      Run the first Python example script, `sum-2args.py <https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/sum-2args.py>`_,
      in an interactive session, on all nodes.

   .. tab:: HPC2N and UPPMAX

      Run the script using ``srun``:
         
      .. code-block:: console
      
          b-an01 [~]$ srun python sum-2args.py 3 4
          The sum of the two numbers is: 7
          The sum of the two numbers is: 7
          The sum of the two numbers is: 7
          The sum of the two numbers is: 7
          b-an01 [~]$             

      Similar to ``srun hostname``, 
      this script is run once per node
      and works as expected.
                        
Exercise 2.4.2. Running a second Python script in an interactive session on all nodes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 2.4.2. Running a second Python script in an interactive session

      Run the second Python example script, `add2.py <https://raw.githubusercontent.com/UPPMAX/R-python-julia-HPC/main/exercises/python/add2.py>`_,
      in an interactive session, on all nodes.

   .. tab:: HPC2N and UPPMAX

      Run the script using ``srun``:

      .. code-block:: console 
         
          b-an01 [~]$ srun python add2.py 
          2
          3
          Enter the first number: Enter the second number: The sum of 2 and 3 is 5
          Enter the first number: Enter the second number: The sum of 2 and 3 is 5
          Enter the first number: Enter the second number: The sum of 2 and 3 is 5
          Enter the first number: Enter the second number: The sum of 2 and 3 is 5
      
      As you can see, it is possible, 
      but it will not show any interaction it otherwise would have. 

Exercise 2.5: exit
^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Exercise 2.5: exit

      Exit the interactive node

   .. tab:: UPPMAX

      Use:

      .. code-block:: console

         exit

      The prompt should change to contain ``rackham[number].uppmax.uu.se``, 
      where ``[number]`` is a number, which indicates you are back on a login node.
      
   .. tab:: HPC2N

      Use:

      .. code-block:: console

         exit

      The prompt will remain the same.

Conclusion
----------

.. keypoints::

   You have:

   - seen how to use a compute node interactively,
     which differs between HPC2N and UPPMAX
   - checked if we are in an interactive session
   - checked if we have booked the right number of cores
   - run Python scripts in an interactive session,
     which differs between HPC2N and UPPMAX
   - seen that not all Python scripts 
     can be run interactively on multiples cores
   - exited an interactive session

Links
-----

- `This session taught at 2023-12-01 <https://youtu.be/Rt7-sGEHrp0?si=4AB4Nu6BpLhNJXzE>`_
