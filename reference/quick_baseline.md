# Fit a Quick Baseline Classification Model

Trains a binary classifier with k-fold cross-validation via caret.

## Usage

``` r
quick_baseline(df, target, method = c("glm", "svmRadial", "rf"), k = 5)
```

## Arguments

- df:

  Data frame with predictors and target column.

- target:

  Name of the binary target column (string).

- method:

  One of "glm", "svmRadial", "rf".

- k:

  Number of CV folds. Default 5.

## Value

A fitted [`caret::train`](https://rdrr.io/pkg/caret/man/train.html)
object.

## Examples

``` r
if (FALSE) { # \dontrun{
iris_bin <- iris[iris$Species != "setosa", ]
iris_bin$Species <- factor(iris_bin$Species)
quick_baseline(iris_bin, target = "Species", method = "glm")
} # }
```
