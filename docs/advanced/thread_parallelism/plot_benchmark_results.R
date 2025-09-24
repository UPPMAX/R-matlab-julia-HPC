#!/bin/env Rscript

csv_files <- list.files(pattern = "csv")

list_of_tables <- list()

for (i in seq_along(csv_files)) {
  list_of_tables[[i]] <- readr::read_csv(csv_files, show_col_types = FALSE)
}

t <- dplyr::bind_rows(list_of_tables)
t$single_core_secs <- t$core_secs / t$n_workers

best_times <- t |>
  dplyr::filter(n_workers == 1) |>
  dplyr::group_by(language, hpc_cluster, grid_size, n_workers) |>
  dplyr::summarise(best_core_secs = mean(core_secs), .groups = "drop") |>
  dplyr::select(language, hpc_cluster, grid_size, best_core_secs)
efficiencies <- merge(t, best_times, by = c("language", "hpc_cluster", "grid_size"))
efficiencies$f <- efficiencies$best_core_secs / efficiencies$core_secs
efficiencies$speedup <- efficiencies$best_core_secs / efficiencies$single_core_secs

ggplot2::ggplot(
  t,
  ggplot2::aes(x = n_workers, y = core_secs, color = hpc_cluster)
) + ggplot2::geom_point() +
  ggplot2::scale_x_continuous("Number of workers", limits = c(0, max(t$n_workers))) +
  ggplot2::scale_y_continuous("Core seconds", limits = c(0, NA)) +
  ggplot2::geom_smooth() +
  ggplot2::facet_grid(language ~ ., scales = "free_y") +
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
  ggplot2::stat_function(color = "black", fun = function(n_workers) { 1.0 } ) +
  ggplot2::stat_function(color = "black", lty = "dashed", fun = function(n_workers) { 1.0 / n_workers } ) +
  ggplot2::facet_grid(language ~ .) +
  ggplot2::labs(
    title = "Threaded parallelism",
    caption = paste0(
      "Solid diagonal line: maximumally predicted efficiency. ",
      "Dashed horizonal line: minimally predicted efficiency ",
      "Number of runs: ", nrow(t)
    )
  )

ggplot2::ggsave("benchmark_results_efficiency.png", width = 7, height = 7)

ggplot2::ggplot(
  efficiencies,
  ggplot2::aes(x = n_workers, y = speedup, color = hpc_cluster)
) + ggplot2::geom_point() +
  ggplot2::scale_x_continuous("Number of workers", limits = c(0, max(efficiencies$speedup))) +
  ggplot2::scale_y_continuous(
    "Speedup",
    limits = c(0, max(efficiencies$speedup)),
    labels = scales::percent
  ) +
  # ggplot2::geom_abline(slope = 1.0) +
  ggplot2::stat_function(color = "black", fun = function(n_workers) { n_workers } ) +
  ggplot2::stat_function(color = "black", lty = "dashed", fun = function(n_workers) { 1.0 } ) +
  ggplot2::geom_smooth() +
  ggplot2::facet_grid(language ~ ., scales = "free_y") +
  ggplot2::labs(
    title = "Threaded parallelism",
    caption = paste0(
      "Solid diagonal line: maximumally predicted speedup. ",
      "Dashed horizonal line: minimally predicted speedup. ",
      "Number of runs: ", nrow(t)
    )
  )

ggplot2::ggsave("benchmark_results_speedup.png", width = 7, height = 7)
