"DF.BCG.POLICY"

fetch_fixed_telework <- function() {
  read.csv(DATA.PATH.DINGEL.NEIMAN) %>%
    dplyr::rename(countrycode = country_code) %>%
    dplyr::as_tibble()
}

fetch_fixed_BCG <- function() {
  DF.BCG.POLICY
}

fetch_fixed_pwt <- function(year.pivot = 2017) {
  pwt9::pwt9.1 %>%
    dplyr::as_tibble() %>%
    dplyr::filter(year == year.pivot) %>%
    dplyr::select(-year) %>%
    dplyr::rename_all(paste0, year.pivot) %>%
    dplyr::rename(country = paste0("country", year.pivot)) %>%
    dplyr::rename(countrycode = paste0("isocode", year.pivot))
}

