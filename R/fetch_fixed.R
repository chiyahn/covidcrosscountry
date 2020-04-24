
fetch_fixed_telework <- function() {
  read.csv(DATA.PATH.DINGEL.NEIMAN) %>%
    dplyr::rename(countrycode = country_code) %>%
    dplyr::as_tibble()
}

fetch_fixed_BCG <- function() {
  DF.BCG.POLICY
}

# TODO: fix this
fetch_fixed_pwt <- function(year = 2005) {
  pwt9::pwt9.1 %>%
    dplyr::as_tibble() %>%
    dplyr::filter(year == 2015) %>%
    dplyr::select(-year) %>%
    dplyr::rename_all(paste0, "2015") %>%
    dplyr::rename(country = country2015) %>%
    dplyr::rename(countrycode = isocode2015)
}

