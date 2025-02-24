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
    "histogramme" = "Je veux voir la répartition des longueurs de nageoires des manchots. En effet, quand j'ai regardé, il me semblait y avoir une erreur dans les données. J'aimerais que tu m'aides à la trouver.",
    "nuage_de_points" = "Je veux voir la relation entre la longueur du bec et la masse corporelle sous forme d'un nuage de points. Peux-tu vérifier s'il y a des valeurs aberrantes pour ces deux variables ?",
    "statistiques_descriptives" = "Quelle espèce de pingouin a le bec le plus long en moyenne ? Le plus variable?",
    "Visualisation_statistiques_descriptives" = "J'ai commencé à faire le ggplot, mais il resterait a ajouter une annotation indiquant la valeur moyenne de chaque espèce sur le graphique."
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
    return("Oui, cette valeur est bien une aberration ! J'ai pu vérifier mes notes, et ça devrait être 193mm. Merci de modifier la base de données pour moi dans le dépôt Github.")
  }
  if (ligne == 11){
    return("Oui, cette valeur est bien une aberration ! J'ai pu vérifier mes notes, et ça devrait être corrigé par 3.3kg de masse corporelle et 37.8 mm de longueur de bec. Merci de mettre à jour la base de données.")
  }  else {
    return("Hum, j'ai bien vérifié, il ne s'agit pas d'une valeur aberrante, essayez encore !")
  }
}
