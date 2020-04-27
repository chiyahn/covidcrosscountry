fetch_all_daily <- function(region.level = "national") {
  fetch_mobility(region.level = region.level) %>%
    left_join_daily(fetch_cases(region.level = region.level)) %>%
    left_join_daily(fetch_policies()) %>%
    dplyr::group_by(countrycode, date)
}

fetch_all_fixed <- function() {
  fetch_fixed_pwt() %>%
    left_join_fixed(fetch_fixed_BCG()) %>%
    left_join_fixed(fetch_fixed_telework()) %>%
    dplyr::group_by(countrycode)
}

fetch_all <- function() {
  fetch_all_daily() %>%
    left_join_fixed(fetch_all_fixed()) %>%
    dplyr::group_by(countrycode, date)
}
