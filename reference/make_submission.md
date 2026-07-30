# Generate a Competition-Ready Submission File

Generate a Competition-Ready Submission File

## Usage

``` r
make_submission(
  model,
  newdata,
  id_values,
  id_col = "id",
  target_name = "target",
  file = "submission.csv"
)
```

## Arguments

- model:

  A fitted model (e.g. from
  [`quick_baseline()`](https://ivarunsinghal.github.io/sprintML/reference/quick_baseline.md)).

- newdata:

  Data frame of test-set predictors.

- id_values:

  Vector of ID values, one per row of `newdata`.

- id_col:

  Name for the ID column in the output. Default "id".

- target_name:

  Name for the prediction column. Default "target".

- file:

  Path to write the CSV to. Default "submission.csv".

## Value

Invisibly returns the submission data frame.

## Examples

``` r
# \donttest{
df <- data.frame(x = rnorm(30), y = factor(sample(c("a", "b"), 30, replace = TRUE)))
train_data <- caret::train(y ~ ., data = df, method = "glm", trControl = caret::trainControl(method = "none"))
make_submission(train_data, newdata = df, id_values = 1:30, file = tempfile())
#> Submission written to: /tmp/Rtmp0o0Ukv/file1a0750b5a082 
# }
```
