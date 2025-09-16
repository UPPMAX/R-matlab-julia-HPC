library(parallel)
library(doParallel)

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
# nworkers <- 8
message("nworkers: ", nworkers)

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


# Set up the cluster for doParallel
cl <- makeCluster(nworkers)
registerDoParallel(cl)

    # Start the timer
    starttime <- Sys.time()

    # Distribute tasks to processes and combine the outputs into the results list
    results <- foreach(i = 1:nworkers, .combine = c) %dopar% { integration2d(n, nworkers, i) }

    # Calculate the total integral by summing over partial integrals
    integral <- sum(results)

    # End the timing
    endtime <- Sys.time()

    # Print out the result
    print(paste("Integral value is", integral, "Error is", abs(integral - 0.0)))
    print(paste("Time spent:", difftime(endtime, starttime, units = "secs"), "seconds"))

# Stop the cluster after computation
stopCluster(cl)
