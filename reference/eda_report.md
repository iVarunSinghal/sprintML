# Quick Exploratory Data Analysis Report

Prints dataset dimensions, column types, missing-value percentages, and
(if a binary target is supplied) class balance.

## Usage

``` r
eda_report(df, target = NULL)
```

## Arguments

- df:

  A data frame.

- target:

  Optional name of a binary target column (string).

## Value

Invisibly returns a list of the computed summaries.

## Examples

``` r
eda_report(mtcars, target = "am")
#> Dataset dimensions: 32 rows x 11 columns
#> 
#> Column types:
#>       mpg       cyl      disp        hp      drat        wt      qsec        vs 
#> "numeric" "numeric" "numeric" "numeric" "numeric" "numeric" "numeric" "numeric" 
#>        am      gear      carb 
#> "numeric" "numeric" "numeric" 
#> 
#> Missing values (%):
#> named numeric(0)
#> 
#> Target class balance (am):
#> 
#>     0     1 
#> 59.38 40.62 
```
