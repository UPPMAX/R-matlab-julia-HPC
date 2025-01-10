Introduction to MATLAB
======================

`Welcome page and syllabus <https://uppmax.github.io/R-python-julia-matlab-HPC/>`_
   - Also link at House symbol |:house:| at top of page 

.. admonition:: Learning outcomes
   
   - Load MATLAB modules and site-installed MATLAB packages
   - Create a MATLAB environment
   - Install MATLAB packages with **Add-Ons** manager
   - Write a batch script for running MATLAB
   - Use MATLAB in parallel mode
   - Use GPUs with MATLAB
   - Use MATLAB for ML 
    
.. admonition:: Your expectations?
   
    - Find best practices for using MATLAB at UPPMAX, HPC2N, and LUNARC
    - Toolboxes and Add-Ons
    - HPC performance with MATLAB

    **Not covered**
    
    - Improve MATLAB *coding* skills 
    - Other clusters
      
.. admonition:: MATLAB Exercise files

    - Link to exercises tarball: https://github.com/UPPMAX/R-python-julia-matlab-HPC/raw/refs/heads/main/exercises/exercises.tar.gz
    - Or you can copy them from the computer system you are on (only until 2024-11-01) and unpack them with ``tar -xzvf exercises.tar.gz``

      - Rackham: cp /proj/r-py-jl-m-rackham/exercises.tar.gz .
      - Kebnekaise: cp /proj/nobackup/r-py-jl-m/exercises.tar.gz . 


.. challenge:: Download the exercise files

    - Use ``wget`` to download the tarball from the web, if you didn't copy it from your local computer system.
    - Un-tar it with ``tar -xzvf <filename.tar.gz>`` in your personal project folder, which you should have created a while ago (https://uppmax.github.io/R-python-julia-matlab-HPC/index.html#prepare-your-environment-now).
    - Enter the directory and list the content with the ``tree`` command.

Preliminary schedule
--------------------

.. list-table:: Preliminary times
   :widths: 25 25 50
   :header-rows: 1

   * - Time
     - Topic
     - Teacher(s)
   * - 9:00
     - Log in 
     - Several
   * - 9.45
     - **Coffee break**
     - 
   * - 10:00
     - Syllabus 
     - RP
   * - 10.15
     - Introduction, MATLAB in general
     - RP
   * - 10.25
     - Loading modules and running MATLAB codes 
     - RP
   * - 10.50
     - **Break**
     - 
   * - 11.05
     - Slurm job scheduler and Matlab  
     - BB
   * - 12.00
     - **LUNCH**
     -
   * - 13.00
     - Matlab GUI and Slurm
     - PO, RP
   * - 13.30
     - Parallel and multithreaded functions   
     - PO
   * - 13.50
     - **break**
     - 
   * - 14.00
     - Cont'd Parallel and multithreaded functions   
     - PO
   * - 14.30
     - Add-Ons 
     - BC
   * - 14.50
     - **Coffee break**
     - 
   * - 15.05
     - Simultaneous session — UPPMAX: Client on the local desktop
     - BC
   * - .
     - Simultaneous session — MATLAB in Jupyter
     - PO
   * - .
     - Simultaneous session — LUNARC: MATLAB with Desktop On Demand
     - RP
   * - 15.35
     - Summary 
     -
   * - 15.40
     - Evaluation
     -
   * - 15.50
     - Q&A on-demand
     -
   * - 16.00
     - END
     -

.. instructor-note::

   - Intro 10 min 
   - Lecture and demo 10 min
   - Exercise 0 min



What is MATLAB?
---------------

MATLAB is a numerical computing environment and fourth generation programming language. Developed by MathWorks, MATLAB allows matrix manipulation, plotting of functions and data, implementation of algorithms, creation of user interfaces, and interfacing with programs in other languages. Although it is numeric only, an optional toolbox uses the MuPAD symbolic engine, allowing access to computer algebra capabilities.


Features of MATLAB
------------------

Distinguishing pros of MATLAB include:
   - A "low-code" interactive development environment (IDE) in which many common data import methods, analysis techniques, plotting formats, and even AI/ML techniques can be run from menus and generate the code required to reproduce the results automatically
   - A rich library of Toolboxes and Add-Ons for different STEM disciplines, especially for modeling and simulations, all written and tested by professionals
   - Automatic multi-threading (note: this can also be a drawback)
   - The ability to set cluster configurations and parallelization settings graphically, and save them to profiles that can be reloaded at a click.
   - Full documentation available straight from the command line (requires internet)

Of course MATLAB also has some drawbacks:
   - It is proprietary software, so you need to buy a license and sign up for an account. Many Add-Ons require a separate license.
   - With respect to the 2-language problem (where one can optimize for either performance or ease of prototyping, but not both), MATLAB even moreso than Python is geared toward usability. It can be slow.
   - The way MATLAB automates multithreading means it will hog a full node unless you explicitly tell it not to by setting `-SingleCompThread` as an option at startup. 
   - The built-in plotting functions generate only very low-resolution raster graphics with no anti-aliasing, not suitable for publication.


More on MATLAB?
---------------

- Documentation at the HPC centres UPPMAX, HPC2N, and LUNARC
   - UPPMAX: http://docs.uppmax.uu.se/software/matlab/
   - HPC2N: https://www.hpc2n.umu.se/resources/software/matlab and https://www.hpc2n.umu.se/documentation/guides/parallel-matlab
   - LUNARC: https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/MATLAB/
- Official MATLAB documentation is found `here: <https://se.mathworks.com/help/matlab/index.html?s_tid=hc_panel>`_

Material for improving your programming skills
::::::::::::::::::::::::::::::::::::::::::::::

If you have a Mathworks account that is less than 2 years old, Mathworks offers free `MATLAB self-paced online training courses <https://matlabacademy.mathworks.com/?page=1&fq=all-matlab&sort=featured&s_tid=ln_acad_learn_oc>`_. Students at any academic institution with a campus-wide license can use their university email addresses to create a free account to access these resources.

The Mondays with MATLAB lecture series is offered every September. These and other events are posted `here <https://se.mathworks.com/company/events.html>`_. Mondays with MATLAB consist of 3 introductory lectures:
- Introduction to MATLAB

If you have an account, you will be automatically signed up for the Mathworks mailing list, which will notify you of upcoming webinars as well as some featured packages. The webinars cover a broad range of topics and disciplines at varying skill levels, although these seminars tend to be more advanced.


Other NAISS centres
-------------------

- `MATLAB at NSC <https://www.nsc.liu.se/software/catalogue/tetralith/modules/matlab.html>`_
- `MATLAB at PDC <https://www.pdc.kth.se/software/software/matlab/index_general.html>`_

.. keypoints::

   - MATLAB is a 4th generation language with an interactive environment that can generate code that handles common problems for you.
   - Parallelization is easy with the graphic user interface, but be careful to set ``-SingleCompThread`` when starting it at the command line or it may hog the nodes.

