# Summary

You can find the module to be able to run R:

```bash
module spider R
```

You can load the module to be able to run R:

```bash
module load GCC/11.2.0 OpenMPI/4.1.1 R/4.1.2
module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1
module load R/4.1.1
```

You can run the R interpreter

```bash
R
```

You can run the R command to get the list of installed R packages

```r
installed.packages()
```

You can run an R script from the command-line

```bash
Rscript my_script.R
```

You can find out if an R package is already installed

```r
installed.packages()
library(my_package)
```

You can load the pre-installed R packages

```bash
module load R_packages/4.1.1
```

You can install an R package from CRAN

```r
install.packages("my_package", repos = "my_repo")
```

You can install an R package from GitHub

```r
devtools::install_github("developer_name/package_name")
```

You can manually download and install an R package

```r
echo R_LIBS_USER="$HOME/R-packages-%V" > ~/.Renviron
```

- UPPMAX-only: I can manually download and install an R package on Bianca

```bash
rsync -Pa R ~/
```

You can use `renv` to create, activate, use and deactivate a virtual environment

```r
renv::init()
renv::snapshot()
renv::restore()
```

- UPPMAX-only: I can use `conda` to create, activate, use and deactivate a virtual environment

```bash
conda env create -f r_env.yaml
source activate r_env
deactivate
```

You can submit a job to the scheduler to run an R script with regular code

```bash
sbatch my_batch_script.sh
```

```bash
#!/bin/bash
#SBATCH -A my_account
#SBATCH -t 00:10:00
module load R
Rscript my_script.R
```

You can submit a job to the scheduler to run an R script that uses parallel code

```bash
#!/bin/bash
#SBATCH -A my_account
#SBATCH -t 00:10:00
#SBATCH -N 1
#SBATCH -c 4
R -q --slave -f my_parallel_script.R
```

You can submit a job to the scheduler to run an R script that uses a GPU

```bash
#SBATCH --gres=gpu:x
#SBATCH -C v100
#SBATCH -p gpua100
#SBATCH --gres=gpu:1
```

You can find and load the R machine learning modules

```bash
module load R/4.1.1 R_packages/4.1.1
module load GCC/11.2.0 OpenMPI/4.1.1 R/4.1.2 R-bundle-Bioconductor/3.14-R-4.1.2
module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1 R-bundle-Bioconductor/3.15-R-4.2.1
module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1 CUDA/12.1.1
```

You can submit a job to the scheduler to run an R script that uses machine learning

```bash
sbatch my_ml_script.sh
```

You can start an interactive session


```bash
interactive -A my_project_code
salloc -A my_project_code
```

You can verify I am on the login node yes/no

```bash
srun hostname
```

You can start an interactive session with multiple cores

```bash
interactive -n 4 -A my_project_code
salloc -n 4 -A my_project_code
```

You can verify my interactive session uses multiple cores

```bash
srun hostname
```

You can start RStudio

```bash
module load R/4.1.1 RStudio/2023.12.1-402
rstudio
```
