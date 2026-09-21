# Exercise the installed package using only its declared R dependencies.
library(UlavalSSD)

stopifnot(
  identical(dim(MeteoQuebec), c(20111L, 11L)),
  identical(dim(listecondamnation), c(1712L, 10L)),
  is.character(consulter_taches("histogramme")),
  is.character(verifier_valeur_aberrante(10L))
)

# The style helper must remain usable after removing the unused stringr import.
example_file <- tempfile(fileext = ".R")
writeLines(c("# Exemple", "valeur <- 1"), example_file)
result <- eval_tidyverse_style(example_file)
stopifnot(is.list(result$scores), is.numeric(result$total), is.finite(result$total))
unlink(example_file)
