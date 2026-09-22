## First submission

This is the first CRAN submission candidate for UlavalSSD 0.3.0. The package
provides fixed Quebec weather and administrative-data snapshots for teaching
data cleaning and exploratory analysis, bilingual exercise feedback, and
optional static R code-style diagnostics based on lintr. Use, examples, tests
and vignette rebuilding do not require network access.

## Data sources and permissions

Code and original documentation are licensed under MIT. The installed
COPYRIGHTS file separately attributes the third-party data and their terms.
The package maintainer confirms that all 1712 administrative records originate
from the official MAPAQ dataset distributed through Donnees Quebec, whose
catalogue specifies CC BY 4.0. The historical extraction date and original
preparation script have not been recovered; this is stated in the help.

The weather snapshot was independently retrieved from the official ECCC
GeoMet service on 2026-09-22 under its current Data Services End-use Licence.
All 20111 rows and 11 columns, including missing values and types, match the
preserved snapshot. The reconstruction script and source manifest are in the
repository. No original extraction date is inferred or claimed.

## Checks

A source archive is built with R release and passed unchanged, with its SHA256
verified, to checks on Windows, macOS and Ubuntu R release, Ubuntu R oldrel-1,
and Ubuntu R-devel. The R-devel check includes the PDF manual. All other checks
use --as-cran --no-manual. Final results, the source checksum and the exact CI
run are recorded in the accompanying submission dossier.

The functional tests contain 97 passing expectations. There are no known
reverse dependencies on CRAN because this is a new package.

## Maintainer

Aurelien Nicosia <nicosia.aurelien@gmail.com>
