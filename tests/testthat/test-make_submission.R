test_that("make_submission writes a file with correct columns", {
  df <- data.frame(x = rnorm(20), y = factor(sample(c("a", "b"), 20, replace = TRUE)))
  model <- caret::train(y ~ x, data = df, method = "glm", trControl = caret::trainControl(method = "none"))
  tmp <- tempfile(fileext = ".csv")
  make_submission(model, newdata = df, id_values = 1:20, file = tmp)
  expect_true(file.exists(tmp))
  res <- read.csv(tmp)
  expect_named(res, c("id", "target"))
})
