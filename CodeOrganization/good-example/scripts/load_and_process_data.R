#' Load and process the insurance data.
#'
#' @param path The path to the csv file containing the raw data
#'
#' @return A data frame with the data from the csv, with two new columns for bmi and age bins
load_and_process_data <- function(path) {
  insurance_data <- read.csv(path)

  insurance_data$bmi_bin <- ifelse(insurance_data$bmi > 30, "high", "normal")
  insurance_data$age_bin <- cut(
    insurance_data$age,
    breaks = seq(0, 100, by = 10),
    labels = c("0-9","10-19","20-29","30-39","40-49","50-59","60-69","70-79","80-89","90-99"),
    right = FALSE,
    include.lowest = TRUE
  )

  insurance_data
}
