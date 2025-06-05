Isolated environments at UPPMAX
===============================

.. note::
   Isolated environments solve a couple of problems:

   - You can install specific, also older, versions into them.
   - You can create one for each project and no problem if the two projects require different versions.
   - You can remove the environment and create a new one, if not needed or with errors.

``conda`` works as an isolated environment. Below we present the ``pip`` way with "virtual environments", as well as installing using setup.py! Installing with a virtual environment is the only recommended way at HPC2N!

.. questions::

   - How to work with isolated environments at UPPMAX?

.. objectives::

   - Give a introduction to isolated environments at UPPMAX

Virtual environment - venv
--------------------------

Example
#######

Create a ``venv``. First load the python version you want to base your virtual environment on:

.. code-block:: sh

    $ module load python/3.6.8
    $ python -m venv --system-site-packages Example

"Example" is the name of the virtual environment. The directory “Example” is created in the present working directory. The ``-m`` flag makes sure that you use the libraries from the python version you are using.

.. note::

   ``--system-site-packages`` includes the packages already installed in the loaded python module.

If you want it in a certain place like "~/test/":

.. code-block:: sh

    $ python -m venv ~/test/Example

Activate it.

.. code-block:: sh

    $ source <path/>Example/bin/activate

Note that your prompt is changing to start with (Example) to show that you are within an environment.

Install your packages with ``pip`` and the correct versions, like:

.. prompt::
    :language: bash
    :prompts: (Example) $

    pip install numpy==1.15.4 matplotlib==2.2.2

Deactivate it.

.. prompt::
    :language: bash
    :prompts: (Example) $

    deactivate

Every time you need the tools available in the virtual environment you activate it as above.

.. prompt:: bash $

   source <path/>Example/bin/activate



Prepare the course environment
------------------------------

Create a ``venv``. First load the python version you want to base your virtual environment on:

.. code-block:: sh

    $ module load python/3.9.5
    $ python -m venv --system-site-packages /proj/snic2022-22-641/nobackup/<user>/venv-python-course

Activate it.

.. code-block:: sh

    $ source /proj/snic2022-22-641/nobackup/<user>/venv-python-course/bin/activate

Note that your prompt is changing to start with (venv-python-course) to show that you are within an environment.

Install your packages with ``pip`` (`--user` not needed)and the correct versions, like:

.. prompt::
    :language: bash
    :prompts: (venv-python-course) $

    pip install spacy seaborn

Check what was installed

.. prompt::
    :language: bash
    :prompts: (venv-python-course) $

    pip list

Deactivate it.

.. prompt::
    :language: bash
    :prompts: (venv-python-course) $

    deactivate

Every time you need the tools available in the virtual environment you activate it as above.

.. prompt:: bash $

    source /proj/snic2022-22-641/nobackup/<user>/venv-python-course/bin/activate

More on virtual environment: https://docs.python.org/3/tutorial/venv.html

Using setup.py
''''''''''''''

Some Python packages are only available as downloads, for instance via github, to install with setup.py or similar file. If that is the case for the package you need, this is how you do it:

- Pick a location for your installation (change below to fit - I am installing under a project storage)

   - ``mkdir /proj/<project>/<mystorage>/mypythonpackages``
   - ``cd /proj/<project>/<mystorage>/mypythonpackages``

- Load Python
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

Using the venv created earlier and the spacy we installed under example 1) above.

.. admonition:: Load modules for Python, activate the environment
   :class: dropdown

   .. code-block:: sh

      $ module load Python/3.9.5
      $ source /proj/snic2022-22-641/nobackup/<user>/venv-python-course/bin/activate
      (<name of environment>) $ python
           Python 3.9.5 (default, Jun  3 2021, 15:06:34)
           [GCC 9.3.0] on linux
           Type "help", "copyright", "credits" or "license" for more information.

           >>> import spacy
           >>>


To use self-installed Python packages in a batch script, you also need to load the above mentioned modules and activate the environment. An example of this will follow later in the course.

To see which Python packages you, yourself, have installed, you can use ``pip list --user`` while the environment you have installed the packages in are active.

Working with virtual environments defined from files
----------------------------------------------------

- First create and activate and environment (see above)
- Create an environment based on dependencies given in an environment file::

  $ pip install -r requirements.txt

- Create file from present virtual environment::

  $ pip freeze > requirements.txt

``requirements.txt`` (used by virtual environment) is a simple
text file which looks like this::

   numpy
   matplotlib
   pandas
   scipy

``requirements.txt`` with versions::

    numpy==1.18.1
    matplotlib==3.1.3
    pandas==1.1.2
    scipy==1.6.2

.. admonition:: More on dependencies

   - `Dependency management from coursePython for Scientific computing <https://aaltoscicomp.github.io/python-for-scicomp/dependencies/>`_


pyenv
-----

This approach is more advanced and should be, in our opinion, used only if the above are not enough for the purpose.
This approach allows you to install your **own python version**, like 3.10, and much more…

Have a look on this manual https://www.uppmax.uu.se/support/user-guides/python-modules-guide/

.. keypoints::

   - With a virtual environment you can tailor an environment with specific versions for Python and packages, not interfering with other installed python versions and packages.
   - Make it for each project you have for reproducibility.
   - There are different tools to create virtual environments.
      - UPPMAX has Conda and venv
