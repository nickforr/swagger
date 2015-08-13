noathenb <- function(a, b) {
  if (length(a) > 0) a else b
}

"%||%" <- noathenb

normalize_name <- function(pname) {

  pname <- trimws(pname)
  pname <- gsub("\ +", " ", pname)
  pname <- tolower(pname)
  pname <- gsub("[[:punct:]]*", "", pname)
  pname <- gsub(" ", "_", pname)
  pname

}

