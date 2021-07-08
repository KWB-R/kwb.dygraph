[![R-CMD-check](https://github.com/KWB-R/kwb.dygraph/workflows/R-CMD-check/badge.svg)](https://github.com/KWB-R/kwb.dygraph/actions?query=workflow%3AR-CMD-check)
[![pkgdown](https://github.com/KWB-R/kwb.dygraph/workflows/pkgdown/badge.svg)](https://github.com/KWB-R/kwb.dygraph/actions?query=workflow%3Apkgdown)
[![codecov](https://codecov.io/github/KWB-R/kwb.dygraph/branch/main/graphs/badge.svg)](https://codecov.io/github/KWB-R/kwb.dygraph)
[![Project Status](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/kwb.dygraph)]()

# kwb.dygraph

Additional functions to be used with dygraph-objects e.g.
shading of areas or drawing of lines representing time periods within
events (given by begin and end times).

## Installation

For details on how to install KWB-R packages checkout our [installation tutorial](https://kwb-r.github.io/kwb.pkgbuild/articles/install.html).

```r
### Optionally: specify GitHub Personal Access Token (GITHUB_PAT)
### See here why this might be important for you:
### https://kwb-r.github.io/kwb.pkgbuild/articles/install.html#set-your-github_pat

# Sys.setenv(GITHUB_PAT = "mysecret_access_token")

# Install package "remotes" from CRAN
if (! require("remotes")) {
  install.packages("remotes", repos = "https://cloud.r-project.org")
}

# Install KWB package 'kwb.dygraph' from GitHub
remotes::install_github("KWB-R/kwb.dygraph")
```

## Documentation

Release: [https://kwb-r.github.io/kwb.dygraph](https://kwb-r.github.io/kwb.dygraph)

Development: [https://kwb-r.github.io/kwb.dygraph/dev](https://kwb-r.github.io/kwb.dygraph/dev)
