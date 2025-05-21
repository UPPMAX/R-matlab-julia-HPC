Load and run python
===================

!!! note

    At both UPPMAX and HPC2N we call the applications available via the module system modules.
    - https://www.uppmax.uu.se/resources/software/module-system/
    - https://www.hpc2n.umu.se/documentation/environment/lmod


!!! info "objectives"

    - Show how to load Python
    - Show how to run Python scripts and start the Python command line

??? tip "Short cheat sheet"

    - See which modules exists: ``module spider`` or ``ml spider``
    - Find module versions for a particular software: ``module spider <software>``
    - Modules depending only on what is currently loaded: ``module avail`` or ``ml av``
    - See which modules are currently loaded: ``module list`` or ``ml``
    - Load a module: ``module load <module>/<version>`` or ``ml <module>/<version>``
    - Unload a module: ``module unload <module>/<version>`` or ``ml -<module>/<version>``
    - More information about a module: ``module show <module>/<version>`` or ``ml show <module>/<version>``
    - Unload all modules except the 'sticky' modules: ``module purge`` or ``ml purge``

!!! warning

    Note that the module systems at UPPMAX and HPC2 are slightly different. While all modules at UPPMAX not directly related to bio-informatics are shown by ``ml avail``, modules at HPC2N are hidden until one has loaded a prerequisite like the compiler ``GCC``.


- For reproducibility reasons, you should always load a specific version of a module instead of just the default version
- Many modules have prerequisite modules which needs to be loaded first (at HPC2N this is also the case for the Python modules). When doing ``module spider <module>/<version>`` you will get a list of which other modules needs to be loaded first


Check for Python versions
-------------------------

## Results {.tabset}

### UPPMAX

    Check all available Python versions with:

    ``` sh
    $ module avail python
    ```

### HPC2N

    Check all available version Python versions with:

    ``` sh
    $ module spider Python
    ``

    To see how to load a specific version of Python, including the prerequisites, do

    ``` sh
    $ module spider Python/<version>
    ```

    Example for Python 3.9.5

    ``` sh
    $ module spider Python/3.9.5
    ```

??? tip "Output at UPPMAX as of March 9 2022"

    ``` tcl

          -------------------------------------- /sw/mf/rackham/applications ---------------------------------------
           python_ML_packages/3.9.5    wrf-python/1.3.1

           --------------------------------------- /sw/mf/rackham/compilers ----------------------------------------
           python/2.7.6     python/3.3      python/3.6.0    python/3.9.5  (D)    python3/3.8.7
           python/2.7.9     python/3.3.1    python/3.6.8    python3/3.6.0        python3/3.9.5 (D)
           python/2.7.11    python/3.4.3    python/3.7.2    python3/3.6.8
           python/2.7.15    python/3.5.0    python/3.8.7    python3/3.7.2

           Where:
           D:  Default Module

           Use module spider" to find all possible modules and extensions.
           Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
    ```

??? tip "Output at HPC2N as of 27 July 2022"

    ```tcl

           b-an01 [~]$ module spider Python
           ----------------------------------------------------------------------------
           Python:
           ----------------------------------------------------------------------------
           Description:
               Python is a programming language that lets you work more quickly and
               integrate your systems more effectively.

            Versions:
                Python/2.7.15
                Python/2.7.16
                Python/2.7.18-bare
                Python/2.7.18
                Python/3.7.2
                Python/3.7.4
                Python/3.8.2
                Python/3.8.6
                Python/3.9.5-bare
                Python/3.9.5
                Python/3.9.6-bare
                Python/3.9.6
            Other possible modules matches:
                Biopython  Boost.Python  GitPython  IPython  flatbuffers-python  ...
           ----------------------------------------------------------------------------
           To find other possible module matches execute:
               $ module -r spider '.*Python.*'
           ----------------------------------------------------------------------------
           For detailed information about a specific "Python" package (including how to load the modules) use the module's full name.
               Note that names that have a trailing (E) are extensions provided by other modules.

           For example:
            $ module spider Python/3.9.5
           ----------------------------------------------------------------------------
    ```

Load a Python module
--------------------

For reproducibility, we recommend ALWAYS loading a specific module instead of using the default version!

For this course, we recommend using Python 3.9.5

.. tabs::

   .. tab:: UPPMAX

      Go back and check which Python modules were available. To load version 3.9.5, do:

      .. code-block:: sh

        $ module load python/3.9.5

      Note: Lowercase ``p``.
      For short, you can also use:

      .. code-block:: sh

         $ ml python/3.9.5


   .. tab:: HPC2N


      .. code-block:: sh

         $ module load GCC/10.3.0 Python/3.9.5

      Note: Uppercase ``P``.
      For short, you can also use:

      .. code-block:: sh

         $ ml GCC/10.3.0 Python/3.9.5

.. warning::

   + UPPMAX: Don’t use system-installed python/2.7.5
   + HPC2N: Don’t use system-installed python/2.7.18
   + ALWAYS use python module

.. admonition:: Why are there both Python/2.X.Y and Python/3.Z.W modules?

    Some existing software might use `Python2` and some will use `Python3`. Some of the Python packages have both `Python2` and `Python3` versions. Check what your software as well as the installed modules need when you pick!

.. admonition:: UPPMAX: Why are there both python/3.X.Y and python3/3.X.Y modules?

    Sometimes existing software might use `python2` and there's nothing you can do about that. In pipelines and other toolchains the different tools may together require both `python2` and `python3`.
    Here's how you handle that situation:

    + You can run two python modules at the same time if ONE of the module is ``python/2.X.Y`` and the other module is ``python3/3.X.Y`` (not ``python/3.X.Y``).



Run
---

Run Python script
#####################


You can run a python script in the shell like this:

.. code-block:: sh

   $ python example.py

or, if you loaded a python3 module, you can use:

.. code-block:: sh

   $ python3 example.py

since python is a symbolic link to python3 in this case.

NOTE: *only* run jobs that are short and/or do not use a lot of resources from the command line. Otherwise use the batch system!

More information will follow later in the course on running Python from within a **batch job**.

Exit Python with <Ctrl-D>, "quit()" or 'exit()’ in the python prompt

.. code-block:: python

    >>> <Ctrl-D>
    >>> quit()
    >>> exit()


Run an interactive Python shell
###############################

For more interactiveness you can run Ipython

.. tabs::

   .. tab:: UPPMAX

      NOTE: remember to load a python module first. The start IPython from terminal

      .. code-block:: sh

         $ ipython

      or

      .. code-block:: sh

         $ ipython3

      UPPMAX has also ``jupyter-notebook`` installed and available from the loaded Python module. Start with

      .. code-block:: sh

         $ jupyter-notebook

      More info to be given in the UPPMAX session.


   .. tab:: HPC2N

      NOTE: remember to load an IPython module first. You can see possible modules with

      .. code-block:: sh

         $ module spider IPython
         $ ml IPython/7.25.0

      Then start Ipython with (lowercase):

      .. code-block:: sh

         $ ipython


Exit Python or IPython with <Ctrl-D>, "quit()" or 'exit()’ in the python prompt

.. code-block:: ipython

    In [2]: <Ctrl-D>
    In [12]: quit()
    In [17]: exit()

.. admonition:: Workflow

   In addition to loading Python, you will also often need to load site-installed modules for Python packages, or use own-installed Python packages. The work-flow would be something like this:


   1) Load Python and prerequisites: `module load <pre-reqs> Python/<version>``
   2) Load site-installed Python packages (optional): ``module load <pre-reqs> <python-package>/<version>``
   3) Activate your virtual environment (optional): ``source <path-to-virt-env>/bin/activate``
   4) Install any extra Python packages (optional): ``pip install --no-cache-dir --no-build-isolation <python-package>``
   5) Start Python or run python script: ``python``

   Installed Python modules (modules and own-installed) can be accessed within Python with ``import <package>`` as usual.

   The command ``pip list`` given within Python will list the available modules to import.

   More about packages and virtual/isolated environment to follow in later sections of the course!


.. keypoints::

   - Before you can run Python scripts or work in a Python shell, first load a python module and its prerequisites
   - Start a Python shell session either with ``python`` or ``ipython``
   - Run scripts with ``python <script.py>``


