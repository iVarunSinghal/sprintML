test_that("quick_impute fills numeric NAs", {
  df <- data.frame(x = c(1, 2, NA, 4))
  out <- quick_impute(df)
  expect_false(anyNA(out$x))
})

test_that("quick_impute fills categorical NAs", {
  df <- data.frame(x = factor(c("a", "b", NA, "a")))
  out <- quick_impute(df)
  expect_false(anyNA(out$x))
})

test_that("quick_impute leaves fully complete columns untouched", {
  df <- data.frame(x = c(1, 2, 3))
  out <- quick_impute(df)
  expect_equal(out, df)
})

test_that("quick_impute handles an all-NA column predictably", {
  df <- data.frame(x = c(1, 2, 3), y = c(NA, NA, NA))
  out <- quick_impute(df)
  # Assert your intended behavior here instead of expect_error
  expect_true(is.data.frame(out))
})
