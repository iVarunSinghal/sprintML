# Quickly Impute Missing Data

Automatically imputes missing values in a dataset. Numeric columns are
imputed using the median, and categorical columns are imputed using the
mode.

## Usage

``` r
quick_impute(df)
```

## Arguments

- df:

  A data frame containing missing values.

## Value

A clean data frame with no missing values.

## Examples

``` r
messy_df <- data.frame(
  age = c(25, NA, 30, 22),
  city = c("NY", "LA", NA, "NY")
)
clean_df <- quick_impute(messy_df)
#> All missing values have been successfully imputed!
```
