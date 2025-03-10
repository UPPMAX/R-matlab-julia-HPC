Python packages
===============

.. tabs::

    .. tab:: Learning objectives

        - navigate the documentation
        - determine which Python packages are installed
        - load a module that adds more pre-installed Python packages
        - install a Python package

    .. tab:: For teachers

        Teaching goals are:

        - Learners have navigated the documentation
        - Learners have determined which Python packages are installed
        - Learners have loaded a module
          that adds more pre-installed Python packages
        - Learners have installed a Python package

        Lesson plan (30 minutes in total):

        - 5 mins: prior knowledge
            - What are Python packages?
            - Why use Python packages?
            - How to find out if a package is already installed?
            - How to install a Python package?
        - 5 mins: presentation
        - 15 mins: challenge
        - 5 mins: feedback
            - What are Python packages?
            - Why use Python packages?
            - How to find out if a package is already installed?
            - How to install a Python package?

.. admonition:: Compute allocations in this workshop 

    - Rackham: ``naiss2024-22-1202``
    - Kebnekaise: ``hpc2n2024-114``
    - Cosmos: ``lu2024-7-80``

.. admonition:: Storage space for this workshop 

    - Rackham: ``/proj/r-py-jl-m-rackham``
    - Kebnekaise: ``/proj/nobackup/r-py-jl-m``

Introduction
------------

Packages are pieces of Python code written to be used by others.
When possible, using an existing Python package
is usually smarter than writing code yourself.
In this session, we practice working with packages.

Finding packages
----------------

.. mermaid:: package_user_journey.mmd

The most common Python packages come installed when loading a regular Python module.
Some of the more complex packages, are part of a module for more complex Python packages.
If a package is not installed, however, you can also install it.

Python package installers
-------------------------

.. mermaid:: package_installers.mmd

There are two Python package installers, called ``conda`` and ``pip``.

In this session, we use ``pip``, as it can be used on all
the HPC clusters used in this course:

+-------------------+-----------------+------------------+------------------+
| Package installer | HPC2N           | LUNARC           | UPPMAX's Rackham |
+===================+=================+==================+==================+
| ``conda``         | Unsupported     | Recommended      | Supported        |
+-------------------+-----------------+------------------+------------------+
| ``pip``           | Recommended     | Supported        | Supported        |
+-------------------+-----------------+------------------+------------------+

In this session we use ``pip``, because it is a commonly-used package installation system that works on all HPC clusters used in this course.
The use of ``conda`` (and its differences with ``pip``) can be read at
`this course's 'Extra Reading' section Conda at UPPMAX <https://uppmax.github.io/R-python-julia-matlab-HPC/python/condaUPPMAX.html>`_.

In this session, we will install packages to your default user folder.
Because this one default user folder, installing a different version of one package
for one computational experiment, may have consequences for others.
These problems are addressed in the session on isolated environments.

Exercises
---------

.. admonition:: Need a video?
    :class: dropdown

    You can see a video on how these exercises are done here:

    - `HPC2N <https://youtu.be/lXfSvy_gRLc>`_
    - `LUNARC <https://youtu.be/jlvrgRP94mw>`_
    - `UPPMAX <https://youtu.be/nIkjk8R8rx0>`_


These exercises follow a common user journey, 
for a user that needs to use a certain Python packages:

- In exercise 1, we use a Python package that comes with the Python module
- In exercise 2, we use a Python package that comes with a software module
- In exercise 3, we install a Python package ourselves

Like any user, we'll try to be autonomous and read your favorite HPC center's
documentation.

Exercise 1: loading a Python package that comes with the Python module
----------------------------------------------------------------------

.. admonition:: Learning objectives

    - Practice reading documentation
    - Apply/rehearse the documentation to load a module
    - Apply the documentation to show if a Python package is already installed

Some Python packages come with loading a Python module.
Here we see this in action.

For this exercise, use the documentation of your HPC center:

- `HPC2N python packages <https://docs.hpc2n.umu.se/tutorials/userinstalls/#python__packages>`_
- `LUNARC Python <https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Python/>`_
- `UPPMAX Python <http://docs.uppmax.uu.se/software/python/>`_

Load the Python module of the correct version,
including prerequisite modules if needed:

+--------+----------------+
| Center | Python version |
+========+================+
| HPC2N  | 3.11.3         |
+--------+----------------+
| LUNARC | 3.11.3         |
+--------+----------------+
| UPPMAX | 3.11.8         |
+--------+----------------+

.. admonition:: Answer HPC2N
    :class: dropdown

    To search for the main Python module in general:

    .. code-block:: bash

        module spider Python

    To find out how to load the Python 3.11.3 module:

    .. code-block:: bash

        module spider Python/3.11.3

    Do what the documentation indicates:

    .. code-block:: bash

        module load GCC/12.3.0 Python/3.11.3

    If you get an error, because you've already loaded
    (conflicting) modules, do the command below and try again:

    .. code-block:: bash

        module purge

.. admonition:: Answer LUNARC
    :class: dropdown

    To search for the main Python module in general:

    .. code-block:: bash

        module spider Python

    To find out how to load the Python 3.11.3 module:

    .. code-block:: bash

        module spider Python/3.11.3

    Do what the documentation indicates:

    .. code-block:: bash

        module load GCCcore/12.3.0 Python/3.11.3

    If you get an error, because you've already loaded
    (conflicting) modules, do the command below and try again:

    .. code-block:: bash

        module purge

.. admonition:: Answer UPPMAX
    :class: dropdown

    .. code-block:: bash

        module load python/3.11.8

    If you get an error, because you've already loaded
    (conflicting) modules, do the command below and try again:

    .. code-block:: bash

        module purge
        module load uppmax

How to determine if a Python package is installed?

.. admonition:: Answer
    :class: dropdown

    There are multiple ways. One easy one, is, in a terminal, type:

    .. code-block::

        pip list

The Python package ``wheel`` is known to be installed. Which version?

.. admonition:: Answer HPC2N
    :class: dropdown

    When doing ``pip list``, look for ``wheel`` in the list.
    You'll find ``wheel`` to have version ``0.40.0``

.. admonition:: Answer LUNARC
    :class: dropdown

    When doing ``pip list``, look for ``wheel`` in the list.
    You'll find ``wheel`` to have version ``0.40.0``

.. admonition:: Answer UPPMAX
    :class: dropdown

    When doing ``pip list``, look for ``wheel`` in the list.
    You'll find ``wheel`` to have version ``0.42.0``

Exercise 2: loading a Python package that comes with a module
-------------------------------------------------------------

.. admonition:: Learning objectives

    - Practice reading documentation
    - Load a Python package module

Some Python packages need another module to be loaded.
In this exercise, we search for and use a module to use a pre-installed
Python package.
The Python package we use differs by center:

- HPC2N: Theano, as a Python 3.7.4 package
- LUNARC: ``matplotlib`` version 3.8.2
- UPPMAX: TensorFlow, as a Python 3.11.8 package for CPU

Try to find your center's documentation to find out which module to load your Python
package with.

.. admonition:: Answer HPC2N
    :class: dropdown

    It is hard to find useful information on Theano
    at the HPC2N documentation at https://docs.hpc2n.umu.se/.

    Instead, search the main HPC2N website at
    https://www.hpc2n.umu.se/.

    Searching for 'Theano' at the main HPC2N website (not the documentation!)
    at https://www.hpc2n.umu.se/ will take you to
    `the Theano page <https://www.hpc2n.umu.se/resources/software/theano>`_

.. admonition:: Answer LUNARC
    :class: dropdown

    There is no documentation on this (yet).
    Instead, use the
    `LUNARC documentation on modules <https://lunarc-documentation.readthedocs.io/en/latest/manual/manual_modules/#hierarchical-naming-scheme-concept>`_
    to find the module yourself

.. admonition:: Answer UPPMAX
    :class: dropdown

    Searching for ``TensorFlow`` at 
    `the UPPMAX documentation <https://docs.uppmax.uu.se>`_
    takes you to
    `the TensorFlow page <https://docs.uppmax.uu.se/software/tensorflow>`_.
    There, clicking on 'TensorFlow as a Python package for CPU' takes you to
    the header `TensorFlow as a Python package for CPU <https://docs.uppmax.uu.se/software/tensorflow/#tensorflow-as-a-python-package-for-cpu>`_.

Load the module for the Python package and verify if it is loaded.

.. admonition:: Answer HPC2N
    :class: dropdown

    At `the HPC2N Theano page <https://www.hpc2n.umu.se/resources/software/theano>`_,
    it is recommended to do:

    .. code-block:: bash

        module spider theano

    There are two versions of Theano, we need the second one:

    - ``Theano/1.1.2-PyMC``
    - ``Theano/1.0.4-Python-3.7.4``

    Getting the information of it:

    .. code-block:: bash

        module spider Theano/1.0.4-Python-3.7.4

    This tells us to do:

    .. code-block:: bash

        module load GCC/8.3.0 OpenMPI/3.1.4 Theano/1.0.4-Python-3.7.4

    If you get an error, because you've already loaded
    (conflicting) modules, do the command below and load
    the modules above again:

    .. code-block:: bash

        module purge

    With all modules loaded, finding out the package version:

    .. code-block:: bash

        pip list

    Gives us:

    .. code-block:: bash

        Theano                        1.0.4

.. admonition:: Answer LUNARC
    :class: dropdown

    There is no documentation on this (yet).
    Instead, use the
    `LUNARC documentation on modules <https://lunarc-documentation.readthedocs.io/en/latest/manual/manual_modules/#hierarchical-naming-scheme-concept>`_
    to find the module yourself.
    
    To search for it:

    .. code-block:: bash

        module spider matplotlib

    We indeed find the version needed, ``matplotlib/3.8.2``

    Getting the information of it:

    .. code-block:: bash

        module spider matplotlib/3.8.2

    This tells us to do:

    .. code-block:: bash

        module load GCC/13.2.0 matplotlib/3.8.2

    If you get an error, because you've already loaded
    (conflicting) modules, do the command below and load
    the modules above again:

    .. code-block:: bash

        module purge

    With all modules loaded, finding out the package version:

    .. code-block:: bash

        pip list

    Gives us:

    .. code-block:: bash

        matplotlib                        3.8.2


.. admonition:: Answer UPPMAX
    :class: dropdown

    - Copy from the documentation: ``module load python_ML_packages/3.11.8-cpu``
    - ``pip list`` to find ``tensorflow-cpu`` with version ``2.16.1``

Exercise 3
----------

.. admonition:: Learning objectives

    - Practice reading documentation
    - Install a new package.

Some Python packages are not pre-installed on your HPC cluster.
Here we install a Python package ourselves.

Use your center's documentation to find out how to install Python packages
using ``pip``.

.. admonition:: Answer HPC2N
    :class: dropdown

    Searching for 'pip install' at `the HPC2N documentation <https://docs.hpc2n.umu.se/>`
    takes one to `Working with venv <https://docs.hpc2n.umu.se/tutorials/userinstalls/#working__with__venv>`_
    (whatever that is). Searching for ``pip install`` takes use to
    the HPC2N recommendation there to use ``pip install --no-cache-dir --no-build-isolation MYPACKAGE``

.. admonition:: Answer LUNARC
    :class: dropdown

    Searching for 'pip' at `the LUNARC documentation <https://lunarc-documentation.readthedocs.io/>`
    takes one to `Python installations <https://lunarc-documentation.readthedocs.io/en/latest/guides/applications/Python/#python-installations>`_
    The LUNARC recommendation there is to use ``pip install --prefix=$HOME/local package_name``

.. admonition:: Answer UPPMAX
    :class: dropdown

    UPPMAX: searching for ``pip install`` at 
    `the UPPMAX documentation <https://docs.uppmax.uu.se>`_
    takes you to
    `Installing Python packages <https://docs.uppmax.uu.se/software/python_install_packages/>`_.
    There, clicking on the link 'pip' takes you to
    `pip <https://docs.uppmax.uu.se/software/python_install_packages/#pip>`_.
    The UPPMAX recommendation there to use ``pip install --user [package name]``

Install a Python package called ``mhcnuggets``. Which version gets installed?

.. admonition:: Answer HPC2N
    :class: dropdown

    Do ``pip install --no-cache-dir --no-build-isolation mhcnuggets``,
    then ``pip list`` to see that ``mhcnuggets`` version 2.4.1

.. admonition:: Answer LUNARC
    :class: dropdown

    The documentation at LUNARC, to use
    ``pip install --prefix=$HOME/mhcnuggets`` is incomplete.
    The complete command should be ``pip install --prefix=$HOME/mhcnuggets mhcnuggets``.
    However, as mentioned in the documentation 'Make sure the installation
    location of your packages gets added to your PYTHONPATH environment variable',
    without any details.
    Trying ``export PYTHONPATH="${PYTHONPATH}:/${HOME}/mhcnuggets"`` fails.

    What does work:

    ``pip install mhcnuggets``

    Using ``pip list`` shows that ``mhcnuggets`` version 2.4.1
    gets installed.

.. admonition:: Answer UPPMAX
    :class: dropdown

    Do ``pip install mhcnuggets``, then ``pip list`` to see that ``mhcnuggets`` version 2.4.1
    gets installed
                
Conclusion
----------

.. keypoints::

    You have:

    - determined if a Python package is installed yes/no using ``pip``
    - discovered some Python package are already installed upon
      loading a module
    - installed a Python package using ``pip``

    However, the installed package was put into a shared (as in, not isolated)
    environment.

    Luckily, isolated environments are discussed in this course too :-)
