#!/bin/env Rscript

read_r_confidences <- function() {
  readr::read_csv("../20250324_r/average_confidence_per_question.csv", show_col_types = FALSE)
}
read_matlab_confidences <- function() {
  readr::read_csv("../20250325_matlab/average_confidences.csv", show_col_types = FALSE)
}
read_julia_confidences <- function() {
  readr::read_csv("../20250326_julia/average_confidences.csv", show_col_types = FALSE)
}
get_r_condidences <- function() {
  t <- read_r_confidences()
  names(t) <- c("learning_outcomes", "average_confidence")
  t$course <- "R"
  t
}
get_matlab_condidences <- function() {
  t <- read_matlab_confidences()
  names(t) <- c("learning_outcomes", "average_confidence")
  t$course <- "MATLAB"
  t
}
get_julia_condidences <- function() {
  t <- read_julia_confidences()
  names(t) <- c("learning_outcomes", "average_confidence")
  t$course <- "Julia"
  t  
}
get_condidences <- function() {
  dplyr::bind_rows(
    get_r_condidences(), 
    get_matlab_condidences(), 
    get_julia_condidences()
  )
}

t <- get_condidences()
average_average_confidence <- mean(t$average_confidence)
t$average_confidence <- round(t$average_confidence, digits = 2)
t <- t |> dplyr::arrange(average_confidence)
t$learning_outcomes <- as.factor(t$learning_outcomes)
t$learning_outcomes <- reorder(
  x = t$learning_outcomes, 
  X = order(t$average_confidence),
  decreasing = TRUE
)
readr::write_csv(t, "confidences_course.csv")


ggplot2::ggplot(t, 
  ggplot2::aes(
    x = average_confidence, 
    y = learning_outcomes,
    fill = course
  )
) +
  ggplot2::geom_col() +
  ggplot2::geom_vline(xintercept = average_average_confidence, lty = "dashed") +
  ggplot2::theme(
    strip.text.y = ggplot2::element_text(angle = 0),
    legend.position = "bottom"
  ) +
  ggplot2::labs(
    title = "Confidences per question",
    caption = paste0(
      " Dashed line denotes the average at ", round(average_average_confidence, digits = 2)
    )
  )

ggplot2::ggsave(filename = "confidences_per_question.png", width = 7, height = 7)
