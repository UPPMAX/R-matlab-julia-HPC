#!/bin/env Rscript
library(Rmpi, quietly = TRUE)

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
    "  Rscript do_2d_integration.R [n_workers] [grid_size]\n",
    " \n",
    "Examples: \n",
    " \n",
    "  Rscript do_2d_integration 1\n",
    "  Rscript do_2d_integration 1 16384\n",
    " \n"
  )
}

n_workers <- as.numeric(args[1])
message("Number of workers: ", n_workers)

testthat::expect_true(is.numeric(n_workers))
testthat::expect_true(n_workers > 0)
testthat::expect_true(n_workers < 256 * 256)

universe_size <- mpi.universe.size()
message("Universe size: ", universe_size)


if (universe_size != n_workers) {
  stop(
    "ERROR: mismatch between the number of cores and the number of workers. \n",
    "universe_size: ", universe_size, " \n",
    "n_workers: ", n_workers
  )
}


ns <- mpi.universe.size() - 1
mpi.spawn.Rslaves(nslaves = ns)
#
# In case R exits unexpectedly, have it automatically clean up
# resources taken up by Rmpi (slaves, memory, etc...)
.Last <- function(){
if (is.loaded("mpi_initialize")){
if (mpi.comm.size(1) > 0){
print("Please use mpi.close.Rslaves() to close slaves.")
mpi.close.Rslaves()
}
print("Please use mpi.quit() to quit R")
.Call("mpi_finalize")
}
}
# Tell all slaves to return a message identifying themselves
mpi.remote.exec(paste("I am",mpi.comm.rank(),"of",mpi.comm.size(),system("hostname",intern=T)))

# Test computations
x <- 5
x <- mpi.remote.exec(rnorm, x)
length(x)
x

# Tell all slaves to close down, and exit the program
mpi.close.Rslaves()

mpi.quit()







exit 12324



#' Detect the HPC cluster this script is run on
#' @param hostname the `HOSTNAME` environmental variable
extract_hpc_cluster <- function(hostname = Sys.getenv("HOSTNAME")) {
  testthat::expect_equal(1, length(hostname))
  if (nchar(hostname) == 0) return("unknown")
  if (stringr::str_detect(hostname, "^b-cn[:digit:]{1,6}$")) return("kebnekaise")
  if (stringr::str_detect(hostname, "^cn[:digit:]{1,3}$")) return("cosmos")
  if (stringr::str_detect(hostname, "^cosmos[:digit:].int.lunarc$")) return("cosmos")
  if (stringr::str_detect(hostname, "^login[:digit:]$")) return("dardel")
  if (stringr::str_detect(hostname, "^n[:digit:]{1,6}$")) return("tetralith")
  if (stringr::str_detect(hostname, "^nid[:digit:]{1,6}$")) return("dardel")
  if (stringr::str_detect(hostname, "^pelle[:digit:].uppmax.uu.se$")) return("pelle")
  if (stringr::str_detect(hostname, "^p[:digit:]{1,3}$")) return("pelle")
  if (stringr::str_detect(hostname, "^rackham[:digit:].uppmax.uu.se$")) return("rackham")
  if (stringr::str_detect(hostname, "^r[:digit:]{1,3}$")) return("rackham")
  hostname
}


testthat::expect_equal("unknown", extract_hpc_cluster(""))
testthat::expect_equal("some.hostname", extract_hpc_cluster("some.hostname"))
testthat::expect_equal("cosmos", extract_hpc_cluster("cosmos2.int.lunarc"))
testthat::expect_equal("cosmos", extract_hpc_cluster("cn1"))
testthat::expect_equal("cosmos", extract_hpc_cluster("cn12"))
testthat::expect_equal("cosmos", extract_hpc_cluster("cn123"))
testthat::expect_equal("dardel", extract_hpc_cluster("login1"))
testthat::expect_equal("dardel", extract_hpc_cluster("nid001962"))
testthat::expect_equal("kebnekaise", extract_hpc_cluster("b-cn1707"))
testthat::expect_equal("rackham", extract_hpc_cluster("rackham1.uppmax.uu.se"))
testthat::expect_equal("rackham", extract_hpc_cluster("rackham4.uppmax.uu.se"))
testthat::expect_equal("pelle", extract_hpc_cluster("pelle1.uppmax.uu.se"))
testthat::expect_equal("pelle", extract_hpc_cluster("p1"))
testthat::expect_equal("pelle", extract_hpc_cluster("p12"))
testthat::expect_equal("pelle", extract_hpc_cluster("p123"))
testthat::expect_equal("pelle", extract_hpc_cluster("pelle4.uppmax.uu.se"))
testthat::expect_equal("tetralith", extract_hpc_cluster("n1301"))
testthat::expect_equal("tetralith", extract_hpc_cluster("n130"))
testthat::expect_equal("tetralith", extract_hpc_cluster("n13"))
testthat::expect_equal("tetralith", extract_hpc_cluster("n1"))

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
hpc_cluster <- extract_hpc_cluster()
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

