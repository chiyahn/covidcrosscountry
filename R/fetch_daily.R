fetch_cases <- function (region.level = "national") {
  df.confirmed <- read.csv(DATA.PATH.JHU.CONFIRMED) %>%
    clean_df_cases(region.level = region.level) %>%
    dplyr::rename(confirmed = cases)
  df.deaths <- read.csv(DATA.PATH.JHU.DEATHS) %>%
    clean_df_cases(region.level = region.level) %>%
    dplyr::rename(deaths = cases)
  df.recoveries <- read.csv(DATA.PATH.JHU.RECOVERIES) %>%
    clean_df_cases(region.level = region.level) %>%
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

fetch_mobility <- function(region.level = "national") {
  df.mobility <- read.csv(DATA.PATH.GOOGLE.MOBILITY)
  df.mobility <- df.mobility %>%
    dplyr::as_tibble() %>%
    dplyr::rename(country = country_region) %>%
    dplyr::rename(countrycode = country_region_code) %>%
    dplyr::mutate(countrycode =
                    countrycode::countrycode(countrycode, origin = "iso2c", destination = "iso3c")) %>%
    dplyr::mutate(date = lubridate::ymd(date))

  # choose the data according to the desired region.level
  if (region.level == "national") {
    df.mobility <- df.mobility %>%
      dplyr::filter(sub_region_1 == "") %>%
      dplyr::filter(sub_region_2 == "") %>%
      dplyr::select(-sub_region_1) %>%
      dplyr::select(-sub_region_2)
  } else if (region.level == "provincial" || region.level == "state") {
    df.mobility <- df.mobility %>%
      dplyr::filter(sub_region_1 != "") %>%
      dplyr::filter(sub_region_2 == "") %>%
      dplyr::select(-sub_region_2)
  } else if (region.level == "county") {
    df.mobility <- df.mobility %>%
      dplyr::filter(sub_region_2 != "")
  }

  df.mobility
}


