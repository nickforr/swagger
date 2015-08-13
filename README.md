<!-- README.md is generated from README.Rmd. Please edit that file -->
![](swagger-logo.png)

swagger is an R package to create API packages from [Swagger.io](http://swagger.io/) JSON specifications.

The following functions are implemented:

-   `swag`: Build an R web API package from a swagger definition

### News

-   Version 0.0.0.9000 released

### Installation

``` r
devtools::install_github("hrbrmstr/swagger")
```

### Usage

``` r
library(swagger)

# current verison
packageVersion("swagger")
#> [1] '0.0.0.9000'
```

### Test Results

``` r
library(swagger)
library(testthat)

date()
#> [1] "Thu Aug 13 17:49:27 2015"

test_dir("tests/")
#> testthat results ========================================================================================================
#> OK: 0 SKIPPED: 0 FAILED: 0
#> 
#> DONE
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
