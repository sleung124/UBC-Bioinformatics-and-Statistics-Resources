#' Make and save all boxplots to a folder called "figures" in the save_path
#'
#' @param data A data frame containing the insurance data
#' @param save_path The directory in which to create the "figures" subfolder
#'   and save the resulting PNG files.
#'
#' @return NULL
make_and_save_boxplots <- function(data, save_path) {

  fig_dir <- file.path(save_path, "figures")
  if (!dir.exists(fig_dir)) dir.create(fig_dir, recursive = TRUE)

  make_charges_boxplot(data, "bmi_bin", fig_dir)
  make_charges_boxplot(data, "region", fig_dir)
  make_charges_boxplot(data, "sex", fig_dir)
  make_charges_boxplot(data, "age_bin", fig_dir)
}

#' Create and save a single boxplot to a specified directory
#'
#' @param data A data frame containing the insurance data
#' @param categorical_var The name of the categorical variable to plot charges against
#' @param fig_dir The directory where the resulting PNG file should be saved
#'
#' @return NULL
make_charges_boxplot <- function(data, categorical_var, fig_dir) {
  library(ggplot2)

  plot <- ggplot(data, aes(categorical_var, charges)) +
    geom_boxplot() +
    ggtitle(paste("Charges by", categorical_var))

  filename <- paste0("charges_by_", categorical_var, ".png")

  ggsave(file.path(fig_dir, filename), plot, width = 6, height = 4)
}



