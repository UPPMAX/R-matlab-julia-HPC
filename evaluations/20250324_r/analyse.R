#!/bin/env Rscript


###############################################################
# Confidences
###############################################################
setwd("GitHubs/R-matlab-julia-HPC/docs/evaluations/20250324_r")
t <- readr::read_csv("learning_outcomes.csv")

t <- readr::read_delim("learning_outcomes.csv", delim = "|")
names(t)
names(t) <- c(
  "learning_outcome", "n_zero", "n_one", "n_two", "n_three", "n_four",
  "n_not_attend"
)
t
t$n_zero <- as.numeric(t$n_zero)
t$n_one <- as.numeric(t$n_one)
t$n_two <- as.numeric(t$n_two)
t$n_three <- as.numeric(t$n_three)
t$n_four <- as.numeric(t$n_four)
t$n_not_attend <- as.numeric(t$n_not_attend)

n_learners <- (t$n_zero + t$n_one + t$n_two + t$n_three + t$n_four + t$n_not_attend)[1]
testthat::expect_equal(8, n_learners)
max_score <- 4
max_total_score <- n_learners * max_score


testthat::expect_equal(
  t$n_zero + t$n_one + t$n_two + t$n_three + t$n_four + t$n_not_attend,
  rep(n_learners, nrow(t))
)

t$sum <- (1 * t$n_one) + (2 * t$n_two) + (3 * t$n_three) + (4 * t$n_four)

t$success_score <- round(100 * t$sum / max_total_score)
t$average_confidence <- round(4 * t$sum / max_total_score, digits = 2)

readr::write_csv(
  t |> dplyr::select(learning_outcome, average_confidence),
  file = "average_confidence_per_question.csv"
)

t <- t |> dplyr::arrange(average_confidence)
t$learning_outcome <- as.factor(t$learning_outcome)
t$learning_outcome <- reorder(
  x = t$learning_outcome,
  X = order(t$average_confidence),
  decreasing = TRUE
)

average_average_confidence <- round(mean(t$average_confidence), digits = 2)

ggplot2::ggplot(
  t, ggplot2::aes(y = learning_outcome, x = average_confidence)
) + ggplot2::geom_col() +
  ggplot2::geom_vline(xintercept = average_average_confidence, lty = "dashed") +
  ggplot2::scale_x_continuous(
    name = "Confidence (from 0 to 4)", limits = c(0, 4)
  ) +
  ggplot2::labs(
    title = "Learning outcomes for R day at 2025-03-24",
    caption = paste0(
      "Number of learners: ", n_learners, ", ",
      "Success score: ", round(mean(t$success_score)), " ",
      "Dashed line: average (", average_average_confidence, "/4.0)"
    )
  )

ggplot2::ggsave(
  "average_confidence_per_question.png",
  width = 7, height = 7
)
