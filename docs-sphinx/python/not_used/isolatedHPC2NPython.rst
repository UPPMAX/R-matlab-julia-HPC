Isolated environments at HPC2N
==============================

.. note::
   Isolated environments solve a couple of problems:

   - You can install specific, also older, versions into them.
   - You can create one for each project and no problem if the two projects require different versions.
   - You can remove the environment and create a new one, if not needed or with errors.

.. questions::

   - How to work with isolated environments at HPC2N?

.. objectives::

   - Give a introduction to isolated environments at HPC2N

.. warning::

   Installing with a virtual environment is the only recommended way at HPC2N!

Virtual environment - virtualenv
---------------------------------------------

Create a ``vpyenv``. First load the python version you want to base your virtual environment on:

.. code-block:: sh

    $ module load python/<version>
    $ virtualenv --system-site-packages vpyenv

"vpyenv" is the name of the virtual environment. You can name it whatever you want. The directory “vpyenv” is created in the present working directory.

.. note::

   ``--system-site-packages`` includes the packages already installed in the loaded python and python packages modules.


**NOTE**: since it may take up a bit of space if you are installing many Python packages to your virtual environment, we **strongly** recommend you place it in your project storage!

**NOTE**: if you need are for instance working with both Python 2 and 3, then you can of course create more than one virtual environment, just name them so you can easily remember which one has what.

To place it in a directory below your project storage (again calling it "vpyenv"):

.. code-block:: sh

   $ virtualenv --system-site-packages /proj/nobackup/<your-project-storage>/vpyenv

**NOTE** To save space, you should load any other Python modules you will need that are system installed before installing your own packages! Remember to choose ones that are compatible with the Python version you picked!

**Example**

I load Python 3.9.5 and create a virtual environment called "vpyenv" in my personal project storage directory (/proj/nobackup/support-hpc2n/bbrydsoe):

.. admonition:: Load Python 3.9.5 and its prerequisites, then create the virtual environment
    :class: dropdown

        .. code-block:: sh

           b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ module load GCCcore/10.3.0 Python/3.9.5
           b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ virtualenv --system-site-packages vpyenv
             created virtual environment CPython3.9.5.final.0-64 in 6490ms
             creator CPython3Posix(dest=/pfs/proj/nobackup/fs/projnb10/support-hpc2n/bbrydsoe/vpyenv, clear=False, no_vcs_ignore=False, global=True)
             seeder FromAppData(download=False, pip=bundle, setuptools=bundle, wheel=bundle, via=copy, app_data_dir=/pfs/stor10/users/home/b/bbrydsoe/.local/share/virtualenv)
               added seed packages: pip==22.1.2, setuptools==62.6.0, wheel==0.37.1
             activators BashActivator,CShellActivator,FishActivator,PowerShellActivator,PythonActivator,XonshActivator
           b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$


Activate the environment.

.. code-block:: sh

    $ source <path/to/virt-environment>/vpyenv/bin/activate

Note that your prompt is changing to start with (vpyenv) to show that you are within an environment.

Using pip
'''''''''

Install your packages with ``pip``. While not always needed, it is often a good idea to give the correct versions you want, to ensure compatibility with other packages you use:

.. code-block:: sh

    (vpyenv) $ pip install --no-cache-dir --no-build-isolation <package>==<version>

The "--no-cache-dir" option is required to avoid it from reusing earlier installations from the same user in a different environment. The "--no-build-isolation" is to make sure that it uses the loaded modules from the module system when building any Cython libraries.

**Examples**

1) Installing spacy. Using existing modules for numpy (in SciPy-bundle) and the vpyenv we created under Python 3.9.5. Note that you need to load Python again if you have been logged out, etc. but the virtual environment remains, of course

.. admonition:: Load modules for Python, numpy (in SciPy-bundle), activate the environment, and install spacy on Kebnekaise at HPC2N
    :class: dropdown

        .. code-block:: sh

           b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ module load GCC/10.3.0 OpenMPI/4.1.1 Python/3.9.5 SciPy-bundle/2021.05
           b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ source vpyenv/bin/activate
           (vpyenv) b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ pip install --no-cache-dir --no-build-isolation spacy

2) Installing seaborn. Using existing modules for numpy (in SciPy-bundle), matplotlib, and the vpyenv we created under Python 3.9.5. Note that you need to load Python again if you have been logged out, etc. but the virtual environment remains, of course

.. admonition:: Load modules for Python, numpy (in SciPy-bundle), matplotlib, activate the environment, and install seaborn on Kebnekaise at HPC2N
    :class: dropdown

        .. code-block:: sh

           b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ module load GCC/10.3.0 OpenMPI/4.1.1 Python/3.9.5 SciPy-bundle/2021.05 matplotlib/3.4.2
           b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ source vpyenv/bin/activate
           (vpyenv) b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ pip install --no-cache-dir --no-build-isolation seaborn

Deactivating a virtual environment.

.. code-block:: sh

   (vpyenv) $ deactivate

Every time you need the tools available in the virtual environment you activate it as above (after first loading the modules for Python, Python packages, and prerequisites)

.. code-block:: sh

    $ source <path/to/virt-environment>/vpyenv/bin/activate

Using setup.py
''''''''''''''

Some Python packages are only available as downloads, to install with setup.py. If that is the case for the package you need, this is how you do it:

- Pick a location for your installation (change below to fit - I am installing under a project storage)

   - mkdir /proj/nobackup/mystorage/mypythonpackages
   - cd /proj/nobackup/mystorage/mypythonpackages

- Load Python + site-installed prerequisites (SciPy-bundle, matplotlib, etc.
- Install any remaining prerequisites. Remember to activate your Virtualenv if installing with pip!
- Download Python package, place it in your chosen installation dir, then untar/unzip it
- cd into the source directory of the Python package

   - Run ``python setup.py build``
   - Then install with: ``python setup.py install --prefix=<path to install dir>``

- Add the path to $HOME/.bash_profile (note that it will differ by Python version):

   - ``export PYTHONPATH=$PYTHONPATH:<path to your install directory>/lib/python3.9/site-packages``

You can use it as normal inside Python (remember to load dependent modules as well as activate virtual environment if it depends on some packages you installed with pip): ``import <python-module>``


Using the self-installed packages in Python
'''''''''''''''''''''''''''''''''''''''''''

To use the Python packages you have installed under your virtual environment, load your Python module + prerequisites, load any site-installed Python packages you used, and then activate the environment. Now your own packages can be accessed from within Python, just like any other Python package.

**Example**

Using the vpyenv created earlier and the spacy we installed under example 1) above.

.. admonition:: Load modules for Python, numpy (in SciPy-bundle), activate the environment (on Kebnekaise at HPC2N)
    :class: dropdown

        .. code-block:: sh

           b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ module load GCC/10.3.0 OpenMPI/4.1.1 Python/3.9.5 SciPy-bundle/2021.05
           b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ source vpyenv/bin/activate
           (vpyenv) b-an01 [/proj/nobackup/support-hpc2n/bbrydsoe]$ python
           Python 3.9.5 (default, Jun  3 2021, 02:53:39)
           [GCC 10.3.0] on linux
           Type "help", "copyright", "credits" or "license" for more information.
           >>> import spacy
           >>>


To use self-installed Python packages in a batch script, you also need to load the above mentioned modules and activate the environment. An example of this will follow later in the course.

To see which Python packages you, yourself, has installed, you can use ``pip list --user`` while the environment you have installed the packages in are active.

More info
'''''''''

HPC2N's documentation pages about installing Python packages and virtual environments: https://www.hpc2n.umu.se/resources/software/user_installed/python


.. keypoints::

   - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
   - Make it for each project you have for reproducibility.
   - There are different tools to create virtual environments.
      - HPC2N has virtualenv
