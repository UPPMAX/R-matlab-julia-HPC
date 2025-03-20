ML with R 
=========

.. questions::

   - Is R suitable for Machine Learning (ML)?
   - How to run R ML jobs on a HPC system (UPPMAX, HPC2N, LUNARC, NSC, PDC)
   
.. objectives:: 

   - Short introduction to ML with R
   - Workflow
   - Show the structure of a suitable batch script
   - Examples to try

R provides many packages that are specifically designed for machine learning. R is also known for its statistical capabilities for analysis and interpretation of data. 

This all makes it easier to develop and deploy models, also without having to write a lot of code yourself. 

The R community has contributed many powerful packages, both for machine learning and data science. Some of the popular packages are: 

- Dplyr
- Tidyr
- Caret
- MLR
- ggplot2
- randomForest
- mlbench
- tidyverse

and others depending on the cluster. 

Running your code
-----------------

**Workflow**

1. Determine if you need any R libraries that are not already installed (load R module and R_packages/R-bundle-Bioconductor and check)
2. Determine if you want to run on CPUs or GPUs - some of the R version modules are not CUDA-aware
3. Install any missing R libraries in an isolated environment 
4. Possibly download any datasets
5. Write a batch script
6. Submit the batch script   

**Example** 

.. type-along::

   We will run a simple example taken from https://machinelearningmastery.com/machine-learning-in-r-step-by-step/ 

   If you cannot access remote data-sets, change the R code as mentioned inside to use a local data-set, which has already been downloaded 

   **NOTE**: normally we would not run this on the command line, but through a batch script, but since these are short examples we will run it on the command line. 

   .. tabs::

      .. tab:: UPPMAX

         .. code-block:: console

            $ module load R/4.1.1 R_packages/4.1.1
            $ Rscript iris_ml.R 

      .. tab:: HPC2N

         .. code-block:: console 

            $ module load GCC/11.2.0 OpenMPI/4.1.1 R/4.1.2 R-bundle-Bioconductor/3.14-R-4.1.2 
            $ Rscript iris_ml.R

      .. tab:: LUNARC 

         .. code-block:: console 

            $ module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1 R-bundle-Bioconductor/3.15-R-4.2.1 
            $ Rscript iris_ml.R 
            
      .. tab:: NSC

         You need to install ``caret``, ``kernlab``, and ``randomForest`` before running, as shown below. If it asks, agree to install in local directory.  

         .. code-block:: console 

            $ module load R/4.4.0-hpc1-gcc-11.3.0-bare 
            $ R
            > install.packages('caret', repos='http://ftp.acc.umu.se/mirror/CRAN/')
            > install.packages('kernlab', repos='http://ftp.acc.umu.se/mirror/CRAN/')
            > install.packages('randomForest', repos='http://ftp.acc.umu.se/mirror/CRAN/')
            > quit()
            $ Rscript iris_ml.R 
            
      .. tab:: PDC 

         You need to install ``caret``, ``kernlab``, and ``randomForest`` before running, as shown below. If it asks, agree to install in local directory.

         .. code-block:: console 

            $ module load PDC/23.12 R/4.4.1-cpeGNU-23.12  
            $ R
            > install.packages('caret', repos='http://ftp.acc.umu.se/mirror/CRAN/')
            > install.packages('kernlab', repos='http://ftp.acc.umu.se/mirror/CRAN/')
            > install.packages('randomForest', repos='http://ftp.acc.umu.se/mirror/CRAN/')
            > quit()
            $ Rscript iris_ml.R 
            
      .. tab:: iris_ml.R

         .. code-block:: R 
            :class: dropdown 

            # Simple example taken from https://machinelearningmastery.com/machine-learning-in-r-step-by-step/ 
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


R batch scripts for ML
~~~~~~~~~~~~~~~~~~~~~~

Since most R codes for Machine Learning would run for a fairly long time, you would usually have to run them in a batch script. 

Serial jobs
'''''''''''

.. type-along:: 

   Short serial batch example for running the R code above, ``iris_ml.R``

   .. tabs::

      .. tab:: UPPMAX

         Short serial example script for Rackham. Loading R/4.1.1 and R_packages/4.1.1

         .. code-block:: sh

            #!/bin/bash
            #SBATCH -A uppmax202u-w-xyz # Course project id. Change to your own project ID after the course
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here R/4.1.1 and R_packages/4.1.1
            module load R/4.1.1 R_packages/4.1.1
            
            # Run your R script (here 'iris_ml.R')
            R --no-save --quiet < iris_ml.R
  
            

      .. tab:: HPC2N

         Short serial example for running on Kebnekaise. Loading R/4.2.1 and prerequisites, also R-bundle-Bioconductor/3.15-R-4.2.1 
       
         .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2n202w-xyz # Change to your own project ID
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core
            
            # Load any modules you need, here R/4.2.1 and prerequisites + R-bundle-Bioconductor/3.15-R-4.2.1 
            module load GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1 R-bundle-Bioconductor/3.15-R-4.2.1 
            
            # Run your R script (here 'iris_ml.R')
            R --no-save --quiet < iris_ml.R
            

      .. tab:: LUNARC 

         Short serial example for running on Cosmos. Loading R/4.2.1 and prerequisites, also a suitable R-bundle-Bioconductor 

         .. code-block:: sh 

            #!/bin/bash
            #SBATCH -A lu202w-x-yz # Change to your own project ID
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core

            # Load any modules you need, here R/4.2.1 and prerequisites + R-bundle-Bioconductor
            module load GCC/11.3.0  OpenMPI/4.1.4  R/4.2.1 R-bundle-Bioconductor/3.15-R-4.2.1

            # Run your R script (here 'iris_ml.R')
            R --no-save --quiet < iris_ml.R

      .. tab:: NSC 

         Short serial example for running on Tetralith. Loading R/4.4.0-hpc1-gcc-11.3.0-bare 

         NOTE: if you did not install the packages ``caret``, ``kernlab``, and ``randomForest`` above, you have to do so now before running the script. 

         .. code-block:: sh 

            #!/bin/bash
            #SBATCH -A naiss202t-uw-xyz # Change to your own project ID
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core

            # Load any modules you need, here R/4.4.0-hpc1-gcc-11.3.0-bare
            module load R/4.4.0-hpc1-gcc-11.3.0-bare 

            # Run your R script (here 'iris_ml.R')
            R --no-save --quiet < iris_ml.R


      .. tab:: PDC  

         Short serial example for running on Dardel. Loading R/4.4.1-cpeGNU-23.12 and prerequisites  

         NOTE: if you did not install the packages ``caret``, ``kernlab``, and ``randomForest`` above, you have to do so now before running the script.

         .. code-block:: sh 

            #!/bin/bash
            #SBATCH -A naiss202t-uw-xyz # Change to your own project ID
            #SBATCH --time=00:10:00 # Asking for 10 minutes
            #SBATCH -n 1 # Asking for 1 core

            # Load any modules you need, here R/4.4.1-cpeGNU-23.12 and prerequisites 
            module load PDC/23.12 R/4.4.1-cpeGNU-23.12 

            # Run your R script (here 'iris_ml.R')
            R --no-save --quiet < iris_ml.R

   Send the script to the batch:

   .. code-block:: console

      $ sbatch <batch script>

      
        
Parallel jobs 
'''''''''''''

.. type-along:: 

   .. tabs::

      .. tab:: UPPMAX

         Short ML example for running on Snowy.          
       
         .. code-block:: sh

            #!/bin/bash
            #SBATCH -A uppmax202t-u-xyz
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH --exclusive
            #SBATCH -p node
            #SBATCH -n 1
            #SBATCH -M snowy
            #SBATCH --gres=gpu:1
            #Writing output and error files
            #SBATCH --output=output%J.out
            #SBATCH --error=error%J.error
            
            ml purge > /dev/null 2>&1
            ml R_packages/4.1.1
            
            R --no-save --no-restore -f Rscript.R
           

      .. tab:: HPC2N

         Short ML example for running on Kebnekaise.       
       
         .. code-block:: sh

            #!/bin/bash
            #SBATCH -A hpc2n202u-xyz # Change to your own project ID
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 1
            #SBATCH --gpus:1
            #SBATCH -C l40s
            #Writing output and error files
            #SBATCH --output=output%J.out
            #SBATCH --error=error%J.error
            
            ml purge > /dev/null 2>&1
            module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1 CUDA/12.1.1
                        
            R --no-save --no-restore -f Rscript.R

      .. tab:: LUNARC

         Short ML example for running on Cosmos. 

         .. code-block:: sh

            #!/bin/bash
            #SBATCH -A lu202u-x-yz # Change to your own project ID
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 1
            #SBATCH --gres=gpus:1
            #SBATCH -p gpua100
            #Writing output and error files
            #SBATCH --output=output%J.out
            #SBATCH --error=error%J.error
            
            ml purge > /dev/null 2>&1
            module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1 CUDA/12.1.1
                        
            R --no-save --no-restore -f Rscript.R
   
      .. tab:: NSC 

         Short ML example for running on Tetralith. 

         .. code-block:: sh

            #!/bin/bash
            #SBATCH -A naiss202t-uv-xyz # Change to your own project ID
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -n 1
            #SBATCH -c 32 
            #SBATCH --gpus-per-task=1
            #Writing output and error files
            #SBATCH --output=output%J.out
            #SBATCH --error=error%J.error
            
            ml purge > /dev/null 2>&1
            module load R/4.4.0-hpc1-gcc-11.3.0-bare 
                        
            R --no-save --no-restore -f Rscript.R

      .. tab:: PDC 

         Short ML example for running on Dardel. 

         .. code-block:: sh

            #!/bin/bash
            #SBATCH -A naiss202u-vw-xyz # Change to your own project ID
            #Asking for 10 min.
            #SBATCH -t 00:10:00
            #SBATCH -N 1
            #SBATCH --ntasks-per-node=1
            #SBATCH -p shared 
            #Writing output and error files
            #SBATCH --output=output%J.out
            #SBATCH --error=error%J.error
            
            ml purge > /dev/null 2>&1
            module load PDC/23.12 R/4.4.1-cpeGNU-23.12  
                        
            R --no-save --no-restore -f Rscript.R           

      .. tab:: Rscript.R

         Short ML example.       
       
         .. code-block:: sh

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


   .. code-block:: console

      $ sbatch <batch script>


GPU jobs 
''''''''

Some packages are now able to use GPUs for ML jobs in R. One of them is `xgboost <https://xgboost.readthedocs.io/en/latest/install.html>`_. 
In the following demo you will find instructions to install this package and run a test case with GPUs.

.. demo:: 
   :class: dropdown

   **Prerequisites**

   Choose an R version > 4.1 and a CUDA module:

   .. code-block:: bash 

      ml GCC/13.2.0 R/4.4.1 CUDA/12.1.1

   Get a release ``xgboost`` version with GPU support and place it in the package directory for your R version:

   .. code-block:: bash

      cd /home/u/username/R-packages-4.4.1 
      wget https://github.com/dmlc/xgboost/releases/download/v1.5.0rc1/xgboost_r_gpu_linux.tar.gz

   Then, install the package

   .. code-block:: bash 

      R CMD INSTALL ./xgboost_r_gpu_linux.tar.gz

   Download a data set like the `HIGGS <https://archive.ics.uci.edu/dataset/280/higgs>`_ data set for detecting Higgs particles 
   that is large enough to benefit from GPU acceleration (it can take several minutes to download and uncompress):

   .. code-block:: bash

      wget https://archive.ics.uci.edu/static/public/280/higgs.zip 
      unzip higgs.zip
      gunzip HIGGS.csv.gz 

   Copy and paste the following R script for predicting if the detected particles in the data set are Higgs bosons or not:

   .. admonition:: gpu-script-db-higgs.R
      :class: dropdown

      .. code-block:: r 

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

   You can use the following template for your batch script:

   .. admonition:: job-gpu.sh
      :class: dropdown

      .. code-block:: r 

         #!/bin/bash
         #SBATCH -A hpc2n202w-xyz # Change to your own project ID
         #Asking for 10 min.
         #SBATCH -t 30:50:00
         #SBATCH -n 1
         #SBATCH --gpus=1
         #SBATCH -C l40s
         #Writing output and error files
         #SBATCH --output=output%J.out
         #SBATCH --error=error%J.error

         ml purge > /dev/null 2>&1
         #module load GCC/11.3.0 OpenMPI/4.1.4 R/4.2.1 CUDA/12.1.1
         ml GCC/13.2.0 R/4.4.1 CUDA/12.1.1

         R --no-save --no-restore -f gpu-script-db-higgs.R

   .. admonition:: Timings
      :class: dropdown

      .. code-block:: r 

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



Exercises
---------

.. challenge:: Run validation.R with Rscript

   This example is taken from https://www.geeksforgeeks.org/cross-validation-in-r-programming/

.. admonition:: ``validation.R``
   :class: dropdown 
      
      .. code-block:: R

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



.. solution:: Solution

   .. code-block:: console

      $ Rscript validation.R

.. challenge:: Create a batch script to run ``validation.R``

   You can find example batch scripts in the ``exercises/r`` directory. 

