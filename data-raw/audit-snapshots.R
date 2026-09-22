# Run from the package root; report only aggregate information.
paths <- list.files("data", pattern = "\\.rda$", full.names = TRUE)
stopifnot(length(paths) == 2L)
print(tools::md5sum(paths))
for (path in paths) {
  objects <- new.env(parent = baseenv())
  object_name <- load(path, envir = objects)
  stopifnot(length(object_name) == 1L)
  value <- objects[[object_name]]
  cat("\n", object_name, "\n", sep = "")
  print(dim(value))
  print(vapply(
    value, function(column) paste(class(column), collapse = "/"),
    character(1)
  ))
  print(vapply(value, function(column) sum(is.na(column)), integer(1)))
}
