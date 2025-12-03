#' Load and process the insurance data.
#'
#' @param path The path to the csv file containing the raw data
#'
#' @return A data frame containing the insurance data with three new columns:
#' charge_log, categorical_bmi and age_squared
load_and_process_data <- function(path) {
  insurance_data <- read.csv(path)

  insurance_data$charge_log <- log(insurance_data$charges)
  insurance_data$categorical_bmi <- ifelse(insurance_data$bmi > 30, "high", "normal")
  insurance_data$age_squared <- insurance_data$age^2

  insurance_data
}
