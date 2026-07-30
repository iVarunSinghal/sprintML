#' Fit a Quick Baseline Classification Model
#'
#' Trains a binary classifier with k-fold cross-validation via caret.
#'
#' @param df Data frame with predictors and target column.
#' @param target Name of the binary target column (string).
#' @param method One of "glm", "svmRadial", "rf".
#' @param k Number of CV folds. Default 5.
#'
#' @return A fitted `caret::train` object.
#' @export
#'
#' @examples
#' \dontrun{
#' iris_bin <- iris[iris$Species != "setosa", ]
#' iris_bin$Species <- factor(iris_bin$Species)
#' quick_baseline(iris_bin, target = "Species", method = "glm")
#' }
quick_baseline <- function(df, target, method = c("glm", "svmRadial", "rf"), k = 5) {
  method <- match.arg(method)
  if (!(target %in% names(df))) {
    stop(
      sprintf("Column '%s' was not found in df. Available columns: %s",
              target, paste(names(df), collapse = ", ")),
      call. = FALSE
    )
  }

  if (!is.factor(df[[target]])) {
    df[[target]] <- as.factor(df[[target]])
  }

  if (nlevels(df[[target]]) != 2) {
    stop(
      sprintf("quick_baseline() only supports binary targets. '%s' has %d levels.",
              target, nlevels(df[[target]])),
      call. = FALSE
    )
  }

  ctrl <- caret::trainControl(method = "cv", number = k,
                              classProbs = TRUE,
                              summaryFunction = caret::twoClassSummary)

  formula <- stats::as.formula(paste(target, "~ ."))
  model <- caret::train(formula, data = df, method = method,
                        trControl = ctrl, metric = "ROC")
  print(model)
  model
}
