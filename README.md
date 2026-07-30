
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sprintML

<!-- badges: start -->

[![R-CMD-check](https://github.com/iVarunSinghal/sprintML/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/iVarunSinghal/sprintML/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of **`sprintML`** is to help data scientists and hackathon
competitors go from raw data to a strong baseline submission as fast as
possible.

When time is running out in a competition, you don’t want to waste hours
writing boilerplate code for basic exploratory data analysis (EDA) or
model training. `sprintML` provides a seamless pipeline to understand
your data, handle missing values, train cross-validated machine learning
models (like Random Forests and SVMs), and generate perfectly formatted
submission files.

### Key Features

- **`eda_report()`**: Instantly generate summary statistics and
  visualizations.
- **`plot_missing()`**: Visually identify gaps in your dataset.
- **`quick_impute()`**: Automatically rescue messy data by imputing
  missing numerical and categorical values.
- **`quick_baseline()`**: Train a robust, cross-validated baseline model
  with one line of code.
- **`make_submission()`**: Safely generate your final `.csv` predictions
  ready for upload to Kaggle or other platforms.The goal of
  **`sprintML`** is to help data scientists and hackathon competitors go
  from raw data to a strong baseline submission as fast as possible.

When time is running out in a competition, you don’t want to waste hours
writing boilerplate code for basic exploratory data analysis (EDA) or
model training. `sprintML` provides a seamless pipeline to understand
your data, handle missing values, train cross-validated machine learning
models (like Random Forests and SVMs), and generate perfectly formatted
submission files.

### Key Features

- **`eda_report()`**: Instantly generate summary statistics and
  visualizations.
- **`plot_missing()`**: Visually identify gaps in your dataset.
- **`quick_impute()`**: Automatically rescue messy data by imputing
  missing numerical and categorical values.
- **`quick_baseline()`**: Train a robust, cross-validated baseline model
  with one line of code.
- **`make_submission()`**: Safely generate your final `.csv` predictions
  ready for upload to Kaggle or other platforms.

## Installation

You can install the development version of sprintML from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("iVarunSinghal/sprintML")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(sprintML)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" alt="" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
