Introduction Python
===================

`Welcome page and syllabus <https://uppmax.github.io/R-python-julia-matlab-HPC/index.html>`_
   - Also link at House symbol |:house:| at top of page 

.. admonition:: **Learning outcomes**
   
   - Load Python modules and site-installed Python packages
   - Create a virtual environment
   - Install Python packages with pip (Kebnekaise, Rackham, Snowy, Cosmos)
   - Write a batch script for running Python
  
.. admonition:: Exercises 

    - You can download the exercises from the course GitHub repo, under the ``exercises/python`` directory: <https://github.com/UPPMAX/R-python-julia-matlab-HPC/tree/main/exercises/python>

      - Download all exercises at once: ``wget https://raw.githubusercontent.com/UPPMAX/R-python-julia-matlab-HPC/refs/heads/main/exercises/exercises.tar.gz``

    - Or you can copy them from the computer system you are on (only until 2024-11-01): 

      - Rackham: ``cp /proj/r-py-jl-m-rackham/exercises.tar.gz`` .
      - Kebnekaise: ``cp /proj/nobackup/r-py-jl-m/exercises.tar.gz`` . 

    - Then afterwards you unpack it with ``tar -xzvf exercises.tar.gz``
    
.. admonition:: **Your expectations?**
   
    - Learn best practices for using Python at UPPMAX, HPC2N, and LUNARC
    - Packages
    - Get HPC performance with Python

 **Not covered**
    
    - Improving Python *coding* skills 
    - Other clusters (though they mostly work in a very similar way)

Schedule
--------------------

+-------+---------------------------------------+-------------------+
| Time  | Topic                                 | Teacher(s)        |
+=======+=======================================+===================+
| 9:00  | (optional) First login                | BB + PO + RB + RP |
+-------+---------------------------------------+-------------------+
| 9:45  | Break                                 | .                 |
+-------+---------------------------------------+-------------------+
| 10:00 | Syllabus                              | RP                |
+-------+---------------------------------------+-------------------+
| 10:10 | Python in general                     | RP                |
+-------+---------------------------------------+-------------------+
| 10:20 | Load modules and run                  | RP                |
+-------+---------------------------------------+-------------------+
| 10:50 | Break                                 | .                 |
+-------+---------------------------------------+-------------------+
| 11:05 | Packages                              | RB                |
+-------+---------------------------------------+-------------------+
| 11:35 | Isolated environments                 | RB                |
+-------+---------------------------------------+-------------------+
| 12:00 | Lunch                                 | .                 |
+-------+---------------------------------------+-------------------+
| 13:00 | Batch                                 | BB                |
+-------+---------------------------------------+-------------------+
| 13:30 | GPU                                   | BB                |
+-------+---------------------------------------+-------------------+
| 13:50 | Break                                 | .                 |
+-------+---------------------------------------+-------------------+
| 14:05 | Simultaneous sessions                 | .                 |
+-------+---------------------------------------+-------------------+
| .     | HPC2N: Jupyter                        | BB                |
+-------+---------------------------------------+-------------------+
| .     | LUNARC: Interactive, Spyder, Jupyter  | RP                |
+-------+---------------------------------------+-------------------+
| .     | UPPMAX: Interactive, Jupyter          | RB                |
+-------+---------------------------------------+-------------------+
| 14:35 | Break                                 | .                 |
+-------+---------------------------------------+-------------------+
| 14:50 | Parallel and multi-threaded functions | PO                |
+-------+---------------------------------------+-------------------+
| 15:35 | Summary and evaluation                | RB                |
+-------+---------------------------------------+-------------------+
| 15:50 | End of the day                        | .                 |
+-------+---------------------------------------+-------------------+

- RB: suggests 'Batch' to get 10 more minutes
  and more all sessions
  in the next course iteration

What is python?
---------------

As you probably already know…
    
    - “Python combines remarkable power with very clear syntax.
    - It has modules, classes, exceptions, very high level dynamic data types, and dynamic typing. 
    - There are interfaces to many system calls and libraries, as well as to various windowing systems. …“

In particular, what sets Python apart from other languages is its fantastic
open-source ecosystem for scientific computing and machine learning with
libraries like NumPy, SciPy, scikit-learn, Pandas, and Pytorch.

- `Official Python documentation <https://www.python.org/doc/>`_
- `Python forum <https://python-forum.io/>`_
- `NumPy documentation <https://numpy.org/>`_
- `SciPy user guide <https://docs.scipy.org/doc/scipy/tutorial/index.html>`_
- `Pandas user guide <https://pandas.pydata.org/docs/user_guide/index.html#user-guide>`_
- `scikit-Learn documentation <https://scikit-learn.org/stable/>`_
- ...etc.

Material for improving your programming skills
::::::::::::::::::::::::::::::::::::::::::::::

First level
...........

`The Carpentries <https://carpentries.org/>`_  teaches basic lab skills for research computing.

- `"Programming with Python" <https://swcarpentry.github.io/python-novice-inflammation/>`_ 

- `"Plotting and Programming in Python" <http://swcarpentry.github.io/python-novice-gapminder/>`_ 

Second level
::::::::::::

CodeRefinery develops and maintains training material on software best practices for researchers that already write code. Their material addresses all academic disciplines and tries to be as programming language-independent as possible. 

- `Lessons <https://coderefinery.org/lessons/>`_ 
- `Data visualization using Python <https://coderefinery.github.io/data-visualization-python/>`_
- `Jupyter <https://coderefinery.github.io/jupyter/>`__

Aalto Scientific Computing

- `Data analysis workflows with R and Python <https://aaltoscicomp.github.io/data-analysis-workflows-course/>`_

- `Python for Scientific Computing <https://aaltoscicomp.github.io/python-for-scicomp/>`_ 

   - `Introduction to packages <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_ 


Third level
:::::::::::

`ENCCS (EuroCC National Competence Centre Sweden) <https://enccs.se/>`_ is a national centre that supports industry, public administration and academia accessing and using European supercomputers. They give higher-level training of programming and specific software.

- `High Performance Data Analytics in Python <https://enccs.github.io/hpda-python/>`_

- The youtube video `Thinking about Concurrency <https://www.youtube.com/watch?v=Bv25Dwe84g0>`_ is a good introduction to writing concurrent programs in Python 

- The book `High Performance Python <https://www.oreilly.com/library/view/high-performance-python/9781492055013/>`_ is a good resource for ways of speeding up Python code.
    
Other NAISS centres
-------------------

- C3SE
   - `Python <https://www.c3se.chalmers.se/documentation/applications/python/>`__
   - `Jupyter <https://www.c3se.chalmers.se/documentation/applications/jupyter/>`__
- NSC
   - `Python <https://www.nsc.liu.se/software/python/>`__
- PDC
   - `Python <https://www.pdc.kth.se/software/software/python/index_general.html>`__

.. objectives:: 

    We will:
    
    - Teach you how to navigate the module system
    - Show you how to find out which versions of Python and packages are installed
    - Use the package handler **pip**
    - Explain briefly how to create and use virtual environments
    - Show you how to run batch jobs 
    - Show some examples with parallel computing and using GPUs

    Most of this will be the same or very similar to how it is done at other HPC centres in Sweden  
 

