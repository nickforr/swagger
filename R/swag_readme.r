swag_readme <- function(g) {

  message("  - generating README.Rmd")

  g$RSWAG$README <- paste(g$RSWAG$pkg_dir, "README.Rmd", sep="/")

  rdme <- '---
output:
  md_document:
    variant: markdown_github
---

<!-- README.md is generated from README.Rmd. Please edit that file -->

```{r, echo = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)
```
*GENERATED WITH swagger*

### Pacakge %s - R API wrapper for [%s](http://%s/)

%s

LICENSE: [%s]

NOTE: %s / %s
'

  writeLines(sprintf(rdme, g$RSWAG$pkg_name, g$info$title, g$host, g$info$description,
                   g$info$license$name, g$info$license$url, g$externalDocs$description,
                   g$externalDocs$url), g$RSWAG$README)

  invisible(g)

}
