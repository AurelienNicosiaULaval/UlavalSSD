<!-- badges: start -->
  [![R-CMD-check](https://github.com/AurelienNicosiaULaval/UlavalSSD/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/AurelienNicosiaULaval/UlavalSSD/actions/workflows/R-CMD-check.yaml)
  <!-- badges: end -->
# UlavalSSD

📊 **UlavalSSD** est un package R conçu pour le cours **STT-1100** à l'Université Laval. Il fournit des ensembles de données et des fonctions utiles pour faciliter l’apprentissage statistique et l’analyse de données des étudiants.

## 📥 Installation

Vous pouvez installer ce package directement depuis GitHub avec `remotes` :

``` r
# Installer le package remotes si nécessaire
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes", repos = "https://cloud.r-project.org")
}

# Installer UlavalSSD sans mettre à jour les autres packages
remotes::install_github(
  "AurelienNicosiaULaval/UlavalSSD",
  upgrade = "never"
)
```

Depuis la version 0.2.1, `UlavalSSD` ne nécessite aucun package supplémentaire
pour fonctionner. `remotes` sert uniquement à l'installation depuis GitHub.

### Si l'accès à l'API GitHub échoue

Si `install_github()` renvoie une erreur d'authentification ou de limite de
requêtes, l'archive publique peut être installée directement. Après avoir
installé `remotes` avec le code ci-dessus, exécutez :

```r
remotes::install_url(
  "https://github.com/AurelienNicosiaULaval/UlavalSSD/archive/refs/heads/main.tar.gz",
  upgrade = "never"
)
```

Cette méthode utilise le téléchargement public de GitHub sans passer par son
API. Si elle échoue également, conservez le message d'erreur complet ainsi que
le résultat de `sessionInfo()` pour diagnostiquer le problème.

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
