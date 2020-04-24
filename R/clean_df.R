clean_df_cases_dates <- function(df) {
  dates.raw <- colnames(df)[grepl("[[:digit:]]", colnames(df))]
  dates <- dates.raw %>%
    stringr::str_remove_all("[^0-9\\.]") %>%
    stringr::str_replace_all("[.]", "/") %>%
    lubridate::mdy()
  dates.table <- data.frame(date.raw = dates, date = dates.raw)

  # clean dates
  df %>%
    tidyr::gather(dates.raw, key = "date", value = "cases") %>%
    dplyr::left_join(dates.table, by = "date") %>%
    dplyr::select(-date) %>% # drop old date column
    dplyr::rename(date = date.raw)
}

clean_df_cases <- function (df, data.per.province = FALSE) {
  # rename
  df <- df %>%
    clean_df_cases_dates() %>%
    dplyr::rename(country = Country.Region) %>%
    dplyr::rename(province = Province.State) %>%
    dplyr::rename(lat = Lat) %>%
    dplyr::rename(long = Long) %>%
    dplyr::mutate(countrycode =
      countrycode::countrycode(country, origin = "country.name", destination = "iso3c"))

  # add cases per each province to a national level
  if (!data.per.province)
    df <- df %>%
      dplyr::group_by(countrycode, date, country) %>%
      dplyr::summarize(cases = sum(cases))

  # return as a tibble
  df %>%
    dplyr::as_tibble() %>%
    dplyr::group_by(countrycode, date, country)
}
