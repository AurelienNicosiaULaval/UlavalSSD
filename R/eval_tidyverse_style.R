#' Évaluer le style tidyverse d'un fichier R ou QMD
#'
#' Cette fonction analyse un fichier `.R` ou `.qmd` et attribue un score basé sur les critères
#' du guide de style tidyverse (chapitres 1 et 2).
#'
#' @param file_path Chemin vers le fichier à analyser (format `.R` ou `.qmd`).
#'
#' @return Une liste contenant :
#'   - `scores` : Une liste avec les notes attribuées à chaque critère.
#'   - `total` : Le score total sur 20.
#'
#' @examples
#' \dontrun{
#' result <- eval_tidyverse_style("mon_script.R")
#' print(result)
#' }
#'
#' @importFrom stringr str_detect
#' @export
eval_tidyverse_style <- function(file_path) {
  # Lire le contenu du fichier
  lines <- readLines(file_path, warn = FALSE)

  # Initialiser le score
  scores <- list(
    syntaxe_indentation = 0,
    espaces_lisibilite = 0,
    longueur_lignes = 0,
    assignation = 0,
    nommage_objets = 0,
    style_fonctions = 0,
    coherence = 0,
    commentaires = 0,
    conventions = 0
  )

  # Vérifier l'indentation (2 espaces par niveau)
  if (any(grepl("^\t", lines))) {
    scores$syntaxe_indentation <- 0
  } else {
    scores$syntaxe_indentation <- 2
  }

  # Vérifier les espaces et la lisibilité (espaces autour des opérateurs)
  if (all(grepl("\\s*<-\\s*", lines))) {
    scores$espaces_lisibilite <- 2
  }

  # Vérifier la longueur des lignes (max 80 caractères)
  if (all(nchar(lines) <= 80)) {
    scores$longueur_lignes <- 2
  }

  # Vérifier l'utilisation de `<-` au lieu de `=`
  if (all(!grepl("\\w+\\s*=\\s*", lines))) {
    scores$assignation <- 2
  }

  # Vérifier le nommage en `snake_case`
  if (all(grepl("^[a-z_]+$", lines) | !grepl("[A-Z]", lines))) {
    scores$nommage_objets <- 2
  }

  # Vérifier le style des fonctions
  if (all(grepl("\\w+\\(.*\\)", lines))) {
    scores$style_fonctions <- 2
  }

  # Vérifier la clarté et la cohérence
  scores$coherence <- 2  # Subjectif, ici on l'accorde par défaut

  # Vérifier les commentaires utiles
  if (any(grepl("^\\s*#\\s+", lines))) {
    scores$commentaires <- 2
  }

  # Vérifier le respect des conventions générales
  scores$conventions <- mean(unlist(scores)) # Moyenne des critères

  # Calculer le score final
  total_score <- sum(unlist(scores), na.rm = TRUE)

  return(list(scores = scores, total = total_score))
}
