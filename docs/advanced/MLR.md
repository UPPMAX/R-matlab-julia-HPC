# ML with R

!!! note "Questions"

    - Is R suitable for Machine Learning (ML)?
    - Which machine learning tools are installed at HPCs?
    - How to run R ML jobs on an HPC system (NSC, PDC, C3SE, UPPMAX, HPC2N, LUNARC)

!!! note "Objectives"

    - Short introduction to ML with R
    - Overview of installed ML tools at Swedish HPC centres 
    - Workflow
    - Show the structure of a suitable batch script
    - Examples to try
    - **We will not learn about:**
        - How to write and optimize ML/DL code.
        - How to use multi-node setup for training models on CPU and GPU.

R provides many packages that are specifically designed for machine learning. R is also known for its statistical capabilities for analysis and interpretation of data.

This all makes it easier to develop and deploy models, also without having to write a lot of code yourself.

The R community has contributed many powerful packages, both for machine learning and data science. Some of the popular packages are:

| Package | What it does | 
| ------- | ------------ | 
| Dplyr   | Enables dataframe manipulation in an intuitive, user-friendly way. One of the core <br>packages of the popular tidyverse set of packages |  
| Tidyr   | Provides a bunch of tools to help tidy up your messy datasets. tidyr is a member of <br>the core tidyverse | 
| Caret   | A set of functions that attempt to streamline the process for creating predictive <br>models. Short for Classification And REgression Training | 
| MLR     | R has no standardized interface for its ML algorithms. MLR provides this <br>infrastructure. The framework provides supervised methods like classification, regression <br>and survival analysis along with their corresponding evaluation and optimization <br>methods, as well as unsupervised methods like clustering. You can extend it yourself <br>or deviate from the implemented convenience methods and construct your own <br>complex experiments or algorithms | 
| ggplot2 | A system for declaratively creating graphics. Part of tidyverse | 
| randomForest | implements Breiman’s random forest algorithm | 
| mlbench | A collection of artificial and real-world machine learning benchmark problem |
| stringr | Provides a cohesive set of functions designed to make working with strings as easy <br>as possible | 
| tidyverse | A set of packages that work in harmony because they share common data representations <br>and API design. Some of the popular packages in this set is: ggplot2, dplyr, tidyr, stringr, <br>and many more | 

and others.

## Installed ML tools 

There are differences depending on the centre as well as minor differences depending on the version of R.

This table is not exhaustive, but lists the more popular libraries/packages and what the module is called at the various centres. Please do ``module spider`` on them to see how to load them as well as which versions are available. 

| Package | NSC | PDC | C3SE | UPPMAX (Rackham) | UPPMAX (Pelle) | HPC2N | LUNARC | 
| ------- | --- | --- | ---- | ------ | ------ | ----- | ------ | 
| dplyr | N/A | R | R | R_packages | R-bundle-CRAN | R-bundle-CRAN | R-bundle-CRAN | 
| tidyr | N/A | R | R | R_packages | R-bundle-CRAN | R-bundle-CRAN | R-bundle-CRAN |
| caret | N/A | R | R | R_packages | R-bundle-CRAN | R-bundle-CRAN | R-bundle-CRAN |
| mlr   | N/A | R | R | R_packages | R-bundle-CRAN | R-bundle-CRAN | R-bundle-CRAN |
| randomForest | R | R | R | R_packages | R-bundle-CRAN | R-bundle-CRAN | R-bundle-CRAN | 
| stringr | N/A | R | R | R_packages | R | R | R |
| kernlab | N/A | R | R | R_packages | R-bundle-CRAN | R-bundle-CRAN | R-bundle-CRAN | 

Some centes have several packages installed with R, some have module "bundles" of R packages installed at the various centres: 

- NSC (R/4.4.0): ~30 packages installed with R. You will have to install the rest yourself. 
- PDC (R/4.4.2): ~1250 packages installed with R. In addition, there are many Bioconductor packages installed with the Rbio module 
- C3SE: R(R/4.2.1): ~1340 packages installed with R. (The R/4.3.3 only has ~100 packages installed with R).  
- HPC2N (R/4.4.1): ~100 packages installed with R. In addition many installed with R-bundle-CRAN, R-bundle-CRAN-extra, R-bundle-Bioconductor
- UPPMAX - Rackham (R/4.1.1): Almost all packages in CRAN and BioConductor are contained in the R_packages module, as is a small number of other R packages not in CRAN/BioConductor. Total of 23476 R packages are installed.  
- UPPMAX - Pelle (R/4.4.2): ~100 packages installed with R. In addition many installed with R-bundle-CRAN, R-bundle-Bioconductor
- LUNARC (R/4.4.1): ~100 packages installed with R. In addition many installed with R-bundle-CRAN and R-bundle-Bioconductor 

## Running your code

**Workflow**

1. Determine if you need any R libraries that are not already installed (load R module and R_packages/R-bundle-CRAN/R-bundle-Bioconductor and check)
2. Determine if you want to run on CPUs or GPUs - some of the R version modules are not CUDA-aware
3. Install any missing R libraries in an isolated environment
4. Possibly download any datasets
5. Write a batch script
6. Submit the batch script

**Example**

!!! hint "Type-along" 

    We will run a simple example taken from https://machinelearningmastery.com/machine-learning-in-r-step-by-step/

    If you cannot access remote data-sets, change the R code as mentioned inside to use a local data-set, which has already been downloaded

    **NOTE**: normally we would not run this on the command line, but through a batch script, but since these are short examples we will run it on the command line.

    === "NSC"

        You need to install ``caret``, ``kernlab``, and ``randomForest`` before running, as shown below. If it asks, agree to install in local directory.

        ```bash
        $ module load R/4.4.0-hpc1-gcc-11.3.0-bare
        $ R
        > install.packages('caret', repos='http://ftp.acc.umu.se/mirror/CRAN/')
        > install.packages('kernlab', repos='http://ftp.acc.umu.se/mirror/CRAN/')
        > install.packages('randomForest', repos='http://ftp.acc.umu.se/mirror/CRAN/')
        > quit()
        $ Rscript iris_ml.R
        ```

    === "PDC" 

        All the needed packages are part of the R module. 

        ```bash
        $ module load PDC/24.11 R/4.4.2-cpeGNU-24.11
        $ Rscript iris_ml.R
        ```

    === "C3SE" 

        Use version 4.2.1 of R, as that version has ``caret``, ``kernlab``, and ``randomForest`` included (the newest, 4.3.3, does not have these packages).  

        ```bash 
        $ module load R/4.2.1-foss-2022a        
        $ Rscript iris_ml.R 
        ```

    === "UPPMAX"

        **Rackham**: 

        All the needed packages are part of the R_packages module. 

        ```bash 
        $ module load R_packages/4.1.1
        $ Rscript iris_ml.R
        ```

        **Pelle**: 

        The needed packages are in R, R-bundle-CRAN modules, and R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2. 

        ```bash
        $ module load R/4.4.2-gfbf-2024a R-bundle-CRAN/2024.11-foss-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2
        $ Rscript iris_ml.R 
        ``` 

    === "HPC2N" 

        All the needed packages are part of the R-bundle-CRAN module. 
        
        ```bash 
        $ module load GCC/13.2.0 OpenMPI/4.1.6 R/4.4.1 R-bundle-CRAN/2024.06 
        $ Rscript iris_ml.R
        ``` 

    === "LUNARC" 

        All the needed packages are part of the R-bundle-CRAN module. 

        ```bash
        $ module load GCC/12.3.0  OpenMPI/4.1.5 R/4.4.1 R-bundle-CRAN/2023.12-R-4.4.1 
        $ Rscript iris_ml.R
        ```

    === "iris_ml.R" 

        Simple example taken from https://machinelearningmastery.com/machine-learning-in-r-step-by-step/

        ```bash
        library(caret)

        # COMMENT OUT THIS SECTION IF YOU CANNOT ACCESS REMOTE DATA-SETS
        # --------------------------------------------------------------
        # attach the iris dataset to the environment
        data(iris)
        # rename the dataset
        dataset <- iris
        # ---------------------------------------------------------------

        # REMOVE THE COMMENTS ON THIS SECTION (except comments...) TO USE LOCAL DATA-SETS
        # -------------------------------------------------------------------------------
        # define the filename
        #filename <- "iris.csv"
        # load the CSV file from the local directory
        #dataset <- read.csv(filename, header=FALSE)
        # -------------------------------------------------------------------------------

        # set the column names in the dataset
        colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

        # create a list of 80% of the rows in the original dataset we can use for training
        validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)
        # select 20% of the data for validation
        validation <- dataset[-validation_index,]
        # use the remaining 80% of data to training and testing the models
        dataset <- dataset[validation_index,]

        # Run algorithms using 10-fold cross validation
        control <- trainControl(method="cv", number=10)
        metric <- "Accuracy"

        # a) linear algorithms
        set.seed(7)
        fit.lda <- train(Species~., data=dataset, method="lda", metric=metric, trControl=control)
        # b) nonlinear algorithms
        # CART
        set.seed(7)
        fit.cart <- train(Species~., data=dataset, method="rpart", metric=metric, trControl=control)
        # kNN
        set.seed(7)
        fit.knn <- train(Species~., data=dataset, method="knn", metric=metric, trControl=control)
        # c) advanced algorithms
        # SVM
        set.seed(7)
        fit.svm <- train(Species~., data=dataset, method="svmRadial", metric=metric, trControl=control)
        # Random Forest
        set.seed(7)
        fit.rf <- train(Species~., data=dataset, method="rf", metric=metric, trControl=control)

        # summarize accuracy of models
        results <- resamples(list(lda=fit.lda, cart=fit.cart, knn=fit.knn, svm=fit.svm, rf=fit.rf))
        summary(results)

        # summarize Best Model
        print(fit.lda)

        # estimate skill of LDA on the validation dataset
        predictions <- predict(fit.lda, validation)
        confusionMatrix(predictions, validation$Species)
        ```

## R batch scripts for ML

Since most R codes for Machine Learning would run for a fairly long time, you would usually have to run them in a batch script.

### Serial jobs

!!! hint "Type-along" 

    Short serial batch example for running the R code above, ``iris_ml.R``

    === "NSC" 

        Short serial example for running on Tetralith. Loading R/4.4.0-hpc1-gcc-11.3.0-bare

        NOTE: if you did not install the packages ``caret``, ``kernlab``, and ``randomForest`` above, you have to do so now before running the script.

        ```bash
        #!/bin/bash
        #SBATCH -A naiss2025-22-934 # Change to your own project ID
        #SBATCH --time=00:10:00 # Asking for 10 minutes
        #SBATCH -n 1 # Asking for 1 core

        # Load any modules you need, here R/4.4.0-hpc1-gcc-11.3.0-bare
        module load R/4.4.0-hpc1-gcc-11.3.0-bare

        # Run your R script (here 'iris_ml.R')
        R --no-save --quiet < iris_ml.R
        ```

    === "PDC" 

        Short serial example for running on Dardel. Loading PDC/24.11 R/4.4.2-cpeGNU-24.11 

        ```bash
        #!/bin/bash
        #SBATCH -A naiss2025-22-934 # Change to your own project ID
        #SBATCH --time=00:10:00 # Asking for 10 minutes
        #SBATCH -n 1 # Asking for 1 core

        # Load any modules you need, here R/4.4.2-cpeGNU-24.11 and prerequisites
        module load PDC/24.11 R/4.4.2-cpeGNU-24.11

        # Run your R script (here 'iris_ml.R')
        R --no-save --quiet < iris_ml.R
        ```

    === "C3SE"

        Alvis is only for running GPU jobs 

    === "UPPMAX" 

        Short serial example script for Pelle. Loading R/4.4.2-gfbf-2024a R-bundle-CRAN/2024.11-foss-2024a R-bundle-Bioconductor 

        ```bash
        #!/bin/bash
        #SBATCH -A uppmax2025-2-360 # Course project id. Change to your own project ID after the course
        #SBATCH --time=00:10:00 # Asking for 10 minutes
        #SBATCH -n 1 # Asking for 1 core
        # Load any modules you need, here R/4.4.2-gfbf-2024a and R-bundle-CRAN/2024.11-foss-2024a and R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2
        module load R/4.4.2-gfbf-2024a R-bundle-CRAN/2024.11-foss-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2 

        # Run your R script (here 'iris_ml.R')
        R --no-save --quiet < iris_ml.R
        ```

    === "HPC2N" 

        Short serial example for running on Kebnekaise. Loading R/4.4.1 and prerequisites, also R-bundle-Bioconductor/3.19-R-4.4.1 and R-bundle-CRAN/2024.06 

        ```bash
        #!/bin/bash
        #SBATCH -A hpc2n2025-151 # Change to your own project ID
        #SBATCH --time=00:10:00 # Asking for 10 minutes
        #SBATCH -n 1 # Asking for 1 core

        # Load any modules you need, here R/4.4.1 and prerequisites + R-bundle-CRAN/2024.06 and R-bundle-Bioconductor/3.19-R-4.4.1 
        module load GCC/13.2.0 R/4.4.1 
        module load OpenMPI/4.1.6 R-bundle-CRAN/2024.06 R-bundle-Bioconductor/3.19-R-4.4.1

        # Run your R script (here 'iris_ml.R')
        R --no-save --quiet < iris_ml.R
        ```

    === "LUNARC" 

        Short serial example for running on Cosmos. Loading R/4.2.1 and prerequisites, also a suitable R-bundle-Bioconductor

        ```bash
        #!/bin/bash
        #SBATCH -A lu2025-2-94 # Change to your own project ID
        #SBATCH --time=00:10:00 # Asking for 10 minutes
        #SBATCH -n 1 # Asking for 1 core

        # Load any modules you need, here R/4.2.1 and prerequisites + R-bundle-Bioconductor
        module load GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1 R-bundle-Bioconductor/3.15-R-4.2.1

        # Run your R script (here 'iris_ml.R')
        R --no-save --quiet < iris_ml.R
        ```

    Send the script to the batch:

    ```bash
    $ sbatch <batch script>
    ```

    **NOTE** you could also run the R code inside the batch script with "Rscript program.R". 

### Parallel jobs


!!! hint "Type-along" 

    === "UPPMAX" 

        Short ML example for running on Pelle.

        ```bash
        #!/bin/bash
        #SBATCH -A uppmax2025-2-360
        #Asking for 10 min.
        #SBATCH -t 00:10:00
        #SBATCH --exclusive
        #SBATCH -n 1
        #SBATCH --cpus-per-task=8
        #Writing output and error files
        #SBATCH --output=output%J.out
        #SBATCH --error=error%J.error

        ml R/4.4.2-gfbf-2024a R-bundle-CRAN/2024.11-foss-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2

        srun Rscript MyRscript.R
        ```

    === "HPC2N" 

        Short ML example for running on Kebnekaise.

        ```bash 
         #!/bin/bash
         #SBATCH -A hpc2n2025-151 # Change to your own project ID
         #Asking for 10 min.
         #SBATCH -t 00:10:00
         #SBATCH -n 1
         #SBATCH --cpus-per-task=8
         #Writing output and error files
         #SBATCH --output=output%J.out
         #SBATCH --error=error%J.error

         ml purge > /dev/null 2>&1
         module load GCC/13.2.0 R/4.4.1
         module load OpenMPI/4.1.6 R-bundle-CRAN/2024.06
         module load R-bundle-Bioconductor/3.19-R-4.4.1

         srun Rscript MyRscript.R
         ```

    === "LUNARC"

        Short ML example for running on Cosmos.

        ```bash
        #!/bin/bash
        #SBATCH -A lu2025-2-94 # Change to your own project ID
        #Asking for 10 min.
        #SBATCH -t 00:10:00
        #SBATCH -n 1
        #SBATCH --cpus-per-task=8
        #Writing output and error files
        #SBATCH --output=output%J.out
        #SBATCH --error=error%J.error

        ml purge > /dev/null 2>&1
        module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1

        srun Rscript MyRscript.R
        ```

    === "NSC" 

        Short ML example for running on Tetralith.

        ```bash
        #!/bin/bash
        #SBATCH -A naiss2025-23-934 # Change to your own project ID
        #Asking for 10 min.
        #SBATCH -t 00:10:00
        #SBATCH -n 1
        #SBATCH --cpus-per-task=8 
        #Writing output and error files
        #SBATCH --output=output%J.out
        #SBATCH --error=error%J.error

        ml purge > /dev/null 2>&1
        module load R/4.4.0-hpc1-gcc-11.3.0-bare

        srun Rscript MyRscript.R
        ```

    === "PDC" 

        Short ML example for running on Dardel.

        ```bash
        #!/bin/bash
        #SBATCH -A naiss2025-22-934 # Change to your own project ID
        #Asking for 10 min.
        #SBATCH -t 00:10:00
        #SBATCH -N 1
        #SBATCH --ntasks-per-node=8
        #SBATCH -p main
        #Writing output and error files
        #SBATCH --output=output%J.out
        #SBATCH --error=error%J.error

        ml purge > /dev/null 2>&1
        module load PDC/24.11 R/4.4.2-cpeGNU-24.11

        srun Rscript MyRscript.R
        ```

    === "C3SE" 

        Alvis is only for running GPU jobs 

    === "MyRscript.R"

        Short ML example.

        ```bash
        #Example taken from https://github.com/lgreski/datasciencectacontent/blob/master/markdown/pml-randomForestPerformance.md
        library(mlbench)
        data(Sonar)
        library(caret)
        set.seed(95014)

        # create training & testing data sets
        inTraining <- createDataPartition(Sonar$Class, p = .75, list=FALSE)
        training <- Sonar[inTraining,]
        testing <- Sonar[-inTraining,]

        # set up training run for x / y syntax because model format performs poorly
        x <- training[,-61]
        y <- training[,61]

        #Serial mode
        fitControl <- trainControl(method = "cv",
                                   number = 25,
                                   allowParallel = FALSE)

        stime <- system.time(fit <- train(x,y, method="rf",data=Sonar,trControl = fitControl))


        #Parallel mode
        library(parallel)
        library(doParallel)
        cluster <- makeCluster(1)
        registerDoParallel(cluster)

        fitControl <- trainControl(method = "cv",
                                   number = 25,
                                   allowParallel = TRUE)

        ptime <- system.time(fit <- train(x,y, method="rf",data=Sonar,trControl = fitControl))

        stopCluster(cluster)
        registerDoSEQ()

        fit
        fit$resample
        confusionMatrix.train(fit)

        #Timings
        timing <- rbind(sequential = stime, parallel = ptime)
        timing
        ```

    ```bash
    $ sbatch <batch script>
    ```

### GPU jobs

Some packages are now able to use GPUs for ML jobs in R. One of them is `xgboost <https://xgboost.readthedocs.io/en/latest/install.html>`_.
In the following demo you will find instructions to install this package and run a test case with GPUs.

!!! hint "Demo"

    ??? note "Prerequisites"

        Choose an R version > 4.1 and a CUDA module. 

        === "NSC"

            There is no compatible CUDA and R, so the best option seems to be to be to install your own R with conda. It will take quite some space, so do it in your project storage: 

            ```bash 
            $ ml buildenv-gcccuda/11.6.2-gcc9-hpc1 
            $ ml buildtool-easybuild/4.9.4-hpc71cbb0050 
            $ ml Miniforge/24.7.1-2-hpc1 
            $ cd /proj/courses-fall-2025/users/<username> 
            $ conda create -n myenv 
            $ conda activate myenv
            $ mamba create -n R -c conda-forge r-base -y
            $ mamba activate R
            $ mamba install -c conda-forge r-essentials
            $ R --quiet --no-save --no-restore -e "install.packages('tictoc', repos='http://ftp.acc.umu.se/mirror/CRAN/')"
            ```

        === "PDC"

            The example with xgboost will unfortunately not work on Dardel, as it works only for CUDA-capable GPUs. 

        === "C3SE" 

            ```bash 
            $ ml R/4.2.1-foss-2022a
            $ ml CUDA/12.9.1
            ```

        === "HPC2N"

            ```bash
            ml GCC/13.2.0 R/4.4.1 CUDA/12.1.1 
            ml OpenMPI/4.1.6 R-bundle-CRAN/2024.06 
            ``` 
 
        === "LUNARC"

            ```bash
            module load GCC/12.3.0 OpenMPI/4.1.5 R/4.4.1 
            module load R-bundle-CRAN/2023.12-R-4.4.1 CUDA 
            ```

        === "UPPMAX"  

            ```bash 
            ml R/4.4.2-gfbf-2024a R-bundle-CRAN/2024.11-foss-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2
            ``` 

    Get a release ``xgboost`` version with GPU support and place it in the package directory for your R version 
    - if you are using the project storage, change to that
    - If you have not created a package directory for the version of R you will use here, then follow the steps under [setup](../r/packages.md#setup)

    ```bash
     cd /home/u/username/R-packages-4.4.1
     wget https://github.com/dmlc/xgboost/releases/download/v1.5.0rc1/xgboost_r_gpu_linux.tar.gz
    ```  

    !!! NOTE

        If on NSC, activate your newly created conda environment, if you are not already there. Create a suitable directory for installing (probably for R 4.5.1) and add to .bashrc if you have not already: 

        ```bash
        mkdir -p /proj/courses-fall-2025/users/<username>/R-packages-4.5.1
        echo R_LIBS_USER="<path-to-your-space-on-proj-storage>/R-packages-%V" > ~/.Renviron
        ```

    Then, install the package

    ```bash
    R CMD INSTALL ./xgboost_r_gpu_linux.tar.gz
    ```

    Download a data set like the <a href="https://archive.ics.uci.edu/dataset/280/higgs" target="blank">HIGGS</a> data set for detecting Higgs particles that is large enough to benefit from GPU acceleration (it can take several minutes to download and uncompress). Do not put in the R-packages library:

    ```bash
    wget https://archive.ics.uci.edu/static/public/280/higgs.zip
    unzip higgs.zip
    gunzip HIGGS.csv.gz
    ```

    !!! warning 

        HIGGS.csv is a big file. If this is done during the course, you will find the HIGGS.csv file in the top of the project storage for the course. Use that instead of your own copy, and instead create a soft link for the file in your working directory: 

        ```bash
        $ cd /path/to/projdir/yourdir/workdir/
        $ ln -s /path/to/projdir/HIGGS.csv HIGGS.csv
        ```

    Copy and paste the following R script for predicting if the detected particles in the data set are Higgs bosons or not:

    ??? note "gpu-script-db-higgs.R"

        ```R
        # Inspired by the benchmarking of Anatoly Tsyplenkov:
        # https://anatolii.nz/posts/2024/xgboost-gpu-r
        #     step 0: Install these packages if you haven't done it
        #install.packages(c("xgboost", "data.table", "tictoc"))
        library(xgboost)
        library(data.table)
        library(tictoc)

        #     step 1: Extract the ZIP file (if not already extracted)
        #unzip("higgs.zip")  # Extracts to the current working directory

        #     step 2: Read the CSV file
        higgs_data <- fread("HIGGS.csv")  # Reads large datasets efficiently

        #     step 3: Preprocess Data
        # The first column is the target (0 or 1), the rest are features
        X <- as.matrix(higgs_data[, -1, with = FALSE])  # Remove first column
        y <- as.integer(higgs_data$V1)  # Target column

        # Train-test split (75% train, 25% test)
        set.seed(111)
        N <- nrow(X)
        train_idx <- sample.int(N, N * 0.75)

        dtrain <- xgb.DMatrix(X[train_idx, ], label = y[train_idx])
        dtest <- xgb.DMatrix(X[-train_idx, ], label = y[-train_idx])
        evals <- list(train = dtrain, test = dtest)

        #     step 4: Define XGBoost Parameters
        param <- list( objective = "binary:logistic", eval_metric = "error",
           eval_metric = "logloss", max_depth = 6, eta = 0.1)

        #     step 5: Train on CPU
        tic()
        xgb_cpu <- xgb.train( params = param, data = dtrain, watchlist = evals,
        nrounds = 10000, verbose = 0, tree_method = "hist")
        toc()

        #     step 6: Train on GPU
        tic()
        xgb_gpu <- xgb.train( params = param, data = dtrain, watchlist = evals,
        nrounds = 10000, verbose = 0, tree_method = "hist", device = "cuda")
        toc()

        # Print models
        print(xgb_cpu)
        print(xgb_gpu)
        ``` 

    You can use the following template for your batch script:

    ??? note "job-gpu.sh"

        === "NSC" 

            ```bash 
            #!/bin/bash
            # Remember to change this to your own project ID after the course!
            #SBATCH -A naiss2025-22-934
            # Asking for runtime: hours, minutes, seconds. At most 1 week
            #SBATCH --time=03:00:00
            # Ask for resources, including GPU resources
            #SBATCH -n 1
            #SBATCH -c 32
            #SBATCH --gpus-per-task=1

            # Remove any loaded modules and load the ones we need
            module purge  > /dev/null 2>&1
            ml buildenv-gcccuda/11.6.2-gcc9-hpc1
            ml buildtool-easybuild/4.9.4-hpc71cbb0050
            ml Miniforge/24.7.1-2-hpc1
            conda activate myenv
            mamba activate R  

            R --no-save --no-restore -f gpu-script-db-higgs.R
            ```

        === "PDC"
 
            Dardel has AMD GPUs so we cannot run the xgboost R package.     

        === "C3SE" 

            ```bash
            #!/bin/bash
            # Remember to change this to your own project ID after the course!
            #SBATCH -A NAISS2025-22-934
            #SBATCH -t 03:00:00
            #SBATCH -p alvis
            #SBATCH -N 1 --gpus-per-node=T4:1

            ml purge > /dev/null 2>&1
            module load R/4.2.1-foss-2022a CUDA/12.9.1 

            R --no-save --no-restore -f gpu-script-db-higgs.R
            ```
            
        === "HPC2N" 

            ```bash
            #!/bin/bash
            #SBATCH -A hpc2n2025-151 # Change to your own project ID
            #Asking for 1 hour.
            #SBATCH -t 03:00:00
            #SBATCH -n 1
            #SBATCH --gpus=1
            #SBATCH -C l40s
            #Writing output and error files
            #SBATCH --output=output%J.out
            #SBATCH --error=error%J.error

            ml purge > /dev/null 2>&1
            ml GCC/13.2.0 R/4.4.1 CUDA/12.1.1
            ml OpenMPI/4.1.6 R-bundle-CRAN/2024.06

            R --no-save --no-restore -f gpu-script-db-higgs.R
            ```

        === "LUNARC" 

            ```bash
            #!/bin/bash
            # Remember to change this to your own project ID after the course!
            #SBATCH -A lu2025-2-94
            # Asking for runtime: hours, minutes, seconds. At most 1 week
            #SBATCH --time=03:00:00
            # Ask for GPU resources - x is how many cards, 1 or 2 
            #SBATCH -p gpua100
            #SBATCH --gres=gpu:x
        
            # Remove any loaded modules and load the ones we need
            module purge  > /dev/null 2>&1
            module load GCC/12.3.0 OpenMPI/4.1.5 R/4.4.1 
            module load R-bundle-CRAN/2023.12-R-4.4.1 CUDA

            R --no-save --no-restore -f gpu-script-db-higgs.R
            ```

        === "UPPMAX" 

            ```bash
            #!/bin/bash -l
            #SBATCH -A uppmax2025-2-360 # Change to your own project ID
            #Asking for 3 hours.
            #SBATCH -t 03:00:00
            #SBATCH -p gpu 
            #SBATCH --gpus:l40s:1
            #Writing output and error files
            #SBATCH --output=output%J.out
            #SBATCH --error=error%J.error

            ml R/4.4.2-gfbf-2024a R-bundle-CRAN/2024.11-foss-2024a R-bundle-Bioconductor/3.20-foss-2024a-R-4.4.2 

            R --no-save --no-restore -f gpu-script-db-higgs.R
            ```

    ??? note "Timings"

        ```R

         > #     step 5: Train on CPU
         > tic()
         > xgb_cpu <- xgb.train( params = param, data = dtrain, watchlist = evals,
         + nrounds = 10000, verbose = 0, tree_method = "hist")
         > toc()
         10337.386 sec elapsed
         >
         > #     step 6: Train on GPU
         > tic()
         > xgb_gpu <- xgb.train( params = param, data = dtrain, watchlist = evals,
         + nrounds = 10000, verbose = 0, tree_method = "hist", device = "cuda")
         > toc()
         199.416 sec elapsed
         ```

## Exercises 

!!! note "<img src="../../img/shell-logo_small.png"> Exercise"

    Run validation.R with Rscript

    This example is taken from <a href="https://www.geeksforgeeks.org/cross-validation-in-r-programming/" target="_blank">https://www.geeksforgeeks.org/cross-validation-in-r-programming/</a>. 

    ??? note "``validation.R``"

        ```R
        # R program to implement
        # validation set approach
        # Taken from https://www.geeksforgeeks.org/cross-validation-in-r-programming/
        library(tidyverse)
        library(caret)
        library(datarium)

        # setting seed to generate a
        # reproducible random sampling
        set.seed(123)

        # creating training data as 80% of the dataset
        random_sample <- createDataPartition(marketing $ sales, p = 0.8, list = FALSE)

        # generating training dataset
        # from the random_sample
        training_dataset <- marketing[random_sample, ]

        # generating testing dataset
        # from rows which are not
        # included in random_sample
        testing_dataset <- marketing[-random_sample, ]

        # Building the model

        # training the model by assigning sales column
        # as target variable and rest other columns
        # as independent variables
        model <- lm(sales ~., data = training_dataset)

        # predicting the target variable
        predictions <- predict(model, testing_dataset)

        # computing model performance metrics
        data.frame( R2 = R2(predictions, testing_dataset $ sales), RMSE = RMSE(predictions, testing_dataset $ sales), MAE = MAE(predictions, testing_dataset $ sales))
        ```

??? note "Solution"

    NOTE: you may or may not have to install the "datarium" package. Check! Load R, R-bundle-CRAN, R-bundle-Bioconductor, etc. and test!

    ```bash 
    $ Rscript validation.R

!!! note "<img src="../../img/shell-logo_small.png"> Exercise"

    Create a batch script to run ``validation.R``

    You can find example batch scripts in the ``exercises/r`` directory and you can also look at the examples on this page.

