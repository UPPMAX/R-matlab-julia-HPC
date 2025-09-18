#!/bin/env Rscript

library(parallel, quietly = TRUE)
library(doParallel, quietly = TRUE)

# nr. of workers/cores that will solve the tasks
args <- commandArgs(trailingOnly = TRUE)
if (length(args) == 0 || length(args) > 2) {
  stop(
    "ERROR: Incorrect number of arguments. \n",
    " \n",
    "Please specify: \n",
    " \n",
    "- the number of workers this calculation uses \n",
    "- (optionally) a grid size \n",
    " \n",
    "General usage:",
    " \n",
    "  Rscript integration2d.R [n_workers] [grid_size]\n",
    " \n",
    "Examples: \n",
    " \n",
    "  Rscript integration2d.R 1\n",
    "  Rscript integration2d.R 1 16384\n",
    " \n"
  )
}
n_workers <- as.numeric(args[1])
message("Number of workers: ", n_workers)

# Else the error will be 'Cannot find port 0:n_workers'
testthat::expect_true(is.numeric(n_workers))
testthat::expect_true(n_workers > 0)
testthat::expect_true(n_workers < 256 * 256)

# grid size
grid_size <- 16384

if (length(args) == 2) {
  grid_size <- as.numeric(args[2])
}
testthat::expect_true(is.numeric(grid_size))
message("Grid size: ", grid_size)

#' Function that integrates the function `sin(x + y)` in a threaded fashion.
#' @param grid_size the grid size
#' @param n_workers the number of workers
#' @param worker_index the index of this worker
#' @return the sum of the integration for this worker
#' @examples
#' # A single-threaded calculation
#' integration2d(grid_size = 100, n_workers = 1, worker_index = 1)
#'
#' # Using two workers, each having their own partial result
#' sum_1 <- integration2d(grid_size = 100, n_workers = 2, worker_index = 1)
#' sum_2 <- integration2d(grid_size = 100, n_workers = 2, worker_index = 2)
integration2d <- function(grid_size, n_workers, worker_index) {
  testthat::expect_true(grid_size > 0)
  testthat::expect_true(n_workers > 0)
  testthat::expect_true(worker_index > 0)
  testthat::expect_true(worker_index <= n_workers)

  # Interval size (same for X and Y)
  h <- pi / grid_size
  # Cumulative variable
  mysum <- 0.0
  # Workload for each process
  workload <- floor(grid_size / n_workers)

  # Define the range of work for each process according to index
  begin_index <- workload * (worker_index - 1) + 1
  end_index <- workload * worker_index

  # Regular integration in the X axis
  for (i in begin_index:end_index) {
    x <- h * (i - 0.5)
    # Regular integration in the Y axis
    for (j in 1:grid_size) {
      y <- h * (j - 0.5)
      mysum <- mysum + sin(x + y)
    }
  }
  # Return the result
  h^2 * mysum
}

testthat::expect_true(
  abs(integration2d(grid_size = 100, n_workers = 1, worker_index = 1)) < 0.0001
)

# Set up the cluster for doParallel
cl <- makeCluster(n_workers)
registerDoParallel(cl)

# Start the timer
starttime <- Sys.time()

# Distribute tasks to processes and combine the outputs into the results list
results <- foreach(i = 1:n_workers, .combine = c) %dopar% {
  integration2d(grid_size, n_workers, i)
}

# Calculate the total integral by summing over partial integrals
integral_value <- sum(results)

# End the timing
endtime <- Sys.time()

# Print out the result in a human-friendly way
error_value <- abs(integral_value - 0.0)
duration_secs <- difftime(endtime, starttime, units = "secs")
core_secs <- duration_secs * n_workers
message("Integral value: ", integral_value)
message("Integral error: ", error_value)
message("Time spent on 1 core (seconds): ", duration_secs)
message("Time spent on all cores (seconds): ", core_secs)

# Print out the result in a computer-friendly way
language <- "r"
hpc_cluster <- "rackham"
message(
  "language", ",",
  "hpc_cluster", ",",
  "grid_size", ",",
  "n_workers", ",",
  "core_secs"
)
message(
  language, ",",
  hpc_cluster, ",",
  grid_size, ",",
  n_workers, ",",
  core_secs
)

# Stop the cluster after computation
stopCluster(cl)


