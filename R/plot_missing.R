utils::globalVariables(c("column", "pct_missing"))

#' Plot Missing Values by Column
#'
#' @param df A data frame.
#' @return A ggplot2 object.
#' @export
#' @examples
#' plot_missing(airquality)
plot_missing <- function(df) {
  stopifnot(is.data.frame(df))
  plot_df <- data.frame(
    column = names(df),
    pct_missing = as.numeric(colMeans(is.na(df)) * 100)
  )

  ggplot2::ggplot(plot_df, ggplot2::aes(x = stats::reorder(column, pct_missing),
                                        y = pct_missing)) +
    ggplot2::geom_col(fill = "steelblue") +
    ggplot2::coord_flip() +
    ggplot2::labs(x = "Column", y = "% Missing", title = "Missing Values by Column") +
    ggplot2::theme_minimal()
}
