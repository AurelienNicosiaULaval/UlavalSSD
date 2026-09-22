# Maintainer-only validation, excluded from the package by .Rbuildignore.
check_source_archive <- function(archive) {
  stopifnot(length(archive) == 1L, file.exists(archive))
  if (!requireNamespace("xml2", quietly = TRUE)) {
    stop("Install xml2 so R inspects README and HTML links.", call. = FALSE)
  }
  entries <- utils::untar(archive, list = TRUE)
  if (any(grepl("(^/|(^|/)\\.\\.(/|$))", entries)) ||
      !all(startsWith(entries, "UlavalSSD/"))) {
    stop("Unexpected paths in source archive.", call. = FALSE)
  }
  destination <- tempfile("source-archive-")
  dir.create(destination)
  on.exit(unlink(destination, recursive = TRUE), add = TRUE)
  utils::untar(archive, exdir = destination)
  package <- file.path(destination, "UlavalSSD")
  variable <- "_R_CHECK_CRAN_INCOMING_CHECK_FILE_URIS_"
  previous <- Sys.getenv(variable, unset = NA_character_)
  on.exit({
    if (is.na(previous)) Sys.unsetenv(variable) else {
      do.call(Sys.setenv, stats::setNames(list(previous), variable))
    }
  }, add = TRUE)
  Sys.setenv("_R_CHECK_CRAN_INCOMING_CHECK_FILE_URIS_" = "true")
  # Reuse R's incoming checker. The full CI checks also validate remote URLs.
  incoming <- getFromNamespace(".check_package_CRAN_incoming", "tools")
  result <- incoming(package, localOnly = TRUE)
  if (length(result$bad_file_URIs)) {
    print(result$bad_file_URIs)
    stop("Broken file URIs in the built source archive.", call. = FALSE)
  }
  if (length(result$bad_urls) || length(result$Rd_db_build_error)) {
    print(result)
    stop("Malformed links or unreadable help in the archive.", call. = FALSE)
  }
  message("Source archive: README, help and HTML file URIs are valid.")
  invisible(TRUE)
}

arguments <- commandArgs(trailingOnly = TRUE)
if (length(arguments) != 1L) {
  stop("Usage: Rscript tools/check-source-archive.R package.tar.gz")
}
check_source_archive(arguments[[1L]])
