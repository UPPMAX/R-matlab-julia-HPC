Isolated environments, extra exercises
======================================

Exercise 2: work with ``Example-gpu``
-------------------------------------

.. tabs::

   .. tab:: Learning objectives

       - Rehearse creating a Python virtual environment from a step-by-step instruction

   .. tab:: For teachers

       Takes around 7 minutes for an experienced user.

       Installing the packages takes 6 minutes.


This exercise if for UPPMAX users only.

In this exercise, we create another environment ``Example-gpu``
in the same step-by-step fashion as done in exercise 1:

.. mermaid:: isolated_workflow_vpyenv.mmd

This virtual environment called ``Example-gpu`` 
is used for examples where the use of GPUs is demonstrated,
by using the ``numba`` and ``PyTorch`` Python packages.

Because the structure is the same as Exercise 1, see exercise 1 for details.

Exercise 2.1: load the modules needed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Here we need an older Python module, 
as that is what available on the Snowy computer cluster:

.. code-block:: console

    module load python/3.9.5

Exercise 2.2: create the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: console

    python -m venv --system-site-packages /proj/r-py-jl/<user>/python/Example-gpu

where ``[username]`` is your UPPMAX username, for example ``python -m venv --system-site-packages /proj/r-py-jl/sven/python/Example-gpu``.

Exercise 2.3: activate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code-block:: console

    source /proj/r-py-jl/<user>/python/Example-gpu/bin/activate

where ``[username]`` is your UPPMAX username, for example ``source /proj/r-py-jl/sven/python/Example-gpu/bin/activate``.

Exercise 2.4: install Python packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Installing these packages takes around 6 minutes.

.. prompt:: 
    :language: bash
    :prompts: (Example-gpu) $

    pip install --upgrade numpy scipy numba torch

Exercise 2.5: check if the Python packages are installed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. prompt:: 
    :language: bash
    :prompts: (vpyenv) $

    pip list

Exercise 2.6: use the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Not now :-)

Exercise 2.7: deactivate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. prompt:: 
    :language: bash
    :prompts: (Example-gpu) $

    deactivate

Exercise 3: export and import a virtual environment
---------------------------------------------------

.. tabs::

   .. tab:: Learning objectives

       - Rehearse creating a Python virtual environment
       - Export a virtual environment from a step-by-step instruction
       - Import a virtual environment from a step-by-step instruction

   .. tab:: For teachers

       Takes around 14 minutes for an experienced user.

       Installing the packages takes 13 minutes.

In this exercise, we export and import a virtual environment.
Additionally, you get to rehearse to create a virtual environment:
as we have done this earlier, the answers will now be hidden :-)

.. mermaid:: isolated_workflow_vpyenv.mmd

Exercise 3.1: load the modules needed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 1: load the modules needed

      Load the modules for Python 3.11.x.

   .. tab:: UPPMAX

      .. code-block:: console

          module load python/3.11.8

   .. tab:: HPC2N

      .. code-block:: console

          module load GCC/12.3.0 Python/3.11.3 

Exercise 3.2: create the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 2: create the virtual environment

      Create a virtual environment with the name ``analysis``.

   .. tab:: UPPMAX

      .. code-block:: console

          python -m venv --system-site-packages /proj/r-py-jl/[username]/python/analysis

   .. tab:: HPC2N

      .. code-block:: console

          python -m venv --system-site-packages /proj/nobackup/hpc2n2024-025/[username]/python/analysis 


Exercise 3.3: activate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 3: activate the virtual environment

      Activate the virtual environment.

   .. tab:: UPPMAX

      .. code-block:: console

          source /proj/r-py-jl/[username]/python/analysis/bin/activate

   .. tab:: HPC2N

      .. code-block:: console

          source /proj/nobackup/hpc2n2024-025/[username]/python/analysis/bin/activate

Exercise 3.4: install Python packages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Installing these packages takes around 13 minutes.

.. tabs::

   .. tab:: Step pre-4: create file

       Create a file called ``requirements.txt``, with the following content:

       .. code-block:: sh

           numpy==1.22.3
           matplotlib==3.5.2
           pandas==1.4.2

   .. tab:: UPPMAX

      Use `any text editor available on UPPMAX <http://docs.uppmax.uu.se/software/text_editors/>`_.

   .. tab:: HPC2N

      Use any text editor, for example, ``nano``.

.. tabs::

   .. tab:: Step 4: install Python packages

       Install packages by using the ``requirements.txt`` file:

      .. code-block:: console

          pip install -r requirements.txt

   .. tab:: UPPMAX

      Yup, just do that:

      .. code-block:: console

          pip install -r requirements.txt

   .. tab:: HPC2N

      Yup, just do that:

      .. code-block:: console

          pip install -r requirements.txt


Exercise 3.5: check if the Python packages are installed
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 5: check if the Python packages are installed

       Check that the packages were installed.

   .. tab:: UPPMAX

      .. code-block:: console

          pip list

   .. tab:: HPC2N

      .. code-block:: console

          pip list



Exercise 3.6: use the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 6: use the virtual environment

      Export the Python packages our virtual environment uses:

      .. code-block:: console

          pip freeze > requirements.txt

      View the file ``requirements.txt``.

   .. tab:: UPPMAX

      There are many ways to view a file, for example:

      .. code-block:: console

          cat requirements.txt

   .. tab:: HPC2N

      There are many ways to view a file, for example:

      .. code-block:: console

          cat requirements.txt

Exercise 3.7: deactivate the virtual environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. tabs::

   .. tab:: Step 7: deactivate the virtual environment

       Deactivate the virtual environment

   .. tab:: UPPMAX

      .. code-block:: console

          deactivate

   .. tab:: HPC2N

      .. code-block:: console

          deactivate

