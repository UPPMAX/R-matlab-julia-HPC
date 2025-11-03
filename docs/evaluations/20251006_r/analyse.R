#!/bin/env Rscript

#' Get the date of the day that is analysed
get_date <- function() {
  "20251006"
}

#' Read all the data
read_data <- function() {
  readr::read_csv("20251006_r.csv", show_col_types = FALSE)
}

#' Read the confidences in the learning outcome
read_confidences <- function() {
  t_wide <- read_data() |> dplyr::select(tidyselect::starts_with("Give your"))
  names(t_wide) <- stringr::str_remove_all(
    names(t_wide),
    "Give your confidence levels of the following statements\n."
  )

  t_long <- t_wide |> dplyr::select_all() |>
    tidyr::pivot_longer(cols = tidyr::everything())


  t_long$value <- t_long$value |> dplyr::case_match(
      "I can absolutely do this!" ~ "4",
      "I have good confidence I can do this" ~ "3",
      "I have some confidence I can do this" ~ "2",
      "I have low confidence I can do this" ~ "1",
      "I have no confidence I can do this" ~ "0",
      .default = "NA"
    )
  t <- t_long[t_long$value != "NA", ]

  names(t) <- c("learning_outcome", "confidence")
  t$confidence <- as.numeric(t$confidence)
  t
}

get_teacher_per_learning_outcome <- function() {

  tibble::tribble(
    ~teacher, ~learning_outcome,
    "RB", "I can find the module to be able to run R",
    "RB", "I can load the module to be able to run R",
    "RB", "I can run the R interpreter",
    "RB", "I can run the R command to get the list of installed R packages",
    "RB", "I can run an R script from the command-line",
    "BB", "I can find out if an R package is already installed",
    "BB", "I can load the pre-installed R packages",
    "BB", "I can install an R package from CRAN",
    "BB", "I can submit a job to the scheduler to run an R script with regular code",
    "BB", "I can submit a job to the scheduler to run an R script that uses parallel code",
    "BB", "I can start an interactive session",
    "RB+RP", "I can verify I am on the login node yes/no",
    "RB+RP", "I can start an interactive session with multiple cores",
    "RB+RP", "I can start RStudio"
  )
}
get_teacher_per_learning_outcome()

###############################################################
#
###############################################################
t <- read_data()
names(t)
t$`Would you recommend this course to someone else?`


t |> dplyr::select(tidyselect::starts_with("What do you think about the pace"))

readr::write_csv(x = t |> dplyr::select(tidyselect::starts_with("Do you have any additional comments?")), file = "other_feedback.txt")


###############################################################
# Confidences
###############################################################
t <- merge(read_confidences(), get_teacher_per_learning_outcome())

n_individuals <- nrow(read_data())
n_ratings <- nrow(t)

mean_confidence <- mean(t$confidence)

ggplot2::ggplot(t, ggplot2::aes(x = confidence, fill = teacher)) +
  ggplot2::geom_density(alpha = 0.5) +
  ggplot2::labs(
    title = "All confidences",
    caption = paste0(
      "#individuals: ", n_individuals, ". ",
      "#ratings: ", n_ratings, ". ",
      "Mean confidence: ", round(mean_confidence, digits = 2)
    )
  )

ggplot2::ggsave(
  filename = paste0(get_date(), "_all_confidences.png"),
  width = 4,
  height = 2
)

ggplot2::ggplot(t, ggplot2::aes(x = confidence, fill = teacher)) +
  ggplot2::geom_histogram() +
  ggplot2::facet_grid(rows = "learning_outcome", scales = "free_y") +
  ggplot2::theme(
    strip.text.y = ggplot2::element_text(angle = 0),
    legend.position = "none"
  ) +
  ggplot2::labs(
    title = "Confidences per question"
  )

ggplot2::ggsave(filename = paste0(get_date(), "_confidences_per_question.png"), width = 6, height = 7)

average_confidences <- t |>
  dplyr::group_by(learning_outcome, teacher) |>
  dplyr::summarise(mean = mean(confidence))

average_confidences <- average_confidences[order(average_confidences$mean), ]

average_confidences$learning_outcome <- as.factor(average_confidences$learning_outcome)
average_confidences$learning_outcome <- reorder(
  x = average_confidences$learning_outcome,
  X = order(average_confidences$mean),
  decreasing = TRUE
)


readr::write_csv(average_confidences, file = paste0(get_date(), "_average_confidences.csv"))

ggplot2::ggplot(
  average_confidences,
  ggplot2::aes(y = learning_outcome, x = mean, fill = teacher)
) +
  ggplot2::geom_bar(stat = "identity") +
  ggplot2::geom_vline(xintercept = mean_confidence)

ggplot2::ggsave(filename = paste0(get_date(), "_average_confidences_per_question.png"), width = 6, height = 7)

t <- t |> dplyr::filter(teacher == "RB")
success_score <- mean(t$confidence / 5.0)
readr::write_lines(x = success_score, paste0(get_date(), "_success_score_richel.txt"))

average_confidences <- average_confidences |> dplyr::filter(teacher == "RB")

ggplot2::ggplot(
  average_confidences,
  ggplot2::aes(y = learning_outcome, x = mean)
) +
  ggplot2::geom_bar(stat = "identity") +
  ggplot2::geom_vline(xintercept = mean(average_confidences$mean))

ggplot2::ggsave(filename = paste0(get_date(), "_average_confidences_per_question_richel.png"), width = 6, height = 7)
