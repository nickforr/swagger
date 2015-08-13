swag_tags <- function(g) {

  for (ops in names(g$paths)) {
    for (op in names(g$paths[[ops]])) {

      node <- g$paths[[ops]][[op]]
      fil <- paste(myg$RSWAG$pkg_dir, "R", sprintf("%s.r", node$operationId), sep="/")
      message(sprintf("  - creating %s...", fil))

      cat("# Generaged with swagger: edits may be overwritten if you re-generate the package\n\n", file=fil)
      cat(sprintf("#' @title %s\n", node$summary), file=fil, append=TRUE)

      if (node$description != "") {
        cat(sprintf("#' @description \n", node$description), file=fil, append=TRUE)
      }

      for (param in node$parameters$name) {
        cat(sprintf("#' @param %s %s\n",
                    param,
                    node$parameters[node$parameters$name==param, "description"]),
            file=fil, append=TRUE)
      }

      cat("#' @export\n", file=fil, append=TRUE)
      cat(sprintf("%s <- function(%s) {\n\n",
                  node$operationId,
                  paste(node$parameters$name, collapse=", ")), file=fil, append=TRUE)

      base_url <- sprintf("%s//%s%s", g$schemes[1], g$host, g$basePath)

      cat(sprintf("  res <- %s('%s')\n",
                  toupper(op),
                  base_url), file=fil, append=TRUE)

      cat("\n}\n", file=fil, append=TRUE)

    }
  }

  invisible(g)

}
