#!/bin/env Rscript
t <- readr::read_csv("20241024_counts.csv")
t$n_total <- t$n_cam_on + t$n_cam_off
t$f_on <- t$n_cam_on / t$n_total
n_registrations_r <- 35

simultaneous_session_time <- tibble::tribble(
  ~session, ~xmin, ~xmax,
  "UPPMAX", readr::parse_time("14:30"), readr::parse_time("15:15")
)
simultaneous_session_time$ymin <- 0
simultaneous_session_time$ymax <- n_registrations_r

ggplot2::ggplot(t, ggplot2::aes(x = time, y = n_total, color = f_on)) + 
  ggplot2::geom_point(size = 5) + 
  ggplot2::geom_rect(
    data = simultaneous_session_time, 
    inherit.aes = FALSE,
    ggplot2::aes(
      xmin = xmin,
      xmax = xmax,
      ymin = ymin,
      ymax = ymax,
      fill = session
    ),
    alpha = 0.2
  ) +
  ggplot2::scale_y_continuous(
    "Number of learners",
    limits = c(0, n_registrations_r)
  ) +
  ggplot2::geom_hline(yintercept = n_registrations_r, lty = "dashed") +
  ggplot2::scale_color_binned(type = "viridis") +
  ggplot2::labs(
    title = "Number of learners present",
    caption = paste0("Dashed line: number of registrations = ", n_registrations_r)
  )

ggplot2::ggsave("n_learners_in_time.png", width = 7, height = 4)
