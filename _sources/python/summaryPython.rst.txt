Summary
==============

.. keypoints::

   - Load and run
      - Use python from module system
      - Start a Python shell session either with ``python`` or ``ipython``
      - run scripts with ``python3 <script.py>``
   - Packages
      - Check for preinstalled packages
      
         - from the Python shell with the ``import`` command
         - from BASH shell with the
         
            - ``pip list`` command at both centers
            - ``ml help python/3.11.8`` at UPPMAX
            - ``module -r spider '.*Python.*'`` at HPC2N and LUNARC
            
      - Installation with *PYPI*
      
         - You install own packages with the ``pip install --user`` command
         
      - At UPPMAX Conda is also available 
      
         - Conda is an installer of packages but also bigger toolkits

         - Rackham: Pip or secondary conda
         - Bianca: conda and secondary wharf + (pip or conda)
     
   - Isolated environments 
      - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
      - Make it for each project you have for reproducibility.
      - There are different tools to create virtual environments.
      
         - HPC2N has ``virtualenv`` and ``venv``
         
            - install packages with ``pip``.
            - the flag ``--system-site-packages`` includes preinstalled packages as well
            
         - UPPMAX has ``venv`` and ``Conda`` 
         
            - venv is very similar to ``virtualenv``
            - Conda creates isolated environments as well
            
              - requires that you install all packages needed. 

         - LUNARC has ``virtualenv``, ``venv``, and ``conda`` 

   - Batch mode
      - The SLURM scheduler handles allocations to the calculation nodes
      - Batch jobs runs without interaction with user
      - A batch script consists of a part with *SLURM parameters* describing the allocation and a second part describing the actual work within the job, for instance one or several Python scripts.
      - Remember to include possible input arguments to the Python script in the batch script.
   
   - Interactive work on calculation nodes
      - Start an interactive session on a calculation node by a SLURM allocation (similar flags)
      
         - At HPC2N: ``salloc`` ...       not really interactive
         - At UPPMAX: ``interactive`` ...
         - At LUNARC: ``interactive`` ...   
         
      - Follow the same procedure as usual by loading the Python module and possible prerequisites

.. challenge:: Not really clear? (5 min)

    - Discuss in breakout rooms
    - Learn from each other

.. seealso::

    - For other topics, see `python documentation <https://www.python.org/doc/>`_. 
    - `Python forum <https://python-forum.io>`_.
    - A nice introduction to packages can be found here: https://aaltoscicomp.github.io/python-for-scicomp/dependencies/
    - CodeRefinery develops and maintains training material on software best practices for researchers that already write code. 
    
      - This material addresses all academic disciplines and tries to be as programming language-independent as possible. https://coderefinery.org/lessons/
    
