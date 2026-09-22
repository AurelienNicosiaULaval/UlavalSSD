# Run from the package root:
# Rscript data-raw/rebuild-weather.R [cache-directory]
# jsonlite is needed only for this maintainer script. No package data are changed.
library(jsonlite)
options(timeout = max(60, getOption("timeout")))
arguments <- commandArgs(trailingOnly = TRUE)
cache <- if (length(arguments)) arguments[[1L]] else "data-raw/cache"
dir.create(cache, recursive = TRUE, showWarnings = FALSE)

fetch_station <- function(identifier) {
  url <- paste0(
    "https://api.weather.gc.ca/collections/climate-daily/items?f=json&",
    "CLIMATE_IDENTIFIER=", identifier,
    "&datetime=1970-01-01T00:00:00Z/2025-01-22T23:59:59Z&limit=10000"
  )
  pages <- list()
  manifest <- list()
  while (!is.null(url)) {
    path <- file.path(cache, paste0(identifier, "-", length(pages) + 1L, ".json"))
    if (!file.exists(path)) {
      download.file(url, path, quiet = TRUE, mode = "wb")
    }
    page <- jsonlite::fromJSON(path)
    values <- page$features$properties
    stopifnot(all(values$CLIMATE_IDENTIFIER == identifier))
    pages[[length(pages) + 1L]] <- values
    manifest[[length(manifest) + 1L]] <- data.frame(
      file = basename(path), url = url,
      md5 = unname(tools::md5sum(path)), rows = nrow(values)
    )
    next_url <- page$links$href[page$links$rel == "next"]
    url <- if (length(next_url)) next_url[[1L]] else NULL
  }
  observations <- do.call(rbind, pages)
  observations$date <- as.Date(observations$LOCAL_DATE)
  stopifnot(!anyDuplicated(observations$date))
  list(data = observations, manifest = do.call(rbind, manifest))
}

old <- fetch_station("7016294") # Historical STN_ID 5251
new <- fetch_station("701S001") # Historical STN_ID 26892
stopifnot(all(old$data$STN_ID == 5251), all(new$data$STN_ID == 26892))
# This rule was independently verified against every stored measurement on
# 2026-09-22. It is not claimed to be the recovered original preparation script.
observations <- rbind(
  old$data[old$data$date < as.Date("1996-01-01"), ],
  new$data[new$data$date >= as.Date("1996-01-01"), ]
)
observations <- observations[order(observations$date), ]
dates <- seq(as.Date("1970-01-01"), as.Date("2025-01-22"), by = "day")
stopifnot(identical(as.character(observations$date), as.character(dates)))
measurements <- c(
  max_temp = "MAX_TEMPERATURE", mean_temp = "MEAN_TEMPERATURE",
  min_temp = "MIN_TEMPERATURE", total_precip = "TOTAL_PRECIPITATION",
  total_rain = "TOTAL_RAIN", total_snow = "TOTAL_SNOW",
  snow_grnd = "SNOW_ON_GROUND"
)
rebuilt <- data.frame(
  "...1" = as.double(seq_along(dates)),
  year = as.double(format(dates, "%Y")),
  month = format(dates, "%m"), day = format(dates, "%d"),
  check.names = FALSE
)
for (column in names(measurements)) {
  rebuilt[[column]] <- as.double(observations[[measurements[[column]]]])
}
original <- new.env(parent = baseenv())
load("data/MeteoQuebec.rda", envir = original)
original <- as.data.frame(original$MeteoQuebec)
stopifnot(identical(names(rebuilt), names(original)))
identical_columns <- vapply(names(rebuilt), function(column) {
  identical(rebuilt[[column]], original[[column]])
}, logical(1))
print(identical_columns)
if (!all(identical_columns)) {
  stop("The source has changed: investigate differences; do not replace the snapshot.")
}
# Store an independent reconstruction, retaining the published .rda unchanged.
saveRDS(rebuilt, file.path(cache, "MeteoQuebec-reconstructed.rds"))
write.csv(rbind(old$manifest, new$manifest), file.path(cache, "source-manifest.csv"),
          row.names = FALSE)
cat("All 20111 rows and 11 columns match, including missing values and types.\n")
