# Data provenance

The two `.rda` files are retained byte for byte from version 0.2.1. The original
preparation scripts are absent from the repository history. Do not infer a
retrieval date from the last date in a dataset or reconstruct undocumented
station joins as if they were original.

`audit-snapshots.R` produces a local structural audit without downloading data.
It is not a reconstruction of the original preparation pipeline.

Before CRAN submission, recover and archive the original preparation scripts,
source versions, retrieval dates and applicable redistribution terms. For the
weather data, reconcile the historic climate-site agreement with the current
open-data licence, or reproduce and compare the snapshot using an identified
open-data source. Record any differences before changing the course dataset.

The installed `COPYRIGHTS` file records the verified source metadata and the
remaining uncertainties. The MAPAQ catalogue API is available at:
<https://www.donneesquebec.ca/recherche/api/3/action/package_show?id=condamnations-des-etablissements-alimentaires-et-condamnations-concernant-le-bien-etre-des-anim>.
