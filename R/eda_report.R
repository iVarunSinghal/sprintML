#' Quick Exploratory Data Analysis Report
#'
#' Prints dataset dimensions, column types, missing-value percentages,
#' and (if a binary target is supplied) class balance.
#'
#' @param df A data frame.
#' @param target Optional name of a binary target column (string).
#'
#' @return Invisibly returns a list of the computed summaries.
#' @export
#'
#' @examples
#' eda_report(mtcars, target = "am")
eda_report <- function(df, target = NULL) {
  stopifnot(is.data.frame(df))

  col_types <- sapply(df, function(x) class(x)[1])
  missing_pct <- round(colMeans(is.na(df)) * 100, 2)

  cat("Dataset dimensions:", nrow(df), "rows x", ncol(df), "columns\n\n")
  cat("Column types:\n"); print(col_types)
  cat("\nMissing values (%):\n"); print(missing_pct[missing_pct > 0])

  balance <- NULL
  if (!is.null(target) && target %in% names(df)) {
    balance <- prop.table(table(df[[target]]))
    cat("\nTarget class balance (", target, "):\n", sep = "")
    print(round(balance * 100, 2))
  }

  invisible(list(dim = c(nrow(df), ncol(df)), col_types = col_types,
                 missing_pct = missing_pct, target_balance = balance))
}
