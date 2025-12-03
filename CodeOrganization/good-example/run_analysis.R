#' Run the analysis and save the analysis outputs to the specified path
#'
#' @param output_path The path to save the output to
#'
#' @return NULL
run_analysis <- function(output_path) {

  df = load_and_process_data("./data/insurance.csv")
  df_with_models = fit_models_and_add_predictions(df)

  make_and_save_boxplots(df_with_models, output_path)
  make_and_save_scatterplots(df_with_models, output_path)
}
