swag_pkg <- function(g) {

  message("  - generating pacakge R file")

  g$RSWAG$PKGR <- paste(g$RSWAG$pkg_dir, "R", sprintf("%s-package.r", g$RSWAG$pkg_name), sep="/")

  pkgr <- "#' %s
#'
#' %s
#'
#' @name %s
#' @docType package
#' @author Jane Doe
#' @import httr
NULL
"
  writeLines(sprintf(pkgr, g$info$title, g$info$description, g$RSWAG$pkg_name),
             g$RSWAG$PKGR)

  invisible(g)

}
