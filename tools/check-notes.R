# A new-submission NOTE must not conceal other incoming-check findings.
check_notes <- function(result) {
  if (length(result$errors) || length(result$warnings)) {
    stop("Package check contains errors or warnings.", call. = FALSE)
  }
  expected <- vapply(result$notes, function(note) {
    lines <- trimws(strsplit(note, "\n", fixed = TRUE)[[1L]])
    lines <- lines[nzchar(lines)]
    if (length(lines) != 3L) return(FALSE)
    grepl("^checking CRAN incoming feasibility .*NOTE$", lines[[1L]]) &&
      startsWith(lines[[2L]], "Maintainer: ") &&
      identical(lines[[3L]], "New submission")
  }, logical(1))
  if (any(!expected)) {
    cat(paste(result$notes[!expected], collapse = "\n\n"), "\n")
    stop("Unexpected NOTE: inspect the complete message before release.",
      call. = FALSE
    )
  }
  message("Check results: no errors, warnings or unexpected notes.")
  invisible(TRUE)
}
