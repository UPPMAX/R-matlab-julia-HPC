#!/bin/env Rscript

csv_files <- list.files(pattern = "csv")

list_of_tables <- list()

for (i in seq_along(csv_files)) {
  list_of_tables[[i]] <- readr::read_csv(csv_files, show_col_types = FALSE)
}

t <- dplyr::bind_rows(list_of_tables)

ggplot2::ggplot(
  t,
  ggplot2::aes(x = n_workers, y = core_secs, color = hpc_cluster)
) + ggplot2::geom_point() +
  ggplot2::scale_x_continuous("Number of workers", limits = c(0, max(t$n_workers))) +
  ggplot2::scale_y_continuous("Core seconds", limits = c(0, max(t$core_secs))) +
  ggplot2::facet_grid(language ~ .) +
  ggplot2::labs(
    title = "Threaded parallelism",
    caption = paste0("Number of runs: ", nrow(t))
  )

ggplot2::ggsave("benchmark_results.png", width = 7, height = 7)
