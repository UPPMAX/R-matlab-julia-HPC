#!/bin/env Rscript


###############################################################
# Confidences
###############################################################
confidences <- readr::read_csv(
  "../../evaluations/20250324_r/average_confidence_per_question.csv",
  show_col_types = FALSE
)
names(t)
notes <- readr::read_csv(
  "learning_outcomes_notes.csv",
  show_col_types = FALSE
)

t <- merge(confidences, notes) |> dplyr::arrange(average_confidence)
t$learning_outcome <- as.factor(t$learning_outcome)
t$learning_outcome <- reorder(
  x = t$learning_outcome,
  X = order(t$average_confidence),
  decreasing = TRUE
)

average_average_confidence <- round(mean(t$average_confidence), digits = 2)
names(t)

ggplot2::ggplot(
  t,
  ggplot2::aes(
    y = learning_outcome,
    x = average_confidence,
    fill = teacher,
    color = content_type)
) + ggplot2::geom_col(size = 2) +
  ggplot2::geom_vline(xintercept = average_average_confidence, lty = "dashed") +
  ggplot2::scale_x_continuous(
    name = "Confidence (from 0 to 4)", limits = c(0, 4)
  ) +
  ggplot2::labs(
    title = "Learning outcomes for R day at 2025-03-24",
    caption = paste0(
      "Dashed line: average (", average_average_confidence, "/4.0)"
    )
  )

ggplot2::ggsave(
  "average_confidence_per_setting.png",
  width = 7, height = 7
)
