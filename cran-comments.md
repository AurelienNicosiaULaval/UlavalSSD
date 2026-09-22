# First-submission preparation: UlavalSSD 0.3.0

UlavalSSD supplies fixed Quebec datasets for data-cleaning and exploratory
analysis, bilingual exercise feedback, and optional static style diagnostics
based on lintr. The datasets and existing French exercise outputs are unchanged.
The maintainer contact is nicosia.aurelien@gmail.com.

## Outstanding maintainer confirmation

Confirm that all 1712 administrative records in the legacy listecondamnation
snapshot come from the attributed MAPAQ dataset, with no undocumented external
records added. The source catalogue specifies CC BY 4.0; the original
extraction date and transformation script have not been recovered.

The weather snapshot has been independently reconstructed from the official
ECCC GeoMet service. All 20111 rows and 11 columns match, including missing
values and types. The repository records the script, source-page manifest,
station rule, retrieval date (2026-09-22), and current ECCC attribution.

## Validation

- Local macOS arm64, R 4.5.0: R CMD check --as-cran, including the PDF manual
  and vignette: 0 errors, 0 warnings, 1 note (new submission).
- CI: Windows and macOS R 4.6.1; Ubuntu R 4.6.1, R 4.5.3 and R-devel.
  The functional candidate passed all five with 0 errors, 0 warnings and
  1 note (new submission). Final documentation changes are rechecked by CI.
- 96 automated expectations; valid French exercise messages identical to 0.2.1.
- Both .rda files unchanged byte for byte; package URL checks passed.
- A source archive with the vignette is built and retained on Ubuntu R release.

The final artifact and its CI run must be verified before submission. This
file records preparation; no package has been submitted to CRAN.
