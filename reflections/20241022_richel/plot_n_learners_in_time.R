#!/bin/env Rscript
t <- readr::read_csv("20241022_counts.csv", show_col_types = FALSE)
t$n_total <- t$n_cam_on + t$n_cam_off
n_registrations_python <- 48


ggplot2::ggplot(t, ggplot2::aes(x = time, y = n_total)) + 
  ggplot2::geom_smooth() +
  ggplot2::geom_point() + 
  ggplot2::scale_y_continuous(
    "Number of learners",
    limits = c(0, n_registrations_python)
  ) +
  ggplot2::geom_hline(yintercept = n_registrations_python, lty = "dashed") +
  ggplot2::labs(
    title = "Number of learners present",
    caption = paste0("Dashed line: number of registrations = ", n_registrations_python)
  )

ggplot2::ggsave("n_learners_in_time.png", width = 7, height = 4)
