#!/bin/env Rscript

csv_files <- list.files(pattern = "csv")

list_of_tables <- list()

for (i in seq_along(csv_files)) {
  list_of_tables[[i]] <- readr::read_csv(csv_files, show_col_types = FALSE)
}

t <- dplyr::bind_rows(list_of_tables)

best_times <- t |>
  dplyr::filter(n_workers == 1) |>
  dplyr::group_by(language, hpc_cluster, grid_size, n_workers) |>
  dplyr::summarise(best_core_secs = mean(core_secs), .groups = "drop") |>
  dplyr::select(language, hpc_cluster, grid_size, best_core_secs)
efficiencies <- merge(t, best_times, by = c("language", "hpc_cluster", "grid_size"))
efficiencies$f <- efficiencies$best_core_secs / efficiencies$core_secs

ggplot2::ggplot(
  t,
  ggplot2::aes(x = n_workers, y = core_secs, color = hpc_cluster)
) + ggplot2::geom_point() +
  ggplot2::scale_x_continuous("Number of workers", limits = c(0, max(t$n_workers))) +
  ggplot2::scale_y_continuous("Core seconds", limits = c(0, max(t$core_secs))) +
  ggplot2::geom_smooth() +
  ggplot2::facet_grid(language ~ .) +
  ggplot2::labs(
    title = "Threaded parallelism",
    caption = paste0("Number of runs: ", nrow(t))
  )

ggplot2::ggsave("benchmark_results_core_seconds.png", width = 7, height = 7)

ggplot2::ggplot(
  efficiencies,
  ggplot2::aes(x = n_workers, y = f, color = hpc_cluster)
) + ggplot2::geom_point() +
  ggplot2::scale_x_continuous("Number of workers", limits = c(0, max(efficiencies$n_workers))) +
  ggplot2::scale_y_continuous(
    "Relative efficiency",
    limits = c(0, max(efficiencies$f)),
    labels = scales::percent
  ) +
  ggplot2::geom_smooth() +
  ggplot2::facet_grid(language ~ .) +
  ggplot2::labs(
    title = "Threaded parallelism",
    caption = paste0("Number of runs: ", nrow(t))
  )

ggplot2::ggsave("benchmark_results_efficiency.png", width = 7, height = 7)
