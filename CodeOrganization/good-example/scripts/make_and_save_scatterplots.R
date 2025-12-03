#' Make and save all scatter plots to a folder called "figures" in the save_path
#'
#' @param data A data frame containing the insurance data
#' @param save_path The directory in which to create the "figures" subfolder
#'   and save the resulting PNG files.
#'
#' @return NULL
make_and_save_scatterplots <- function(data, save_path) {
  library(ggplot2)

  fig_dir <- file.path(save_path, "figures")
  if (!dir.exists(fig_dir)) dir.create(fig_dir, recursive = TRUE)

  # Model 1
  model1 <- ggplot(data, aes(model1_predictions, charges)) +
    geom_point() +
    geom_abline(intercept=0, slope=1) +
    ggtitle("Predicted vs Actual (Model 1)")

  ggsave(file.path(fig_dir, "model_1_scatterplot.png"), model1, width=6, height=4)


  # Model 2
  model2 <- ggplot(data, aes(model2_predictions, charges)) +
    geom_point() +
    geom_abline(intercept=0, slope=1) +
    ggtitle("Predicted vs Actual (Model 2)")

  ggsave(file.path(fig_dir, "model_2_scatterplot.png"), model2, width=6, height=4)
}
