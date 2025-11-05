t <- readr::read_csv("participants.csv", show_col_types = FALSE)
expected_names <- c("operating_system", "r", "python", "julia", "matlab", "hpc2n", "uppmax", "lunarc")
testthat::expect_equal(names(t), expected_names)
t$operating_system <- as.factor(t$operating_system)
n_learners <- nrow(t)

# Operating systems
os_tally <- dplyr::tally(dplyr::group_by(t, operating_system))
os_tally$f_perc <- 100.0 * os_tally$n / sum(os_tally$n)

ggplot2::ggplot(os_tally, ggplot2::aes(x = operating_system, y = f_perc)) + 
  ggplot2::geom_col() +
  ggplot2::theme(
    axis.text.x = ggplot2::element_text(
      angle = 90, vjust = 0.5, hjust = 1
    )
  )

# Which center
t_center <- tibble::as_tibble(!is.na(dplyr::select(t, hpc2n, lunarc, uppmax)))
testthat::expect_equal(n_learners, nrow(t_center))

n_with_center <- sum(rowSums(t_center) > 0)
n_centers_learners_use <- sum(rowSums(t_center))
n_without_center <- sum(rowSums(t_center) == 0)
testthat::expect_equal(n_learners, n_with_center + n_without_center)

t_center$id <- seq(1, nrow(t_center))
ids_hpc2n <- t_center$id[which(t_center$hpc2n)]
ids_lunarc <- t_center$id[which(t_center$lunarc)]
ids_uppmax <- t_center$id[which(t_center$uppmax)]
n_ids <- length(ids_hpc2n) + length(ids_lunarc) + length(ids_uppmax)
testthat::expect_equal(n_centers_learners_use, n_ids)

center_distribution <- list(
  hpc2n = ids_hpc2n,
  lunarc = ids_lunarc,
  uppmax = ids_uppmax
)
ggVennDiagram::ggVennDiagram(center_distribution)
ggplot2::ggsave("centers_venn.png", width = 4, height = 4)

## Which languages

t_language <- tibble::as_tibble(!is.na(dplyr::select(t, julia, matlab, python, r)))
testthat::expect_equal(n_learners, nrow(t_language))

n_with_language <- sum(rowSums(t_language) > 0)
n_languages_learners_follow <- sum(rowSums(t_language))
n_without_language <- sum(rowSums(t_language) == 0)
testthat::expect_equal(n_learners, n_with_language + n_without_language)

t_language$id <- seq(1, nrow(t_language))
ids_julia <- t_language$id[which(t_language$julia)]
ids_matlab <- t_language$id[which(t_language$matlab)]
ids_python <- t_language$id[which(t_language$python)]
ids_r <- t_language$id[which(t_language$r)]
n_ids <- length(ids_julia) + length(ids_matlab) + length(ids_python) + length(ids_r)
testthat::expect_equal(n_languages_learners_follow, n_ids)

language_distribution <- list(
  julia = ids_julia,
  matlab = ids_matlab,
  python = ids_python,
  r = ids_r
)
ggVennDiagram::ggVennDiagram(language_distribution)
ggplot2::ggsave("languages_venn.png", width = 4, height = 4)

t_learners_per_language <- tibble::tribble(
  ~language, ~n,
  "julia", sum(t_language$julia),
  "matlab", sum(t_language$matlab),
  "python", sum(t_language$python),
  "r", sum(t_language$r)
)
t_learners_per_language$language <- as.factor(t_learners_per_language$language)

ggplot2::ggplot(t_learners_per_language, ggplot2::aes(x = language, y = n)) +
  ggplot2::geom_col() + 
  ggplot2::geom_text(
    label = t_learners_per_language$n,
    vjust = -0.5
  )
ggplot2::ggsave("n_learners_per_language.png", width = 4, height = 4)
