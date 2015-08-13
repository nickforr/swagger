#' Build an R web API package from a swagger definition
#'
#' @param spec URL or path to swagger JSON specification
#' @param pkg_name name for the package. if \code{NULL} it will be derived
#'        from the \code{"title"} field in the \code{info} section of the
#'        swagger description.
#' @param target_dir where to put the package. a temp dir will be used if none
#'        is provided
#' @param overwrite should we overwrite \code{target_dir} if it exists? (default: \code{FALSE})
#' @return path to the newly created package path
#' @export
swag <- function(spec, pkg_name=NULL, target_dir="/Users/bob/test", overwrite=FALSE) {

  # we're going to be using this variable _alot_, hence the tiny name
  g <- fromJSON(spec)

  pkg_name <- pkg_name %||% normalize_name(g$info$title)

  message(sprintf("Creating package %s...", pkg_name))

  pkg_dir <- target_dir %||% tempfile()
  pkg_dir <- paste(pkg_dir, pkg_name, sep="/")

  message("  - creating package directory structure...")

  dir.create(pkg_dir, showWarnings=FALSE, recursive=TRUE)
  dir.create(paste(pkg_dir, "man", sep="/"), showWarnings=FALSE)
  dir.create(paste(pkg_dir, "R", sep="/"), showWarnings=FALSE)

  g[["RSWAG"]] <- list(pkg_dir=pkg_dir, pkg_name=pkg_name)

  swag_desc(g) %>%
    swag_readme() %>%
    swag_pkg() %>%
    swag_tags()

}
