<!-- badges: start -->
  [![R-CMD-check](https://github.com/AurelienNicosiaULaval/UlavalSSD/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/AurelienNicosiaULaval/UlavalSSD/actions/workflows/R-CMD-check.yaml)
  <!-- badges: end -->
# UlavalSSD

📊 **UlavalSSD** est un package R conçu pour le cours **STT-1100** à l'Université Laval. Il fournit des ensembles de données et des fonctions utiles pour faciliter l’apprentissage statistique et l’analyse de données des étudiants.

## 📥 Installation

La méthode recommandée télécharge directement l'archive publique de GitHub.
Elle ne nécessite pas de jeton d'authentification GitHub :

``` r
# Installer le package remotes si nécessaire
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes", repos = "https://cloud.r-project.org")
}

# Installer UlavalSSD depuis l'archive publique de GitHub
remotes::install_url(
  "https://github.com/AurelienNicosiaULaval/UlavalSSD/archive/refs/heads/main.tar.gz",
  upgrade = "never"
)
```

Depuis la version 0.2.1, `UlavalSSD` ne nécessite aucun package supplémentaire
pour fonctionner. `remotes` sert uniquement à l'installation depuis GitHub.

### Erreur `HTTP error 401. Bad credentials`

Si une ancienne commande `remotes::install_github()` affiche
`Using GitHub PAT from the git credential store`, puis cette erreur,
GitHub refuse le jeton enregistré sur l'ordinateur. Utilisez la commande
`remotes::install_url()` ci-dessus : elle ne modifie ni ne supprime les
identifiants enregistrés.

### Autre méthode avec l'API GitHub

Si l'authentification GitHub fonctionne sur votre ordinateur, cette commande
reste disponible :

```r
remotes::install_github(
  "AurelienNicosiaULaval/UlavalSSD",
  upgrade = "never"
)
```

En cas d'erreur d'authentification ou de limite de requêtes de l'API, utilisez
la méthode recommandée par archive publique. Si celle-ci échoue également,
conservez le message d'erreur complet ainsi que le résultat de `sessionInfo()`
pour diagnostiquer le problème.

## 🔧 Utilisation

Une fois installé, chargez le package avec :

``` r
library(UlavalSSD)
packageVersion("UlavalSSD")
head(MeteoQuebec)
```

## 📂 Jeux de données disponibles

Le package inclut des ensembles de données spécialement sélectionnés pour **STT-1100**. Voici quelques-uns des principaux :

- **`MeteoQuebec`** – Observations météorologiques quotidiennes (1970–2025) pour une station située dans la province de Québec.
- **`listecondamnation`** – Condamnations d’établissements alimentaires au Québec avec détail des infractions et montants d’amende.
