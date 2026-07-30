test_that("quick_baseline errors informatively on a missing target", {
  expect_error(quick_baseline(mtcars, target = "not_a_col"), "was not found")
})

test_that("quick_baseline errors on a non-binary target", {
  df <- data.frame(x = rnorm(30), y = factor(sample(letters[1:3], 30, replace = TRUE)))
  expect_error(quick_baseline(df, target = "y"), "binary targets")
})

test_that("quick_baseline works across all three methods", {
  df <- data.frame(x1 = rnorm(60), x2 = rnorm(60), y = factor(sample(c("a", "b"), 60, replace = TRUE)))
  for (m in c("glm", "svmRadial", "rf")) {
    expect_s3_class(quick_baseline(df, target = "y", method = m, k = 3), "train")
  }
})

test_that("make_submission errors on mismatched lengths", {
  df <- data.frame(x = rnorm(10), y = factor(sample(c("a", "b"), 10, replace = TRUE)))
  model <- caret::train(y ~ ., data = df, method = "glm", trControl = caret::trainControl(method = "none"))
  expect_error(make_submission(model, newdata = df, id_values = 1:5), "must match")
})
