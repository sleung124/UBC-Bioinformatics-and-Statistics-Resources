#' Fit linear regression models to the insurance data and save the predictions to the data frame
#'
#' @param data A data frame containing the insurance data
#'
#' @return A data fame with the same data, and two new columns for the model predictions
fit_models_and_add_predictions <- function(data) {
  model1 <- lm(charges ~ age, data = data)
  model2 <- lm(charges ~ age + bmi + children + smoker, data = data)

  data$model1_predictions <- predict(model1)
  data$model2_predictions <- predict(model2)

  data
}
