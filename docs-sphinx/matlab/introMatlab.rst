Introduction to MATLAB
======================

`Welcome page and syllabus <https://uppmax.github.io/R-matlab-julia-HPC/>`_
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

    - Find best practices for using MATLAB at UPPMAX, HPC2N, LUNARC, NSC (Tetralith), and PDC (Dardel)
    - Toolboxes and Add-Ons
    - HPC performance with MATLAB

    **Not covered**

    - Improve MATLAB *coding* skills
    - Other clusters

.. admonition:: MATLAB Exercise files

    - :ref:`common-use-tarball`

Schedule
--------

`Schedule <https://uppmax.github.io/R-matlab-julia-HPC/matlab/scheduleMatlab.html>`_

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
   - The way MATLAB automates multithreading means it will typically hog a full node unless you explicitly tell it not to by setting `-singleCompThread` as an option at startup, or unless your local cluster is configured to automatically limit the number of processes started on a login node.
   - The built-in plotting functions generate only very low-resolution raster graphics with no anti-aliasing, not suitable for publication.

MATLAB documentation at the centers
-----------------------------------

- Documentation at the HPC centres UPPMAX, HPC2N, LUNARC, NSC, and PDC
   - UPPMAX: http://docs.uppmax.uu.se/software/matlab/
   - HPC2N: https://www.hpc2n.umu.se/resources/software/matlab and https://www.hpc2n.umu.se/documentation/guides/parallel-matlab
   - LUNARC: https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/MATLAB/
   - NSC: click `here for general instructions <https://www.nsc.liu.se/software/docs/matlab/>`_ and `here for installations on Tetralith <https://www.nsc.liu.se/software/catalogue/tetralith/modules/matlab.html>`_ specifically
   - PDC: https://support.pdc.kth.se/doc/applications/?sub=matlab/

- Official MATLAB documentation is found `here <https://se.mathworks.com/help/matlab/index.html?s_tid=hc_panel>`_

.. seealso:: Material for improving your programming skills

   - `Extra material <https://uppmax.github.io/R-matlab-julia-HPC/extra/matlab_extra.html>`_

.. keypoints::

   - MATLAB is a 4th generation language with an interactive environment that can generate code that handles common problems for you.
   - Parallelization is easy with the GUI, but be careful to set ``-singleCompThread`` when starting it at the command line or it may hog a full node.

