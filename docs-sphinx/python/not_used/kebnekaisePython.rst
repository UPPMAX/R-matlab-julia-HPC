On Kebnekaise cluster
=====================

.. questions::

   - Can you login to Kebnekaise?
   - Did you try and find Python packages at the system?
   - Can you load Python and start it, as well as run a short program?

.. objectives::

   - Show how to load Python
   - show how to run Python scripts and start the Python commandline


There are a few things that are different when using Python on the Kebnekaise cluster compared to the UPPMAX clusters:

- Anaconda/conda/miniconda are NOT recommended and are not supported. You *can* use it, but we generally ask our users to not install Anaconda on our clusters. We recommand that you consider other options like a virtual environment (or a Singularity container, for the most complicated cases). More information here: https://www.hpc2n.umu.se/documentation/guides/anaconda
- When loading Python or Python packages, there are prerequisites that needs to be loaded first. See which ones with ``module spider <Python>/<version>`` or ``module spider <Python-package>/<version>``
- We have many Python packages site-installed as modules. Some of these are

  - ASE
  - Keras
  - PyTorch
  - SciPy-bundle (Bottleneck, deap, mpi4py, mpmath, numexpr, numpy, pandas, scipy - some of the versions have more)
  - TensorFlow
  - Theano
  - matplotlib
  - scikit-learn
  - scikit-image
  - pip
  - iPython
  - Cython

- We do not currently have Jupyter installed, but there are ways for users to run it. Since it is somewhat involved, please contact us at support@hpc2n.umu.se for more information

Accessing Kebnekaise
--------------------

**Kebnekaise login node**

Login with

.. code-block:: sh

    ssh <hpc2n-username>@kebnekaise.hpc2n.umu.se

using your favourite SSH client. More information about this here: https://www.hpc2n.umu.se/access/login

**Kebnekaise ThinLinc login node**

If you do not have a preferred SSH client installed, then this is the recommended way to login, as it comes with a GUI environment directly and no need to run an X11 server.

Use

.. code-block:: sh

    kebnekaise-tl.hpc2n.umu.se

as the server in the ThinLinc login.

There is a guide for you to follow here: https://www.hpc2n.umu.se/documentation/guides/thinlinc

Loading Python
--------------

We are going to use Python 3.9.5 for this course. At HPC2N, this module has a prerequisite

.. code-block:: sh

    module load GCC/10.3.0  Python/3.9.5


Starting Python and running Python scripts
------------------------------------------

As mentioned in the general section, you start python with either ``python`` or ``python3`` (assuming it is a version 3.x of Python you are using).

.. admonition:: Load Python 3.9.5 and start it. You exit with ``exit()``

    .. code-block:: sh

        b-an01 [~/proj/nobackup/hpc2n-support/bbrydsoe/Python-in-HPC/examples/hpc2n]$ module load GCCcore/10.3.0 Python/3.9.5
        b-an01 [~/proj/nobackup/hpc2n-support/bbrydsoe/Python-in-HPC/examples/hpc2n]$ python
        Python 3.9.5 (default, Jun  3 2021, 02:53:39)
        [GCC 10.3.0] on linux
        Type "help", "copyright", "credits" or "license" for more information.
        >>> exit()


.. admonition:: Try submitting one of the Python programs to the batch system.

   Remember to change the path in it to the location of your own files!

   .. code-block:: sh

       b-an01 [~/proj/nobackup/hpc2n-support/bbrydsoe/Python-in-HPC/examples/hpc2n]$ sbatch run_mmmult.sh
       Submitted batch job 20358127

It will create a file named ``slurm-<jobid>.out``. Look at the contents with ``cat`` or ``vi``.


.. keypoints::

   - You have logged in to Kebnekaise
   - You have loaded Python and tried running a small Python code
