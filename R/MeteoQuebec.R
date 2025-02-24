#' Base de données météo pour la province de Québec
#'
#' Cette base de données contient des informations météorologiques journalières
#' pour une station météo située dans la province de Québec (Canada), collectées
#' entre le 1er janvier 1970 et 2025.
#'
#' @format Un data.frame avec les colonnes suivantes :
#' \describe{
#'   \item{year}{Année de l'observation (numérique).}
#'   \item{month}{Mois de l'observation (numérique, 1 = janvier, ..., 12 = décembre).}
#'   \item{day}{Jour du mois de l'observation (numérique, 1-31).}
#'   \item{max_temp}{Température maximale quotidienne (en degrés Celsius).}
#'   \item{mean_temp}{Température moyenne quotidienne (en degrés Celsius).}
#'   \item{min_temp}{Température minimale quotidienne (en degrés Celsius).}
#'   \item{total_precip}{Précipitations totales quotidiennes (en millimètres).}
#'   \item{total_rain}{Quantité totale de pluie quotidienne (en millimètres).}
#'   \item{total_snow}{Quantité totale de neige quotidienne (en centimètres).}
#'   \item{snow_grnd}{Quantité de neige au sol quotidienne (en centimètres).}
#' }
#'
#' @source Les données ont été obtenues en utilisant le package \code{weathercan}.
#' Station ID : 5251 (2017 à 1995) et 26892 (1996 à aujourd'hui).
#'
#' @examples
#' head(MeteoQuebec)
"MeteoQuebec"
