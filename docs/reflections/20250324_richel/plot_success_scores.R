#!/bin/env Rscript
t <- readr::read_csv("20250324_counts.csv", show_col_types = FALSE)
t$n_total <- t$n_cam_on + t$n_cam_off
t$f_cam_on <- t$n_cam_on / t$n_total
n_registrations_python <- 33


ggplot2::ggplot(t, ggplot2::aes(x = time, y = n_total)) + 
  ggplot2::geom_line() + 
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

ggplot2::ggplot(t, ggplot2::aes(x = time, y = f_cam_on)) + 
  ggplot2::geom_point() + 
  ggplot2::geom_line() + 

  ggplot2::scale_x_time(
    limits = c(
      readr::parse_time("9:00"),
      readr::parse_time("16:00")
    )
  ) +
  ggplot2::scale_y_continuous(
    "Learners with camera on",
    limits = c(0, 1),
    labels = scales::percent
  ) +
  ggplot2::annotate(
    "rect", 
    xmin =  readr::parse_time("10:00"),
    xmax =  readr::parse_time("11:00"),
    ymin = 0.0,
    ymax = 1.0,
    alpha = 0.1,
    fill = "green"
  ) +
  ggplot2::annotate(
    "rect", 
    xmin =  readr::parse_time("14:50"),
    xmax =  readr::parse_time("15:35"),
    ymin = 0.0,
    ymax = 1.0,
    alpha = 0.1,
    fill = "yellow"
  ) +
  ggplot2::labs(
    title = "Percentage of learners with camera on",
    labs = "Green: unrecorded session, yellow: partially unrecorded",
  )

ggplot2::ggsave("f_learners_with_cam_on_in_time.png", width = 7, height = 4)

