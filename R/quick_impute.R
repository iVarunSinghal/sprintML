#' Quickly Impute Missing Data
#'
#' Automatically imputes missing values in a dataset. Numeric columns are imputed
#' using the median, and categorical columns are imputed using the mode.
#'
#' @param df A data frame containing missing values.
#' @return A clean data frame with no missing values.
#' @export
#'
#' @examples
#' messy_df <- data.frame(
#'   age = c(25, NA, 30, 22),
#'   city = c("NY", "LA", NA, "NY")
#' )
#' clean_df <- quick_impute(messy_df)
#'
quick_impute <- function(df) {
  # Loop through every column in the dataset
  for (col in names(df)) {
    if (is.numeric(df[[col]])) {
      # For numbers: fill NAs with the median
      col_median <- stats::median(df[[col]], na.rm = TRUE)
      df[[col]][is.na(df[[col]])] <- col_median

    } else {
      # For text/factors: fill NAs with the most frequent value (mode)
      freq_table <- sort(table(df[[col]]), decreasing = TRUE)
      if (length(freq_table) > 0) {
        mode_val <- names(freq_table)[1]
        df[[col]][is.na(df[[col]])] <- mode_val
      }
    }
  }

  message("All missing values have been successfully imputed!")
  return(df)
}
