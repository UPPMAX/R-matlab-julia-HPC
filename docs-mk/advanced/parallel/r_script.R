#!/bin/env Rscript
#
# Script that does a computation that can uses multiple cores.
#
# Usage:
#
#   Rscript r_script.R [number_of_cores]
#
# For example:
#
#   Rscript r_script.R 1
#
# Adapted from Pedro Ojeda's code at
# https://github.com/UPPMAX/R-matlab-julia-HPC/blob/main/docs/common/parallel.rst


args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
  stop(
    "Please specify the number of cores this calculation uses, \n",
    "for example: \n",
    " \n",
    "  Rscript r_script 1 \n",
    " \n"
  )
}
n_cores <- args[1]
message("Number of cores: ", n_cores)

testthat::expect_true(n_cores > 0)
testthat::expect_true(n_cores < 65)

library(doParallel, quietly = TRUE) # for %%dopar%

testthat::expect_true(system.file(package = "doParallel") != "")

# grid size
n <- 840

# Function for 2D integration (non-optimal implementation)
integration2d <- function(n, numprocesses, processindex) {
  # Interval size (same for X and Y)
  h <- pi / n
  # Cumulative variable
  mysum <- 0.0
  # Workload for each process
  workload <- floor(n / numprocesses)

  # Define the range of work for each process according to index
  begin_index <- workload * (processindex - 1) + 1
  end_index <- workload * processindex

  # Regular integration in the X axis
  for (i in begin_index:end_index) {
    x <- h * (i - 0.5)
    # Regular integration in the Y axis
    for (j in 1:n) {
      y <- h * (j - 0.5)
      mysum <- mysum + sin(x + y)
    }
  }
  # Return the result
  return(h^2 * mysum)
}

testthat::expect_true(integration2d(n = 1, numprocesses = 1, processindex = 1) > 0.0)

# Set up the cluster for doParallel
cl <- parallel::makeCluster(n_cores)

# Curled braces to remember to do stopCluster
{
    doParallel::registerDoParallel(cl)

    # Start the timer
    starttime <- Sys.time()

    # Distribute tasks to processes and combine the outputs into the results list
    results <- foreach::foreach(i = 1:n_cores, .combine = c) %dopar% { integration2d(n, n_cores, i) }

    # Calculate the total integral by summing over partial integrals
    integral <- sum(results)

    # End the timing
    endtime <- Sys.time()

    # Print out the result
    print(paste("Integral value is", integral, "Error is", abs(integral - 0.0)))
    print(paste("Time spent:", difftime(endtime, starttime, units = "secs"), "seconds"))
}

# Stop the cluster after computation
parallel::stopCluster(cl)
