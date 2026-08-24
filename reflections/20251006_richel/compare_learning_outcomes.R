#!/bin/env Rscript


t_1 <- readr::read_csv("../../evaluations/20251006_r/20251006_average_confidences.csv", show_col_types = FALSE)
t_1$average_confidence <- t_1$mean
t_1$mean <- NULL
shared_learning_outcomes <- t_1 |> dplyr::filter(teacher == "RB+RP") |> dplyr::select("learning_outcome") |> dplyr::pull()
t_1 <- t_1 |> dplyr::filter(learning_outcome %in% shared_learning_outcomes)

t_2 <- readr::read_csv("../../evaluations/20250324_r/average_confidence_per_question.csv", show_col_types = FALSE)
#t_2$score_perc <- t_2$average_confidence / 4.0
t_2 <- t_2 |> dplyr::filter(learning_outcome %in% shared_learning_outcomes)
t_2$teacher <- "RB"

t <- dplyr::bind_rows(t_1, t_2)
knitr::kable(t)
