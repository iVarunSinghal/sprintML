# sprintML

Quick EDA, one-line baseline models, and submission-ready CSVs for binary classification hackathons and data science competitions.

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)

## Why sprintML?

Most binary-classification competitions follow the same three moves: explore the data, fit a baseline model, and generate a submission file in the platform's expected format. `sprintML` wraps that workflow into four functions, so you spend less time on boilerplate and more time on feature engineering and tuning.

## Installation

`sprintML` isn't on CRAN yet — install the development version straight from GitHub:

```r
install.packages("remotes")
remotes::install_github("iVarunSinghal/sprintML")
```

## Quick start

```r
library(sprintML)

# Explore a dataset
eda_report(mtcars, target = "am")

# Visualize missingness
plot_missing(airquality)

# Fit a cross-validated baseline classifier
iris_bin <- iris[iris$Species != "setosa", ]
iris_bin$Species <- factor(iris_bin$Species)
model <- quick_baseline(iris_bin, target = "Species", method = "glm")

# Generate a submission file
make_submission(model, newdata = iris_bin, id_values = 1:nrow(iris_bin),
                 file = "submission.csv")
```

## Functions

| Function | What it does |
|---|---|
| `eda_report(df, target)` | Prints dataset dimensions, column types, missing-value %, and target class balance |
| `plot_missing(df)` | Bar chart of missing values by column |
| `quick_baseline(df, target, method, k)` | Cross-validated baseline classifier — logistic regression, SVM, or random forest |
| `make_submission(model, newdata, id_values, ...)` | Writes a competition-ready two-column CSV |

## Roadmap

- [ ] Clean `devtools::check()` run (0 errors / 0 warnings / 0 notes)
- [ ] GitHub Actions CI (`usethis::use_github_action("check-standard")`)
- [ ] List on [R-universe](https://r-universe.dev)
- [ ] Submit to CRAN

## Contributing

Issues and pull requests are welcome — open one on the [Issues tab](https://github.com/iVarunSinghal/sprintML/issues).

## License

MIT © Varun Singhal
