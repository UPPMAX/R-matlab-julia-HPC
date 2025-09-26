#!/bin/env Rscript

# Step 1: check for all packages

if (!require("doParallel")) {
  stop(
    "Package 'doParallel' not installed. \n",
    "Install it, using, for example: \n",
    " \n",
    "  install.packages(\"doParallel\")",
    " \n"
  )
}
if (!require("stringr")) {
  stop(
    "Package 'stringr' not installed. \n",
    "Install it, using, for example: \n",
    " \n",
    "  install.packages(\"stringr\")",
    " \n"
  )
}
if (!require("testthat")) {
  stop(
    "Package 'testthat' not installed. \n",
    "Install it, using, for example: \n",
    " \n",
    "  install.packages(\"testthat\")",
    " \n"
  )
}

# Step 2: process command-line arguments

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
    "General usage: \n",
    " \n",
    "  Rscript do_2d_integration.R [n_workers] [grid_size]\n",
    " \n",
    "Examples: \n",
    " \n",
    "  Rscript do_2d_integration.R 1\n",
    "  Rscript do_2d_integration.R 1 16384\n",
    " \n"
  )
}

n_workers <- as.numeric(args[1])
message("Number of workers: ", n_workers)

# Else the error will be 'Cannot find port 0:n_workers'
testthat::expect_true(is.numeric(n_workers))
testthat::expect_true(n_workers > 0)
testthat::expect_true(n_workers < 256 * 256)

#' Detect the HPC cluster this script is run on
#' @param hostname the `HOSTNAME` environmental variable
extract_hpc_cluster <- function(hostname = Sys.getenv("HOSTNAME")) {
  testthat::expect_equal(1, length(hostname))
  if (nchar(hostname) == 0) return("unknown")
  if (stringr::str_detect(hostname, "^b-cn[:digit:]{1,6}$")) {
    return("kebnekaise")
  }
  if (stringr::str_detect(hostname, "^cn[:digit:]{1,3}$")) return("cosmos")
  if (stringr::str_detect(hostname, "^cosmos[:digit:].int.lunarc$")) {
    return("cosmos")
  }
  if (stringr::str_detect(hostname, "^login[:digit:]$")) return("dardel")
  if (stringr::str_detect(hostname, "^n[:digit:]{1,6}$")) return("tetralith")
  if (stringr::str_detect(hostname, "^nid[:digit:]{1,6}$")) return("dardel")
  if (stringr::str_detect(hostname, "^pelle[:digit:].uppmax.uu.se$")) {
    return("pelle")
  }
  if (stringr::str_detect(hostname, "^p[:digit:]{1,3}$")) return("pelle")
  if (stringr::str_detect(hostname, "^rackham[:digit:].uppmax.uu.se$")) {
    return("rackham")
  }
  if (stringr::str_detect(hostname, "^r[:digit:]{1,4}$")) return("rackham")
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
testthat::expect_equal("rackham", extract_hpc_cluster("r1200"))
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

# Step 3: prepare calculation

library(parallel, quietly = TRUE)
library(doParallel, quietly = TRUE)

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

  interval_size <- pi / grid_size
  my_sum <- 0.0
  grid_cells_per_worker <- floor(grid_size / n_workers)

  begin_index <- grid_cells_per_worker * (worker_index - 1) + 1
  end_index <- grid_cells_per_worker * worker_index

  for (i in begin_index:end_index) {
    x <- interval_size * (i - 0.5)
    for (j in 1:grid_size) {
      y <- interval_size * (j - 0.5)
      my_sum <- my_sum + sin(x + y)
    }
  }
  (interval_size ^ 2) * my_sum
}

testthat::expect_true(
  abs(integration2d(grid_size = 100, n_workers = 1, worker_index = 1)) < 0.0001
)

# Step 4: do calculation in parallel

my_cores <- makeCluster(n_workers)

registerDoParallel(my_cores)

start_time <- Sys.time()

# Each worker produces a value in the vector,
# e.g. c(0.1, 0.2, -0.3) denotes a run with 3 workers,
# of which the first had 0.1 as its volume under the surface
results_of_workers <- foreach(i = 1:n_workers, .combine = c) %dopar% {
  integration2d(grid_size, n_workers, i)
}

integral_value <- sum(results_of_workers)

end_time <- Sys.time()

stopCluster(my_cores)

# Step 5: print out the result in a human-friendly way

error_value <- abs(integral_value - 0.0)
duration_secs <- difftime(end_time, start_time, units = "secs")
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
