.. R-matlab-julia-HPC documentation master file, created by
   sphinx-quickstart on Fri Jan 21 18:24:04 2022.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

Introduction to running R, Matlab and Julia in HPC
===========================================================

.. admonition:: Content

   - This course aims to give a brief, but comprehensive introduction to using R, Matlab, and Julia in an HPC environment.
   - You will learn how to
      - start the **interpreters** of Julia, R, and Matlab by the HPC module system
      - find site **installed packages/libraries**
      - **install packages/libraries** yourself
      - use **virtual** environments
      - use the **computation nodes**
        
         - write and submit batch scripts 
         - work interactivly
      - Learn about the batch system
      - Learn about GPUs
      - access parallel tools and run parallel codes 

   - This course will consist of lectures interspersed with hands-on sessions
     where you get to try out what you have just learned.

   - We aim to give this course in **spring and fall every year**.

.. admonition:: Course approach to deal with multiple HPC centers

   - The course is a cooperation between **UPPMAX** (Rackham, Snowy, Bianca), **HPC2N** (Kebnekaise), and **LUNARC** (Cosmos) and will focus on the compute systems at all three centres.
   - Although there are differences we will only have **few seperate sessions**.
   - Most participants will use NSC's Tetralith systems for the course, as Kebnekaise, Rackham/Snowy, and Cosmos are only for local users. Kebnekaise: UmU, IRF, MIUN, SLU, LTU. Cosmos: LU, Rackham/Snowy: UU. 
   - The general information given in the course will be true for all/most HPC centres in Sweden. 

      - The examples will often have specific information, like module names and versions, which may vary. What you learn here should help you to make any changes needed for the other centres. 
      - When present, links to the Julia/R/Matlab documentation at other NAISS centres are given in the corresponding session.



Schedule Spring 2025
--------------------

.. list-table:: 
   :widths: 25 25
   :header-rows: 1

   * - Day
     - Language
   * - Monday 24 March
     - R 
   * - Tuesday 25 March
     - Matlab
   * - Wednesday 26 March
     - Julia
   

.. admonition:: Some practicals

   - `Code of Conduct <https://github.com/UPPMAX/R-matlab-julia-HPC/blob/main/CODE_OF_CONDUCT.md>`_
      - Be nice to each other!
 
   - Zoom
       - You should have gotten an email with the links
      
       - Zoom policy:

          - Zoom chat (maintained by co-teachers):

            - technical issues of zoom
            - technical issues of your settings
            - direct communication 
            - each teacher may have somewhat different approach

          -  collaboration document (see below):

             - "explain again"         
             - elaborating the course content
             - solutions for your own work

       - Recording policy:
          - The lectures and demos will be recorded.
          - The questions asked per microphone during these sessions will be recorded
          - If you don't want your voice to appear use: 

             - use the collaboration document (see below)

       - The Zoom main room is used for most lectures
       - Some sessions use breakout rooms for exercises, some of which use a silent room
       

    
.. admonition:: Collaboration document

   - .. raw:: html

        <a target='_blank' href="https://umeauniversity.sharepoint.com/:w:/s/HPC2N630/EVIK4UtoAEBLoZaTgEH72-gBrsuVAhf7thq7iXKMzQCa2A?e=Rg3xCS">Q/A collaboration document</a>

   - Use this page for the workshop with your questions
   - It helps us identify content that is missing in the course material
   - We answer those questions as soon as possible

        
.. warning::

   - **Please be sure that you have gone through the `pre-requirements <https://uppmax.github.io/R-matlab-julia-HPC/prereqs.html>`_**
   - It mentions the familiarity with the LINUX command line.
   - The applications to connect to the clusters
      - terminals
      - remote graphical desktop ThinLinc
 
Material for improving your programming skills
----------------------------------------------

- This course does not aim to improve your coding skills.
- Rather you will learn to understand the ecosystems and navigations for the the different languages on a HPC cluster.

Briefly about the cluster hardware and system at NSC, UPPMAX, HPC2N, LUNARC
---------------------------------------------------------------------------

**What is a cluster?**

- Login nodes and calculations/computation nodes

- A network of computers, each computer working as a **node**.
     
- Each node contains several processor cores and RAM and a local disk called scratch.

.. figure:: ../img/node.png
   :align: center

- The user logs in to **login nodes**  via Internet through ssh or Thinlinc.

  - Here the file management and lighter data analysis can be performed.

.. figure:: https://docs.hpc2n.umu.se/images/cluster.png
   :align: center

   Source: https://docs.hpc2n.umu.se/images/cluster.png

- The **calculation nodes** have to be used for intense computing. 

The HPC centers NSC, UPPMAX, HPC2N, and LUNARC
==============================================

.. admonition:: Four HPC centers

   - There are many similarities:
   
     - Login vs. calculation/compute nodes
     - Environmental module system with (some) software hidden until loaded with ``module load``
     - Slurm batch job and scheduling system
     - ``pip install`` procedure
     
   - ... and small differences:
   
     - commands to load R, Julia, and MATLAB
     - slightly different flags to Slurm
     
   - ... and some bigger differences:


     - NSC has one NAISS system (and several others)

       - Tetralith (CPUs and GPUs)

     - UPPMAX has three different clusters: 

       - Rackham for general purpose computing on CPUs only
       - Snowy available for local projects and suits long jobs (< 1 month) and has GPUs
       - Bianca for sensitive data and has GPUs

     - HPC2N has Kebnekaise with GPUs.
     - LUNARC has Cosmos, with 9 GPUs (4 are partitions of Intel nodes).
     - LUNARC has Desktop On Demand, allowing some applications to run on the back-end without the use of a terminal or batch script.
     - Conda is recommended only for UPPMAX and LUNARC users, and only using the conda-forge repository.
    
Prepare your environment now!
-----------------------------

.. challenge:: Log in and create a user folder (if not done already)

   - Please log in to Rackham, Kebnekaise, Cosmos or other cluster that you are using.

   .. admonition:: Use Thinlinc or terminal?

      - It is up to you!
      - Graphics come easier with Thinlinc
      - For this course, when having many windows open, it may sometimes be better to run in terminal, for screen space issues.

   .. tabs::

      .. tab:: UPPMAX

         1. Log in to Rackham!

           - Terminal: ``ssh -X <user>@rackham.uppmax.uu.se``

           - ThinLinc app: 

               - server: ``rackham-gui.uppmax.uu.se``
               - username: ``<user>``

           - ThinLinc in web browser: ``https://rackham-gui.uppmax.uu.se``

         2. If not already: **create a working directory** where you can code along.

           - We recommend creating it under the course project storage directory

         3. Example. If your username is "mrspock" and you are at UPPMAX, then we recommend you create this folder:

            .. code-block:: console

               $ mkdir /proj/r-py-jl-m-rackham/mrspock/
 
      .. tab:: HPC2N

         - Kebnekaise through terminal: ``<user>@kebnekaise.hpc2n.umu.se``

         - Kebnekaise through ThinLinc app

               - server: ``kebnekaise-tl.hpc2n.umu.se``
               - username: ``<user>``

         - Create a working directory where you can code along.

           - Example. If your username is ``bbrydsoe`` and you are at HPC2N, then we recommend you create this folder:

           .. code-block:: console

              $ /proj/nobackup/r-py-jl-m/bbrydsoe/

      .. tab:: Cosmos

         - Cosmos through terminal: ``<user>@cosmos.lunarc.lu.se``
         - Cosmos through ThinLinc app,  (requires 2FA)

               - server: ``cosmos-dt.lunarc.lu.se``
               - username: ``<user>``

         - Create a working directory where you can code along. Users should have plenty of space in their home directories.

.. admonition:: Get exercises

   There are three main ways to get the exercises. In any case, you should do so from the directory you will be working in, on either Rackham, Kebnekaise, or Cosmos: 

   - Copy them from the computer system you are on (only until 2024-11-01) and unpack them by entering ``tar -xzvf exercises.tar.gz``

      - Rackham: ``cp /proj/r-py-jl-m-rackham/exercises.tar.gz`` .
      - Kebnekaise: ``cp /proj/nobackup/r-py-jl-m/exercises.tar.gz`` .
      - (No local repository for Cosmos)

   - Clone them with git from the repo (see below about a warning): ``git clone https://github.com/UPPMAX/R-python-julia-matlab-HPC.git``
   - Copy the tarball from the web into your working directory with ``wget https://github.com/UPPMAX/R-python-julia-matlab-HPC/raw/refs/heads/main/exercises/exercises.tar.gz`` and unpack them with ``tar -xzvf exercises.tar.gz``
   

.. warning:: Do you want the whole repo?

   - If you are happy with just the exercises, the tarballs of the language specific ones are enough.
   - By cloning the whole repo, you get all the materials, planning documents, and exercises.
   - If you think this makes sense type this in the command line in the directory you want it.
     - ``git clone https://github.com/UPPMAX/R-python-julia-matlab-HPC.git``
   - Note however, that if you during exercise work modify files, they will be overwritten if you make ``git pull`` (like if the teacher needs to modify something).
      - Then make a copy somewhere else with your answers!

.. admonition:: Summary of Project ID and directory name

   - Main project on UPPMAX:
     
        - Project ID: ``uppmax2025-2-272``
        - Directory name on rackham: ``/proj/r-py-jl-m-rackham``
        - Please create a suitably named subdirectory below ``/proj/r-py-jl-m-rackham``, for your own exercises. 
   

   - Local project on HPC2N: 

        - Project ID: ``hpc2n2025-062``
        - Directory name on Kebnekaise: ``/proj/nobackup/r-py-jl-m``
        - Please create a suitably named subdirectory below ``/proj/nobackup/r-py-jl-m``, for your own exercises.

   - Where to work on LUNARC

        - Project ID: ``lu2025-7-24`` (for use in slurm scripts)
        - Home directories have much larger quotas at LUNARC than at UPPMAX or HPC2N. Create a suitable sub-directory in your home directory or a personal project folder.


Content of the course
---------------------

.. toctree::
   :maxdepth: 2
   :caption: Pre-requirements:

   prereqs.md

.. toctree::
   :maxdepth: 2
   :caption: COMMON:

   common/login.rst
   common/ondemand-desktop.rst
   common/use_tarball.rst
   
.. toctree::
   :maxdepth: 2
   :caption: R Lessons:

   r/scheduleR.rst
   r/introR.rst
   r/load_runR.rst
   r/packagesR.rst
   r/isolatedR
   r/batchR.rst
   common/parallel.rst
   r/interactiveR.rst
   r/rstudio.rst
   r/MLR.rst
   r/summaryR.rst
   r/evaluationR.rst

.. toctree::
   :maxdepth: 2
   :caption: Matlab Lessons:

   matlab/scheduleMatlab.rst
   matlab/introMatlab.rst
   matlab/load_runMatlab.rst
   matlab/slurmMatlab.rst
   matlab/jobsMatlab.rst
   common/parallel.rst
   matlab/add_onsMatlab.rst
   matlab/local_desktopMatlab.rst
   matlab/jupyterMatlab.rst
   matlab/summaryMatlab.rst
   matlab/evaluationMatlab.rst

.. toctree::
   :maxdepth: 2
   :caption: Julia Lessons:

   julia/scheduleJulia.rst
   julia/introJulia.rst
   julia/load_runJulia.rst
   julia/isolatedJulia.rst
   julia/batchJulia.rst
   common/parallel.rst
   julia/interactiveJulia.rst
   julia/summaryJulia.rst
   julia/evaluationJulia.rst
   
.. toctree::
   :maxdepth: 2
   :caption: Extra reading:

   extra/isolated_extra.rst
   r/morepackages.rst
   r/packagesBianca.rst
   extra/matlab.rst

.. Indices and tables
.. ==================

.. * :ref:`genindex`
.. * :ref:`modindex`
.. * :ref:`search`
