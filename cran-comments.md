# Preparation only: do not submit yet

This is a first-submission candidate for UlavalSSD 0.3.0. It contains fixed
Quebec datasets for data-cleaning and exploratory-analysis exercises, bilingual
exercise feedback, and optional static style diagnostics based on lintr.

## Outstanding before submission

- Establish and document the redistribution terms applicable to the original
  weather snapshot; current open-data terms do not establish the terms of the
  original extraction.
- Recover or reconstruct a verifiable data-preparation pipeline, including
  source versions, retrieval dates and the weather station-switch rule.
- Complete and record checks of the final source artifact on current R release
  and R-devel. Recheck policy and URLs immediately before submission.

The maintainer address has been confirmed as nicosia.aurelien@gmail.com.
The data files and existing French exercise messages are unchanged.

## Local checks during preparation

macOS arm64, R 4.5.0, R CMD check --as-cran with PDF manual and vignette:
0 errors, 0 warnings, 2 notes (new submission; unable to verify current time).
These results are supplemental because this local R is not the current release.
The final cross-platform check results will be recorded after CI finishes.
