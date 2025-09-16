library(parallel, quietly = TRUE)
library(doParallel, quietly = TRUE)

# nr. of workers/cores that will solve the tasks
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 1) {
  stop(
    "Please specify the number of cores this calculation uses, \n",
    "for example: \n",
    " \n",
    "  Rscript integration2d.R 1 \n",
    " \n"
  )
}
nworkers <- as.numeric(args[1])
message("Number of workers: ", nworkers)

# Else the error will be 'Cannot find port 0:nworkers'
testthat::expect_true(is.numeric(nworkers))
testthat::expect_true(nworkers > 0)
testthat::expect_true(nworkers < 256 * 256)

# grid size
n <- 16384
message("Grid size: ", n)

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

# Set up the cluster for doParallel
cl <- makeCluster(nworkers)
registerDoParallel(cl)

    # Start the timer
    starttime <- Sys.time()

    # Distribute tasks to processes and combine the outputs into the results list
    results <- foreach(i = 1:nworkers, .combine = c) %dopar% { integration2d(n, nworkers, i) }

    # Calculate the total integral by summing over partial integrals
    integral_value <- sum(results)

    # End the timing
    endtime <- Sys.time()

    # Print out the result
    error_value <- abs(integral_value - 0.0)
    duration_secs <- difftime(endtime, starttime, units = "secs")
    core_secs <- duration_secs * nworkers
    message("Integral value: ", integral_value)
    message("Integral error: ", error_value)
    message("Time spent on 1 core (seconds): ", duration_secs)
    message("Time spent on all cores (seconds): ", core_secs)

# Stop the cluster after computation
stopCluster(cl)
