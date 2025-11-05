#!/bin/env Rscript

read_data <- function() {
  readr::read_csv("20250325_matlab.csv", show_col_types = FALSE)
}

t <- read_data()

#####################################################
# Course rating
#####################################################
ratings <- t |> dplyr::select("Overall, how would you rate today's training event?")
names(ratings) <- "rating"
ggplot2::ggplot(
  ratings, 
  ggplot2::aes(x = rating)
) + ggplot2::geom_histogram() +
  ggplot2::scale_x_continuous(
    limits = c(1, 10),
    breaks = seq(1, 10)
  ) +
  ggplot2::scale_y_continuous(
    name = "Frequency"
  ) +  
  ggplot2::labs(
    title = "Course rating",
    caption = paste0(
      "#individuals: ", nrow(ratings), ". ",
      "#ratings: ", nrow(ratings), ". ",
      "Mean rating: ", round(mean(ratings$rating), digits = 2)
    )
  )
ggplot2::ggsave("course_rating.png", width = 7, height = 7)

#####################################################
# Pace
#####################################################

pace <- t |> dplyr::select(starts_with("What do you think about the pace of teaching overall today?"))
names(pace) <- "pace"
readr::write_lines(pace$pace, "pace.txt")

#####################################################
# Recommend
#####################################################

recommend <- t |> dplyr::select(starts_with("Would you recommend this course to someone else?"))
names(recommend) <- "recommend"
recommend$recommend <- as.factor(recommend$recommend)

ggplot2::ggplot(recommend, ggplot2::aes(x = recommend)) + 
  ggplot2::geom_bar() +
  ggplot2::scale_y_continuous(
    name = "Number of learners"
  ) +
  ggplot2::labs(
    title = "Would you recommend the course?",
    caption = paste0(
      "#individuals: ", nrow(recommend), ". ",
      "#ratings: ", nrow(recommend), ". ",
      "%yes: ", 100 * round(mean(recommend$recommend == "Yes"), digits = 2)
    )
  )

ggplot2::ggsave("recommend.png", width = 7, height = 7)

#####################################################
# Future topics
#####################################################

future_topics <- t |> 
  dplyr::select(starts_with("Which future training topics would you like to be provided by the training host"))
names(future_topics) <- "future_topic"
future_topics <- future_topics |> dplyr::filter(!is.na(future_topic))
readr::write_lines(future_topics$future_topic, "future_topics.txt")

#####################################################
# Other feedback
#####################################################

comments <- t |> 
  dplyr::select(starts_with("Do you have any additional comments?"))
names(comments) <- "comment"
comments <- comments |> dplyr::filter(!is.na(comment))
readr::write_lines(comments$comment, "comments.txt")

#####################################################
# Confidences
#####################################################
t <- read_data()

# Select confidence questions
t <- t |> dplyr::select(dplyr::starts_with("I "))

t <- t |> 
  dplyr::mutate_all(~ replace(., . == "I absolutely can do this!", 5)) |>
  dplyr::mutate_all(~ replace(., . == "I have good confidence I can do this", 4)) |>
  dplyr::mutate_all(~ replace(., . == "I have some confidence I can do this", 3)) |>
  dplyr::mutate_all(~ replace(., . == "I have low confidence I can do this", 2)) |>
  dplyr::mutate_all(~ replace(., . == "I have no confidence I can do this", 1)) |>
  dplyr::mutate_all(~ replace(., . == "I don't know even what this is about ...?", 0)) |>
  dplyr::mutate_all(~ replace(., . == "I did not attend that session", NA)) 
t$i <- seq(1, nrow(t))

t_tidy <- tidyr::pivot_longer(t, cols = starts_with("I", ignore.case = FALSE))
t_tidy <- t_tidy |> dplyr::filter(!is.na(value))
names(t_tidy) <- c("i", "question", "answer")
t_tidy$answer <- as.numeric(t_tidy$answer)

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

average_confidences <- dplyr::group_by(t_tidy, question) |> dplyr::summarise(mean = mean(answer))
  
readr::write_csv(average_confidences, file = "average_confidences.csv")

ggplot2::ggplot(
  average_confidences, ggplot2::aes(y = question, x = mean)) +
  ggplot2::geom_bar(stat = "identity") +
  ggplot2::scale_x_continuous(
    limits = c(0, 5),
    breaks = seq(0.0, 5.0, by = 0.5)
  )

ggplot2::ggsave(filename = "average_confidences_per_question.png", width = 7, height = 7)





t_sessions_taught <- unique(t_tidy$question)

# Cut out sessions if needed

testthat::expect_true(all(t_sessions_taught %in% t_tidy$question))

confidences_on_taught_sessions <- t_tidy |> dplyr::filter(question %in% t_sessions_taught)
success_score <- mean(confidences_on_taught_sessions$answer) / 5.0
readr::write_lines(x = success_score, "success_score.txt")







