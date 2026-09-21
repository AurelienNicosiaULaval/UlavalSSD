#' Consulter les tâches assignées par la chercheuse de l'aventure 2
#'
#' Cette fonction permet d'obtenir les tâches laissées par la chercheuse en fonction de la section d'analyse.
#'
#' @param section Un caractère spécifiant la section dont on veut obtenir la tâche. Options disponibles :
#'   - `"histogramme"` : Analyse de la distribution des longueurs de nageoires.
#'   - `"statistiques_descriptives"` : Calcul des statistiques descriptives des longueurs de nageoires.
#'
#' @return Une chaîne de caractères contenant la description de la tâche assignée.
#' @examples
#' consulter_taches("histogramme")
#' consulter_taches("statistiques_descriptives")
#'
#' @export
consulter_taches <- function(section) {
  taches <- list(
    "histogramme" = "Je veux voir la r\u00e9partition des longueurs de nageoires des manchots. En effet, quand j'ai regard\u00e9, il me semblait y avoir une erreur dans les donn\u00e9es. J'aimerais que tu m'aides \u00e0 la trouver.",
    "nuage_de_points" = "Je veux voir la relation entre la longueur du bec et la masse corporelle sous forme d'un nuage de points. Peux-tu v\u00e9rifier s'il y a des valeurs aberrantes pour ces deux variables ?",
    "statistiques_descriptives" = "Quelle esp\u00e8ce de pingouin a le bec le plus long en moyenne ? Le plus variable?",
    "Visualisation_statistiques_descriptives" = "J'ai commenc\u00e9 \u00e0 faire le ggplot, mais il resterait a ajouter une annotation indiquant la valeur moyenne de chaque esp\u00e8ce sur le graphique."
  )
  return(taches[[section]])
}


#' Vérifier si une valeur est une aberration dans la base de données penguins_mission
#'
#' Cette fonction permet de vérifier si une ligne donnée correspond à une valeur aberrante détectée dans les données des manchots.
#'
#' @param ligne Un entier représentant le numéro de ligne à vérifier.
#'
#' @return Un message indiquant si la valeur correspond bien à une aberration ou si une autre vérification est nécessaire.
#' @examples
#' verifier_valeur_aberrante(10) # Indique que la valeur n'est pas une aberration
#'
#' @export
verifier_valeur_aberrante <- function(ligne) {
  if (ligne == 6) {
    return("Oui, cette valeur est bien une aberration ! J'ai pu v\u00e9rifier mes notes, et \u00e7a devrait \u00eatre 193mm. Merci de modifier la base de donn\u00e9es pour moi dans le d\u00e9p\u00f4t Github.")
  }
  if (ligne == 11){
    return("Oui, cette valeur est bien une aberration ! J'ai pu v\u00e9rifier mes notes, et \u00e7a devrait \u00eatre corrig\u00e9 par 3.3kg de masse corporelle et 37.8 mm de longueur de bec. Merci de mettre \u00e0 jour la base de donn\u00e9es.")
  }  else {
    return("Hum, j'ai bien v\u00e9rifi\u00e9, il ne s'agit pas d'une valeur aberrante, essayez encore !")
  }
}
