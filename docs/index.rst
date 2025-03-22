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
        
         - write and submit **batch** scripts 
         - work **interactivly**
         - access **parallel** tools and run parallel codes 
         - access **GPUs** and run such code

   - This course will consist of lectures interspersed with hands-on sessions
     where you get to try out what you have just learned.

   - We aim to give this course in **spring and fall every year**.

.. admonition:: Course approach to deal with multiple HPC centers

   - The course is a NAISS cooperation between **UPPMAX** (Rackham, Snowy, Bianca), **HPC2N** (Kebnekaise), and **LUNARC** (Cosmos) and will focus on the compute systems at all three centres.
   - Although there are differences we will only have **few seperate sessions**.
   - Most participants will use NSC's Tetralith system or PDC's Dardel system for the course, as Kebnekaise, Rackham/Snowy, and Cosmos are only for local users. 
   - Local users mean affiliated to

      - Kebnekaise: UmU, IRF, MIUN, SLU, LTU. 
      - Cosmos: LU. 
      - Rackham/Snowy: UU. 

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

   - **Please be sure that you have gone through the** `pre-requirements <https://uppmax.github.io/R-matlab-julia-HPC/prereqs.html>`_
      - It mentions the familiarity with the LINUX command line.
      - The applications to connect to the clusters: terminals and ThinLinc (remote graphical desktop)
   - This course does not aim to improve your coding skills. Rather you will learn to understand the ecosystems and navigations for the the different languages on a HPC cluster.
     
 
Content of the course
---------------------

.. toctree::
   :maxdepth: 2
   :caption: Pre-requirements:

   prereqs.md
   preparations.md

.. toctree::
   :maxdepth: 2
   :caption: COMMON:

   common/login.rst
   common/use_tarball.rst
   common/use_text_editor.rst
   common/naiss_projects_overview.rst
   common/ondemand-desktop.rst
   common/hpc_clusters.rst
   common/parallel.rst
   common/other_courses.rst
   
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
   matlab/jobsMatlabGui.rst
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

   extra/r_extra.rst
   extra/matlab_extra.rst
   extra/julia_extra.rst

.. Indices and tables
.. ==================

.. * :ref:`genindex`
.. * :ref:`modindex`
.. * :ref:`search`
