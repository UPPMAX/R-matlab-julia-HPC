Introduction Julia
==================

`Welcome page and syllabus <https://uppmax.github.io/HPC-python/index.html>`_
   - Also link at House symbol |:house:| at top of page 

.. admonition:: Learning outcomes
   
   - Learn how to load Julia modules and access site-installed Julia packages
   - Grasp the concept of Julia environments
   - Familiarize with Julia packages installation with **Pkg**
   - Acquire the knowledge of writing batch scripts for running Julia
   - Discover and explore the different Julia parallelization tools
   - Learn how Julia supports GPU computing
   - Gain knowledge on how to run ML jobs in Julia 
    
.. admonition:: Your expectations?
   
    - Find best practices for using Julia at UPPMAX and HPC2N
    - Get the hang of packages functioning
    - Use the HPC performance with Julia

    
    **Not covered**
    
    - Improve Julia *coding* skills 
    - Other clusters
      
.. admonition:: Julia Exercise files

    - On HPC2N, you can copy the Julia exercises in a tarball 
      from ``/proj/nobackup/r-py-jl-m/exercises.tar.gz``
    - On UPPMAX you can copy the exercises in a tarball 
      from ``/proj/r-py-jl-m-rackham/exercises.tar.gz``
    - On LUNARC you can copy the exercises in a tarball from ``~bbrydsoe/exercises.tar.gz`` 

.. admonition:: Exercises 

    - You can download the exercises from the course GitHub repo, under the "exercises" -> "julia" directory: https://github.com/UPPMAX/R-python-julia-matlab-HPC/tree/main/exercises/julia 
    - Copy the file and un-tar it in you personal project folder you created a while ago (https://uppmax.github.io/R-python-julia-matlab-HPC/index.html#prepare-your-environment-now). Finally enter the directory and list the content with the ``tree`` command.

    .. code-block:: bash

       cd /proj/r-py-jl-m-rackham/<your-name>        # on Rackham
       cd /proj/nobackup/r-py-jl-m/<your-name>       # on Kebnekaise
       cp ../exercises.tar.gz .
       tar zxvf exercises.tar.gz
       tree exercises/julia


Preliminary schedule
--------------------

.. list-table:: Preliminary times
   :widths: 25 25 50
   :header-rows: 1

   * - Time
     - Topic
     - Teacher
   * - 9:00
     - Log in 
     - BC, PO
   * - 9.45
     - **Coffee break**
     - 
   * - 10:00
     - Syllabus 
     - BC
   * - 10.15
     - Introduction, Julia in general
     - PO 
   * - 10.25
     - Loading modules and running Julia codes 
     - BC
   * - 10.55
     - **Break**
     - 
   * - 11.10
     - Packages and isolated environments   
     - PO
   * - 12.00
     - **LUNCH**
     -
   * - 13.00
     - SLURM Batch scripts for Julia jobs  
     - PO
   * - 13.50
     - **break**
     - 
   * - 14.05
     - Parallel and multithreaded functions   
     - PO
   * - 14.50
     - **break**
     - 
   * - 15.00
     - Simultaneous session — UPPMAX: Jupyter and interactive work
     - BC
   * - .
     - Simultaneous session — HPC2N: Jupyter
     - PO   
   * - 15.25
     - Summary 
     - BC
   * - 15.30
     - Evaluation
     - 
   * - 15.40
     - Q&A on-demand
     -
   * - 16.00
     - END
     -

.. instructor-note::

   - Intro 5 min 
   - Lecture and 10 min

What is Julia?
--------------

Julia is a relatively new Programming language (pre-released 1.0 announced in 2018), compared to well-known 
and standard languages such as Fortran, C, C++, R, and Python (some of them dated back to the 70's). 
A common pattern in those well-established languages (traditional paradigm) is that they look after either:

  - productivity (fast deployment, fast prototyping) or,
  - performance (fast numerical computations). 

This pattern created the so called **two-language problem** where programmers had to choose between **productivity** 
(R, Python) or **performance** (Fortran, C/C++) and when both were needed programmers had to learn the language that 
offered the desired capability and use some interface between different languages. 
Performant languages traditionally need to be compiled while languages focusing on productivity are interpreted.

Among the different features of Julia, is its capability of integrating both aspects **productivity and performance 
into a single language**. In this way, Julia programmers can in principle write software without changing their focus 
to learn a new language. 


.. figure:: ../../img/two-language.png
   :width: 450
   :align: center

   Two-language problem where Julia is shown as a bridge between the languages
   in the traditional paradigms, productivity vs. performance. 



Features of Julia
-----------------

According to the `Julia documentation <https://docs.julialang.org/en/v1/>`_ some of
the features of this language are:

- Good Base library with efficiently implemented operations written in Julia itself
- "Good performance, approaching that of statically-compiled languages like C"
- Modular and self-contained approach for libraries and development
- "A rich language of types for constructing and describing objects"
- A fast growing community of users and developers

Shortcomings of Julia
---------------------

- As this is a new language, the libraries ecosystem is not as rich as in Python or R, for instance
- Currently, using Julia for simple tasks (for instance, opening a file and writing text, plotting) is not as
  efficient as using Linux tools (AWK, GREP) or compiled languages (Fortran, C/C++, Rust)
- Previous situation is more noticeable upon running simple tasks in parallel mode (MPI, Threads)
- An initial code version can be fast (compared to base Python) with a code that is clear to
  novices and without spending a long time writing. However, if one needs to get a more optimized code, 
  it would most likely increase its complexity (readability) and one would need to spend more time 
  (learning/programming) as in the case of C/C++/Fortran.  



More on Julia
-------------

- Documentation at the HPC centres UPPMAX and HPC2N
   - UPPMAX: http://docs.uppmax.uu.se/software/julia/
   - HPC2N: https://www.hpc2n.umu.se/resources/software/julia
   - LUNARC: The user demand on Julia has been low, so there is currently no site-specific documentation.
- Official Julia documentation is found `here: <https://docs.julialang.org/en/v1/>`_
- Slack channel for Julia and instructions for joining it are found here: https://julialang.org/slack/
- `HPC2N YouTube video on Julia in HPC <https://www.youtube.com/watch?v=bXHe7Kj3Xxg>`_

Material for improving your programming skills
::::::::::::::::::::::::::::::::::::::::::::::

First level
...........

`The Carpentries <https://carpentries.org/>`_  teaches basic lab skills for research computing.

- `Programming with Julia  <https://carpentries-incubator.github.io/julia-novice/>`_ (alpha)

Second level
::::::::::::

CodeRefinery develops and maintains training material on software best practices for researchers that already 
write code. Their material addresses all academic disciplines and tries to be as **programming language-independent as possible**. 

- Not yet anything Julia specific

`ENCCS (EuroCC National Competence Centre Sweden) <https://enccs.se/>`_ is a national centre that supports 
industry, public administration and academia accessing and using European supercomputers. They give higher-level 
training of programming and specific software.

- `Julia for high-performance Computing <https://enccs.github.io/julia-for-hpc/>`_ 
- `Julia for High-performance data analytics <https://enccs.github.io/julia-for-hpda/>`_ 


Other NAISS centres
-------------------

- `Julia at NSC <https://www.nsc.liu.se/software/installed/tetralith/julia/>`_
- `Julia at PDC <https://www.pdc.kth.se/software/software/Julia/index_general.html>`_

.. keypoints::

   - Julia is a relatively new language with several attractive features.
   - Julia purpose is to avoid changing between high performance and high productivity languages
     in the different phases of code development.

