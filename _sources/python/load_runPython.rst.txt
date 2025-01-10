Load and run python
===================

At UPPMAX, HPC2N, and LUNARC we call the applications available via the module system modules. 
    - https://docs.uppmax.uu.se/cluster_guides/modules/ 
    - https://docs.hpc2n.umu.se/documentation/modules/
    - https://lunarc-documentation.readthedocs.io/en/latest/manual/manual_modules/ 

Most HPC centres in Sweden is using the same or similar module system for their software. The difference lies in which modules are installed and their versions/naming. The general examples below will be the same for all/most HPC centres in Sweden - the specific names for the modules will vary a little.
   
.. objectives:: 

   - Learn how to load Python
   - Learn how to run Python scripts and start the Python command line

.. admonition:: Short cheat sheet
    :class: dropdown 
    
    - See which modules exists: ``module spider`` or ``ml spider``
    - Find module versions for a particular software: ``module spider <software>``
    - Modules depending only on what is currently loaded: ``module avail`` or ``ml av``
    - See which modules are currently loaded: ``module list`` or ``ml``
    - Load a module: ``module load <module>/<version>`` or ``ml <module>/<version>``
    - Unload a module: ``module unload <module>/<version>`` or ``ml -<module>/<version>``
    - More information about a module: ``module show <module>/<version>`` or ``ml show <module>/<version>``
    - Unload all modules except the 'sticky' modules: ``module purge`` or ``ml purge``
    
.. warning::
   
   - Note that the module systems at UPPMAX, HPC2N, and LUNARC are slightly different. 
   - While all modules at UPPMAX not directly related to bio-informatics are shown by ``ml avail``, some modules at HPC2N and LUNARC are hidden until one has loaded a prerequisite like the compiler ``GCC``.
   - Thus, you need to use ``module spider`` or ``ml spider`` to see all modules at HPC2N and LUNARC, and ``ml avail`` for those available to load given your currently loaded prerequisites.  


- For reproducibility reasons, you should always load a specific version of a module instead of just the default version
- Many modules have prerequisite modules which needs to be loaded first (at HPC2N this is also the case for the Python modules). When doing ``module spider <module>/<version>`` you will get a list of which other modules needs to be loaded first


Check for Python versions
-------------------------

.. type-along::
   
   Checking for Python versions 
   
   .. tabs::

      .. tab:: UPPMAX

         Check all available Python versions with:

         .. code-block:: console

            $ module avail python


      .. tab:: HPC2N
   
         Check all available Python versions with:

         .. code-block:: console
 
            $ module spider Python
      
         To see how to load a specific version of Python, including the prerequisites, do 

         .. code-block:: console
   
            $ module spider Python/<version>

         Example for Python 3.11.3 

         .. code-block:: console

            $ module spider Python/3.11.3 


      .. tab:: LUNARC
   
         Check all available version Python versions with:

         .. code-block:: console
 
            $ ml spider Python
      
         To see how to load a specific version of Python, including the prerequisites, do 

         .. code-block:: console
   
            $ ml spider Python/<version>

         Example for Python 3.11.3 

         .. code-block:: console

            $ module spider Python/3.11.3 

.. note::

   We will use Python 3.11.x in this course! 

.. admonition:: Output at UPPMAX as of Feb 28 2024
   :class: dropdown
    
       .. code-block::  console
    
          $ ml spider python

          ----------------------------------------------------------------------
             python:
          ----------------------------------------------------------------------
                Versions:
                   python/2.7.6
                   python/2.7.9
                   python/2.7.11
                   python/2.7.15
                   python/3.3
                   python/3.3.1
                   python/3.4.3
                   python/3.5.0
                   python/3.6.0
                   python/3.6.8
                   python/3.7.2
                   python/3.8.7
                   python/3.9.5
                   python/3.10.8
                   python/3.11.4
                   python/3.11.8
                   python/3.12.1
                Other possible modules matches:
                   Biopython  Boost.Python  GitPython  IPython  Python  biopython  flatbuffers-python   netcdf4-python  
          ...

          ----------------------------------------------------------------------
          To find other possible module matches execute:

          $ module -r spider '.*python.*'

          -------------------------------------------------------------------------------------------------------
          For detailed information about a specific "python" package (including how to load the modules) use the module's full name.
          Note that names that have a trailing (E) are extensions provided by other modules.
          For example:

          $ module spider python/3.12.1
          -------------------------------------------------------------------------------------------------------

.. admonition:: Output at HPC2N (regular login node = Skylake nodes) as of 28 Feb 2024  
    :class: dropdown

        Note that the output may/will be different for the AMD Zen3/Zen4 nodes. Check if you want by logging in to kebnekaise-amd.hpc2n.umu.se and doing "module spider Python" there! 

        .. code-block:: console

           $ module spider Python
           ----------------------------------------------------------------------------
           Python:
           ----------------------------------------------------------------------------
           Description:
               Python is a programming language that lets you work more quickly and integrate your systems more effectively.
    
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
                Python/3.10.4-bare
                Python/3.10.4
                Python/3.10.8-bare
                Python/3.10.8
                Python/3.11.3
            Other possible modules matches:
                Biopython  Boost.Python  GitPython  IPython  Python-bundle-PyPI  flatbuffers-python intervaltree-python  ...
           ----------------------------------------------------------------------------

            To find other possible module matches execute:
               $ module -r spider '.*Python.*'
            ----------------------------------------------------------------------------
            For detailed information about a specific "Python" package (including how to load the modules) use the module's full name.
               Note that names that have a trailing (E) are extensions provided by other modules.
       
            For example:
            $ module spider Python/3.11.3
            ----------------------------------------------------------------------------


.. admonition:: Output at LUNARC (Milan nodes) as of Oct 8 2024
   :class: dropdown
    
       .. code-block::  console
    
          $ ml spider Python
           ----------------------------------------------------------------------------
           Python:
           ----------------------------------------------------------------------------
           Description:
              Python is a programming language that lets you work more quickly and integrate your systems more effectively.
        
            Versions:
                Python/2.7.18-bare
                Python/2.7.18
                Python/3.8.6
                Python/3.9.5-bare
                Python/3.9.5
                Python/3.9.6-bare
                Python/3.9.6
                Python/3.10.4-bare
                Python/3.10.4
                Python/3.10.8-bare
                Python/3.10.8
                Python/3.11.3
                Python/3.11.5
                Python/3.12.3
             Other possible modules matches:
                Biopython  GitPython  IPython  Python-bundle  Python-bundle-PyPI  bx-python  flatbuffers-python  meson-python  netcdf4-python  protobuf-python

           -----------------------------------------------------------------------------
              To find other possible module matches execute:
            
                  $ module -r spider '.*Python.*'

           ----------------------------------------------------------------------------
              For detailed information about a specific "Python" package (including how to load the modules) use the module's full name.
              Note that names that have a trailing (E) are extensions provided by other modules.
              For example:
            
                 $ module spider Python/3.12.3
           ----------------------------------------------------------------------------


Load a Python module
--------------------

For reproducibility, we recommend ALWAYS loading a specific module instead of using the default version! 

For this course, we recommend using Python 3.11.x, at UPPMAX (3.11.8), at HPC2N (3.11.3), and at LUNARC (3.11.3).

.. type-along::
    
   Loading a Python module. Here Python 3.11.x

   .. tabs::

      .. tab:: UPPMAX
   
         Go back and check which Python modules were available. To load version 3.11.8, do:

         .. code-block:: console

            $ module load python/3.11.8
        
         Note: Lowercase ``p``.
         For short, you can also use: 

         .. code-block:: console

            $ ml python/3.11.8

 
      .. tab:: HPC2N

         .. code-block:: console

            $ module load GCC/12.3.0 Python/3.11.3

         Note: Uppercase ``P``.   
         For short, you can also use: 

         .. code-block:: console

            $ ml GCC/12.3.0 Python/3.11.3


      .. tab:: LUNARC 

         .. code-block:: console

            $ module load GCC/12.3.0 Python/3.11.3 

         Note: Uppercase ``P``.
         For short, you can also use: 

         .. code-block:: console 

            $ ml GCC/12.3.0 Python/3.11.3 


.. warning::

   + UPPMAX: Don’t use system-installed python (2.7.5)
   + UPPMAX: Don't use system installed python3 (3.6.8)
   + HPC2N: Don’t use system-installed python (2.7.18)
   + HPC2N: Don’t use system-installed python3  (3.8.10)
   + LUNARC: Don’t use system-installed python/python3 (3.9.18) 

   + ALWAYS use python module

.. admonition:: Why are there both Python/2.X.Y and Python/3.Z.W modules?

    Some existing software might use `Python2` and some will use `Python3`. Some of the Python packages have both `Python2` and `Python3` versions. Check what your software as well as the installed modules need when you pick!  
    
.. admonition:: UPPMAX: Why are there both python/3.X.Y and python3/3.X.Y modules?

    Sometimes existing software might use `python2` and there's nothing you can do about that. In pipelines and other toolchains the different tools may together require both `python2` and `python3`.
    Here's how you handle that situation:
    
    + You can run two python modules at the same time if ONE of the module is ``python/2.X.Y`` and the other module is ``python3/3.X.Y`` (not ``python/3.X.Y``).

.. admonition:: LUNARC: Are ``python`` and ``python3`` equivalent, or does the former load Python/2.X.Y?

    The answer depends on which module is loaded. If Python/3.X.Y is loaded, then ``python`` is just an alias for ``python3`` and it will start the same command line. However, if Python/2.7.X is loaded, then `python` will start the Python/2.7.X command line while `python3` will start the system version (3.9.18).
    If you load Python/2.7.X and then try to load Python/3.X.Y as well, or vice-versa, the most recently loaded Python version will replace anything loaded prior, and all dependencies will be upgraded or downgraded to match. Only the system's Python/3.X.Y version can be run at the same time as a version of Python/2.7.X.
    
Run
---

Run Python script
#################

    
You can run a python script in the shell like this:

.. code-block:: console

   $ python example.py

or, if you loaded a python3 module, you can use:

.. code-block:: console

   $ python3 example.py

since python is a symbolic link to python3 in this case. 

NOTE: *only* run jobs that are short and/or do not use a lot of resources from the command line. Otherwise use the batch system!
    
.. note::

   Real cases will be tested in the **batch session** (https://uppmax.github.io/R-python-julia-matlab-HPC/python/batchPython.html). 

Run an interactive Python shell
###############################

For more interactiveness you can run Ipython.

.. type-along::

   Starting ipython

   .. tabs::

      .. tab:: UPPMAX

         NOTE: remember to load a python module first. Then start IPython from the terminal
      
         .. code-block:: console

            $ ipython 
    
         or 

         .. code-block:: console

            $ ipython3 
         
         UPPMAX has also ``jupyter-notebook`` installed and available from the loaded Python module. Start with
       
         .. code-block:: console

            $ jupyter-notebook 

         
      .. tab:: HPC2N
      
         NOTE: remember to load an **IPython** module first. You can see possible modules with 

         .. code-block:: console

            $ module spider IPython

         Then load one of them, for instance 8.14.0:

         .. code-block:: sh

            $ ml GCC/12.3.0 IPython/8.14.0

         Then start Ipython with (lowercase):

         .. code-block:: console

            $ ipython

         HPC2N also has Jupyter notebook/JupyterLab. More about that in the specific session.


      .. tab:: LUNARC

         LUNARC provides Jupyter Lab, Jupyter Notebook, and Spyder in ``Applications-Python``. LUNARC favors graphical development environments for interactive scripts; these are configured to run on our compute nodes with GfxLauncher as long as they are started from the ``Applications-Python`` menu (or the interactive terminal in ``Applications-General``). Jupyter Lab will be discussed in a later session. The Spyder IDE is currently associated with Anaconda3, but will be maintained separately and kept available after Anaconda is removed. However, if you want to use Python at the command line, with syntax coloring and without using a batch script, you can use IPython in the regular (front-end) or interactive (back-end) terminals.
         NOTE: remember to load an **IPython** module first. You can see possible modules and their prerequisites with 

         .. code-block:: console

            $ ml spider IPython

         Then load one of them, for instance 8.14.0:

         .. code-block:: sh

            $ ml GCC/12.2.0 IPython/8.14.0

         Then start Ipython with (lowercase):

         .. code-block:: console

            $ ipython


**Examples** (Try them out! Remember to load suitable modules first!) 

Python

.. code-block:: console

   $ python
   Python 3.11.3 (main, Oct 30 2023, 16:00:15) [GCC 12.3.0] on linux
   Type "help", "copyright", "credits" or "license" for more information.

.. code-block:: python

   >>> a=3
   >>> b=7
   >>> c=a+b
   >>> c
   10

iPython

.. code-block:: console

    $ ipython
    Python 3.11.3 (main, Oct 30 2023, 16:00:15) [GCC 12.3.0]
    Type 'copyright', 'credits' or 'license' for more information
    IPython 8.14.0 -- An enhanced Interactive Python. Type '?' for help.

.. code-block:: ipython

   In [1]: a=3
   In [2]: b=7
   In [3]: c=a+b
   In [4]: c
   Out[4]: 10


- Exit Python or IPython with <Ctrl-D>, "quit()" or "exit()" in the python prompt

Python

.. code-block:: python

    >>> <Ctrl-D>
    >>> quit()
    >>> exit()

iPython

.. code-block:: ipython

    In [2]: <Ctrl-D>
    In [12]: quit()
    In [17]: exit()

.. keypoints::

   - Before you can run Python scripts or work in a Python shell, first load a python module and probable prerequisites
   - Start a Python shell session either with ``python`` or ``ipython``
   - Run scripts with ``python <script.py>``
    

