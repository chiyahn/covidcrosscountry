fetch_cases <- function(DATA.PER.PROVINCE = FALSE) {
  df.confirmed <- read.csv(DATA.PATH.JHU.CONFIRMED) %>%
    clean_df_cases(data.per.province = DATA.PER.PROVINCE) %>%
    dplyr::rename(confirmed = cases)
  df.deaths <- read.csv(DATA.PATH.JHU.DEATHS) %>%
    clean_df_cases(data.per.province = DATA.PER.PROVINCE) %>%
    dplyr::rename(deaths = cases)
  df.recoveries <- read.csv(DATA.PATH.JHU.RECOVERIES) %>%
    clean_df_cases(data.per.province = DATA.PER.PROVINCE) %>%
    dplyr::rename(recoveries = cases)

  df.confirmed %>%
    left_join_daily(df.deaths) %>%
    left_join_daily(df.recoveries)
}

fetch_policies <- function() {
  read.csv(DATA.PATH.OXFORD.POLICY) %>%
    dplyr::select(-X) %>%
    dplyr::as_tibble() %>%
    dplyr::mutate(Date = lubridate::ymd(Date)) %>%
    dplyr::rename(country = CountryName) %>%
    dplyr::rename(countrycode = CountryCode) %>%
    dplyr::rename(date = Date) %>%
    dplyr::group_by(countrycode, date)
}
