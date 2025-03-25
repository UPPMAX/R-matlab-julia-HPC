#!/bin/env/Rscript

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
max_score <- 4
max_total_score <- n_learners * max_score


testthat::expect_equal(
  t$n_zero + t$n_one + t$n_two + t$n_three + t$n_four + t$n_not_attend,
  rep(n_learners, nrow(t))
)

t$sum <- (1 * t$n_one) + (2 * t$n_two) + (3 * t$n_three) + (4 * t$n_four)
t$success_score <- round(100 * t$sum / max_total_score)
mean(t$success_score)

ggplot2::ggplot(
  t, ggplot2::aes(y = learning_outcome, x = success_score)
) + ggplot2::geom_col() +
  ggplot2::scale_x_continuous(limits = c(0, 100)) +
  ggplot2::labs(
    title = "Learning outcomes for R day at 2025-03-24",
    caption = paste0(
      "Number of learners: ", n_learners, ", ",
      "average success score: ", round(mean(t$success_score))
    )
  )
