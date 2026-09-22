## Resubmission of UlavalSSD 0.3.1

This resubmission addresses both points raised by Uwe Ligges on 2026-09-22
for version 0.3.0. Thank you for reviewing the package.

1. Invalid file URIs in README.md: removed the link to cran-comments.md, which
   is deliberately excluded from the source archive. Replaced the relative
   data-raw/README.md link with an absolute HTTPS link to the existing file at
   a fixed repository commit. Copyright attribution also uses a permanent
   repository link, and the README shows how to locate the installed file.

2. Method reference in DESCRIPTION: added Hester et al. (2025)
   <doi:10.21105/joss.07240>, "Static Code Analysis for R", the peer-reviewed
   reference for lintr. The reference is also included in the style-diagnostic
   help. This function wraps lintr checks for teaching; its formative score is
   not a validated measure of statistical correctness. The other functions
   provide fixed exercise feedback, not a statistical estimation method.

No function behavior or dataset values changed from version 0.3.0.

## Validation procedure

One source archive is built with R release and used unchanged in every check.
All checks explicitly enable _R_CHECK_CRAN_INCOMING_CHECK_FILE_URIS_=true.
A separate archive check inspects file URIs with R's own incoming checker,
and an unexpected-NOTE gate examines complete messages rather than counts.
Both gates were verified to reject the original 0.3.0 submission findings.
The matrix covers Windows R release and R-devel, macOS R release, and Ubuntu
R release, oldrel-1 and R-devel. The Ubuntu R-devel check includes PDF and HTML
manual validation. Final check results accompany the resubmission.

## Data sources and permissions

Code and original documentation are licensed under MIT. The installed
COPYRIGHTS file separately attributes the third-party data and their terms.
All 1712 administrative records originate from the official MAPAQ dataset
distributed through Donnees Quebec under CC BY 4.0, as confirmed by the
maintainer. The historical extraction date and original transformation script
are unknown; this limitation remains documented.

Weather observations were independently retrieved from the official ECCC
GeoMet service on 2026-09-22 under its current Data Server End-use Licence.
All 20111 rows and 11 columns, including missing values and types, match the
preserved snapshot. The reconstruction script and manifest are in the
repository. No original extraction date is inferred or claimed.

## Maintainer

Aurelien Nicosia <nicosia.aurelien@gmail.com>
