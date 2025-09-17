Introduction
==============

.. admonition:: **Welcome!**

    - There is a *rather* new documentation for python at UPPMAX at: https://uppmax.uu.se/support/user-guides/python-user-guide/ 
    - We hope that it will be helpful for your future reference.
    - We will approximately follow the outline of it today.
    - We hope also to identify improvements of the page for today´s interactions with you!

.. admonition:: **Learning outcomes**
   
    - **load** and **run** python
    - **find** installed packages
    - install package with **pip**
    - install package with **conda**
    - Understand and create **virtual environments**
    - best practice
    
.. admonition:: Collabration document HackMD

    - Use the HackMD page for the workshop with your questions.
    - Depending on how many helpers we'll see how fast there are answers. 
        - Some answers may come after workshop.
    - https://hackmd.io/EW_atH_vR5iq-uBFV-CiTw?both
    - Type in left frame 
        - "-" means new bullet and <tab> indents the level.
        - don't focus too much on the formattiong if you are new to "Markdown" language!
    - **Have a try with the Icebreaker question**

.. admonition:: **Your expectations?**
   
    - find best practices for using Python at UPPMAX
    - using Conda
    - using Bianca
    
    **Not covered**
    
    - improve python *coding* skills 
    - Tetralith
    - Kebnekaise

.. warning::

    - It is good to have a familiarity with the LINUX command line. 
    - Short introductions may be found here: https://uppsala.instructure.com/courses/67267/pages/using-the-command-line-bash?module_item_id=455632
    - UPPMAX software library: https://uppsala.instructure.com/courses/67267/pages/uppmax-basics-software?module_item_id=455641
    - Whole intro course material can be reached here: https://www.uppmax.uu.se/support/courses-and-workshops/introductory-course-winter-2022/

.. admonition:: Prepare your environment now!
  
   - Please log in to Rackham or other cluster.
     e.g. ``ssh <user>@rackham.uppmax.uu.se``
   - Create a working directory (e.g. "pythonUPPMAX") where you can code along.

    
What is python?
---------------

As you probably already know…
    
    - “Python combines remarkable power with very clear syntax.
    - It has modules, classes, exceptions, very high level dynamic data types, and dynamic typing. 
    - There are interfaces to many system calls and libraries, as well as to various windowing systems. …“

- Documentation is found here https://www.python.org/doc/ .
- Python forum is found here https://python-forum.io/ .
- A nice introduction to packages can be found here: https://aaltoscicomp.github.io/python-for-scicomp/dependencies/
- CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Ther material addresses all academic disciplines and tries to be as programming language-independent as possible. https://coderefinery.org/lessons/
    
    - And, if you feel a little unfamiliar to the LINUX world, have a look at the Introduction to UPPMAX course material here: https://www.uppmax.uu.se/support/courses-and-workshops/introductory-course-winter-2022/
    
More python?
-----------

- CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Their material addresses all academic disciplines and tries to be as programming language-independent as possible. https://coderefinery.org/lessons/
- Introduction to Python at https://www.uppmax.uu.se/support/courses-and-workshops/introductory-course-winter-2022/
- Introduction to HPC (High performance computing) python at UPPMAX and HPC2N in September. More info to come!


Python at UPPMAX
----------------

The python application at UPPMAX comes with several preinstalled packages.
A very small selection of these are:
``Numpy``, ``Pandas``, ``Scipy``, ``Matplotlib``, ``Jupyter notebook``, ``pip``, ``cython``, ``ipython``

.. questions:: 

    - What to do if you need other packages?
    - How does it work on Bianca without internet?
    - What if I have projects with different requirements in terms of python and packages versions?
    
.. objectives:: 

    We will:
    
    - guide through the python ecosystem on UPPMAX
    - look at the package handlers **pip** and **conda**
    - explain how to create isolated environment 

.. warning:: 
   At UPPMAX we call the applications available via the *module system* **modules**. 
   https://www.uppmax.uu.se/resources/software/module-system/ 
   
   To distinguish these modules from the **python** *modules* that work as libraries we refer to the later ones as **packages**.

.. admonition:: Outline

   - Loading and running Python
   - Packages/modules
   - How to install packages
   - Isolated environments
   - Not this time: jupyter notebook & parallel jobs
        - Check the next SNIC training letter about new collaboration workshop in beginning of September.

