Summary
=======

You can find the module to be able to run R:

.. code-block:: console

    module spider R

You can load the module to be able to run R:

.. code-block:: console

    module load GCC/11.2.0 OpenMPI/4.1.1 R/4.1.2
    module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1
    module load R/4.1.1

You can run the R interpreter

.. code-block:: console

    R

You can run the R command to get the list of installed R packages

.. code-block:: console

    installed.packages()

You can run an R script from the command-line

.. code-block:: console

    Rscript my_script.R

You can find out if an R package is already installed

.. code-block:: console

    installed.packages()
    library(my_package)

You can load the pre-installed R packages

.. code-block:: console

    module load R_packages/4.1.1

You can install an R package from CRAN


.. code-block:: console

    install.packages("my_package", repos = "my_repo")

You can install an R package from GitHub

.. code-block:: console

    devtools::install_github("developer_name/package_name")

You can manually download and install an R package

.. code-block:: console

    echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron

- UPPMAX-only: I can manually download and install an R package on Bianca

.. code-block:: console

    rsync -Pa R ~/

You can use `renv` to create, activate, use and deactivate a virtual environment

.. code-block:: console

    renv::init()
    renv::snapshot()
    renv::restore()

- UPPMAX-only: I can use `conda` to create, activate, use and deactivate a virtual environment

.. code-block:: console

    conda env create -f r_env.yaml
    source activate r_env
    deactivate

You can submit a job to the scheduler to run an R script with regular code

.. code-block:: console

      sbatch my_batch_script.sh

.. code-block:: console

    #!/bin/bash
    #SBATCH -A my_account
    #SBATCH -t 00:10:00
    module load R
    Rscript my_script.R

You can submit a job to the scheduler to run an R script that uses parallel code

.. code-block:: console

    #!/bin/bash
    #SBATCH -A my_account
    #SBATCH -t 00:10:00
    #SBATCH -N 1
    #SBATCH -c 4
    R -q --slave -f my_parallel_script.R

You can submit a job to the scheduler to run an R script that uses a GPU

.. code-block:: console

    #SBATCH --gres=gpu:x
    #SBATCH -C v100
    #SBATCH -p gpua100
    #SBATCH --gres=gpu:1

You can find and load the R machine learning modules

.. code-block:: console

    module load R/4.1.1 R_packages/4.1.1
    module load GCC/11.2.0 OpenMPI/4.1.1 R/4.1.2 R-bundle-Bioconductor/3.14-R-4.1.2 
    module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1 R-bundle-Bioconductor/3.15-R-4.2.1 
    module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1 CUDA/12.1.1

You can submit a job to the scheduler to run an R script that uses machine learning

.. code-block:: console

    sbatch my_ml_script.sh

You can start an interactive session

.. code-block:: console

    interactive -A my_project_code
    salloc -A my_project_code

You can verify I am on the login node yes/no

.. code-block:: console

    srun hostname

You can start an interactive session with multiple cores

.. code-block:: console

    interactive -n 4 -A my_project_code
    salloc -n 4 -A my_project_code

You can verify my interactive session uses multiple cores 

.. code-block:: console

    srun hostname

You can start RStudio

.. code-block:: console

    module load R/4.1.1 RStudio/2023.12.1-402
    rstudio
