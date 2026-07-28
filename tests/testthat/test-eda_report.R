test_that("eda_report returns expected structure", {
  res <- eda_report(mtcars, target = "am")
  expect_type(res, "list")
  expect_equal(res$dim, c(nrow(mtcars), ncol(mtcars)))
})
