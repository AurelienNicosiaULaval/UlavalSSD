#' Historical Daily Weather Observations from Quebec
#'
#' A fixed teaching snapshot of 20,111 daily records, from 1970-01-01 to
#' 2025-01-22 inclusive. Missing observations are retained for data-cleaning
#' exercises. Values, column order and original classes are preserved from
#' version 0.2.1 for compatibility with existing course materials.
#'
#' @format A data frame with classes `spec_tbl_df`, `tbl_df`, `tbl`, and
#'   `data.frame`, containing 20,111 rows and 11 columns:
#' \describe{
#'   \item{...1}{Numeric row identifier in the original export, not a weather
#'     measurement.}
#'   \item{year}{Year, numeric.}
#'   \item{month}{Month as a two-character string, `"01"` to `"12"`.}
#'   \item{day}{Day as a two-character string, `"01"` to `"31"`.}
#'   \item{max_temp}{Daily maximum temperature, degrees Celsius.}
#'   \item{mean_temp}{Daily mean temperature, degrees Celsius.}
#'   \item{min_temp}{Daily minimum temperature, degrees Celsius.}
#'   \item{total_precip}{Daily total precipitation, millimetres.}
#'   \item{total_rain}{Daily rainfall, millimetres.}
#'   \item{total_snow}{Daily snowfall, centimetres.}
#'   \item{snow_grnd}{Snow on the ground, centimetres.}
#' }
#' All measurement columns are numeric and may contain `NA`. Dates have no
#' gaps or duplicates, but this does not imply complete measurements.
#'
#' @details The original documentation identifies Environment and Climate
#'   Change Canada station identifiers 5251 and 26892 and the 'weathercan'
#'   package. The original download date, station-switch rule and preparation
#'   script are not recorded in the repository. Consequently this snapshot
#'   should not be treated as a verified homogeneous climate series for trend
#'   estimation. Rain, snowfall and snow-depth measurements are missing for
#'   substantial portions of the series. There is no automatic refresh.
#' @source Data source: Environment and Climate Change Canada, obtained via
#'   'weathercan' according to the original package documentation.
#'   <https://climate.weather.gc.ca/>.
#'   See the installed `COPYRIGHTS` file for attribution and provenance limits.
#' @examples
#' weather <- as.data.frame(MeteoQuebec)
#' weather$date <- as.Date(with(weather, paste(year, month, day, sep = "-")))
#' range(weather$date)
#' colSums(is.na(weather))
#' head(weather[c("date", "min_temp", "max_temp")])
"MeteoQuebec"
