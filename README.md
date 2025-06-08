<!-- badges: start -->
  [![R-CMD-check](https://github.com/AurelienNicosiaULaval/UlavalSSD/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/AurelienNicosiaULaval/UlavalSSD/actions/workflows/R-CMD-check.yaml)
  <!-- badges: end -->
# UlavalSSD

📊 **UlavalSSD** est un package R conçu pour le cours **STT-1100** à l'Université Laval. Il fournit des ensembles de données et des fonctions utiles pour faciliter l’apprentissage statistique et l’analyse de données des étudiants.

## 📥 Installation

Vous pouvez installer ce package directement depuis GitHub avec `remotes` :

``` r
# Installer le package remotes si nécessaire
install.packages("remotes")

# Installer UlavalSSD depuis GitHub
remotes::install_github("AurelienNicosiaULaval/UlavalSSD")
```

## 🔧 Utilisation

Une fois installé, chargez le package avec :

``` r
library(UlavalSSD)
```

## 📂 Jeux de données disponibles

Le package inclut des ensembles de données spécialement sélectionnés pour **STT-1100**. Voici quelques-uns des principaux :

- **`MeteoQuebec`** – Observations météorologiques quotidiennes (1970–2025) pour une station située dans la province de Québec.
- **`listecondamnation`** – Condamnations d’établissements alimentaires au Québec avec détail des infractions et montants d’amende.
