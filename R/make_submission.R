#' Generate a Competition-Ready Submission File
#'
#' @param model A fitted model (e.g. from `quick_baseline()`).
#' @param newdata Data frame of test-set predictors.
#' @param id_values Vector of ID values, one per row of `newdata`.
#' @param id_col Name for the ID column in the output. Default "id".
#' @param target_name Name for the prediction column. Default "target".
#' @param file Path to write the CSV to. Default "submission.csv".
#'
#' @return Invisibly returns the submission data frame.
#' @export
#'
#' @examples
#' \donttest{
#' df <- data.frame(x = rnorm(30), y = factor(sample(c("a", "b"), 30, replace = TRUE)))
#' train_data <- caret::train(y ~ ., data = df, method = "glm", trControl = caret::trainControl(method = "none"))
#' make_submission(train_data, newdata = df, id_values = 1:30, file = tempfile())
#' }
make_submission <- function(model, newdata, id_values, id_col = "id",
                            target_name = "target", file = "submission.csv") {

  if (length(id_values) != nrow(newdata)) {
    stop(
      sprintf("id_values has length %d but newdata has %d rows. They must match.",
              length(id_values), nrow(newdata)),
      call. = FALSE
    )
  }

  preds <- stats::predict(model, newdata = newdata)
  submission <- data.frame(id_values, preds)
  names(submission) <- c(id_col, target_name)
  utils::write.csv(submission, file, row.names = FALSE)
  cat("Submission written to:", file, "\n")
  invisible(submission)
}
