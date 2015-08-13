
swag_desc <- function(g) {

  message("  - generating DESCRIPTION")

  g$RSWAG$DESCRIPTION <- paste(g$RSWAG$pkg_dir, "DESCRIPTION", sep="/")

  write.dcf(data.frame(
    Package=g$RSWAG$pkg_name,
    Title=g$info$title,
    Version=g$info$version,
    Author="Jane Doe",
    Maintainer="Jane Doe <jane.doe@example.com>",
    Description=g$info$description,
    Depends="R (>=3.0.0)",
    License=g$info$license$name,
    Imports="httr"
  ), file=g$RSWAG$DESCRIPTION)


  invisible(g)

}
