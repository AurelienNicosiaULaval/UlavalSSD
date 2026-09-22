# Data provenance

Both `.rda` files are retained byte for byte from version 0.2.1. The original
preparation scripts are absent from repository history.

## Weather reconstruction

On 2026-09-22, an independent download from the ECCC GeoMet climate-daily
service reproduced every value, missing value and column type in the 20,111-row
weather snapshot. The verified station rule is 5251 / 7016294 through
1995-12-31, then 26892 / 701S001 from 1996-01-01. This is an independently
verified reconstruction, not the recovered original script.

Run from the package root with the optional maintainer dependency `jsonlite`:

```r
install.packages("jsonlite", repos = "https://cloud.r-project.org")
source("data-raw/rebuild-weather.R")
```

Or run `Rscript data-raw/rebuild-weather.R /path/to/cache` to reuse a download.
The script stores source pages, an independent reconstructed data frame and a
manifest in the cache, then compares all columns against the published data.
It never overwrites package data. A changed source causes a failure requiring
review. `weather-source-manifest.csv` records the five downloaded pages and
checksums from 2026-09-22; source pages may subsequently change.

The independently retrieved data are used under the
[ECCC Data Services End-use Licence](https://eccc-msc.github.io/open-data/licence/readme_en/),
as linked by the [official climate-data documentation](https://eccc-msc.github.io/open-data/msc-data/climate_obs/readme_climateobs_en/).
The current licence is not being assigned retroactively to an unverified
historical download. The 2026 retrieval and complete comparison provide the
verified source. Data values, names, order and original serialized attributes
remain unchanged for course compatibility. Station homogeneity and the effects
of omitted measurement flags require separate scientific assessment.

## Administrative snapshot

The original documentation attributes `listecondamnation` to MAPAQ via
Donnees Quebec and reports a selection of columns. The
[source catalogue](https://www.donneesquebec.ca/recherche/api/3/action/package_show?id=condamnations-des-etablissements-alimentaires-et-condamnations-concernant-le-bien-etre-des-anim)
identifies the dataset as CC BY 4.0 (verified 2026-09-22). The package retains
its historical 1,712 records, whose publication dates span 2023-02-13 to
2025-02-10; it does not substitute the continually changing current download.
The maintainer confirms that all 1,712 records originate from this official
MAPAQ dataset distributed through Donnees Quebec, without records added from
another source. This is a maintainer confirmation, not a new row-by-row match
against the continually changing current download.

The original extraction date and transformation script remain unknown. Do not
infer a retrieval date from the last publication date. The historical .rda file
is the preserved teaching snapshot, and its limitations remain documented.

## Structural audit

`audit-snapshots.R` reports dimensions, types, missing values and file hashes.
It does not download data or reveal individual administrative records.
The installed `COPYRIGHTS` file contains attribution and limitations.
