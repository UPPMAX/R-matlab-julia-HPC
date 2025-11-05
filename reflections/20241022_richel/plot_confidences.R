#!/bin/env Rscript

t_all <- readr::read_csv("20241022_python.csv", show_col_types = FALSE)

testthat::expect_equal(names(t_all)[6],"Overall, how would you rate today's training event?")
names(t_all)[6] <- "grade"

grade_tally <- dplyr::count(dplyr::select(t_all, grade), grade)
mean_grade <- mean(t_all$grade)

ggplot2::ggplot(grade_tally, ggplot2::aes(x = grade, y = n)) + 
  ggplot2::geom_col() +
  ggplot2::labs(
     caption = paste0("Mean grade: ", mean_grade)
  )


t <- dplyr::select(t_all, dplyr::starts_with("I can"))
names(t_confidences)

t[3,4]

# Replace values by numbers
for (row_index in seq_len(nrow(t))) {
  for (col_index in seq_len(ncol(t))) {
    
    value <- as.character(t[row_index, col_index])
    if (value == "I absolutely can do this!") { value <- "5"}
    else if (value == "I have good confidence I can do this") { value <- "4"}
    else if (value == "I have some confidence I can do this") { value <- "3"}
    else if (value == "I have low confidence I can do this") { value <- "2"}
    else if (value == "I have no confidence I can do this") { value <- "1"}
    else if (value == "I have no idea what this is") { value <- "0"}
    else  {
      stop("Unknown value: ", value)
    }
    t[row_index, col_index] <- value
  }
}

t$i <- seq(1, nrow(t))

names(t)
t_tidy <- tidyr::pivot_longer(t, cols = starts_with("I", ignore.case = FALSE))
names(t_tidy)
names(t_tidy) <- c("i", "question", "answer")
t_tidy

n_individuals <- length(unique(t_tidy$i))
n_ratings <- length(t_tidy$answer[!is.na(t_tidy$answer)])

mean_confidence <- mean(t_tidy$answer[!is.na(t_tidy$answer)])

ggplot2::ggplot(t_tidy, ggplot2::aes(x = answer)) +
  ggplot2::geom_histogram() + 
  ggplot2::labs(
    title = "All confidences",
    caption = paste0(
      "#individuals: ", n_individuals, ". ",
      "#ratings: ", n_ratings, ". ",
      "Mean confidence: ", round(mean_confidence, digits = 2)
    )
  )

ggplot2::ggsave(filename = "all_confidences.png", width = 4, height = 2)

ggplot2::ggplot(t_tidy, ggplot2::aes(x = answer)) +
  ggplot2::geom_histogram() + 
  ggplot2::facet_grid(rows = "question", scales = "free_y") +
  ggplot2::theme(
    strip.text.y = ggplot2::element_text(angle = 0),
    legend.position = "none"
  ) +
  ggplot2::labs(
    title = "Confidences per question"
  )

ggplot2::ggsave(filename = "confidences_per_question.png", width = 6, height = 7)

names(t_tidy)

readr::write_csv(x = dplyr::tally(dplyr::group_by(t_tidy, question, answer)), file = "tally.csv")
