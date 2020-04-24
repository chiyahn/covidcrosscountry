left_join_daily <- function(x, y) {
  if ("country" %in% colnames(y))
    dplyr::left_join(x, y %>% dplyr::ungroup() %>% dplyr::select(-country),
                     by = c('countrycode', 'date'))
  else
    dplyr::left_join(x, y,
                     by = c('countrycode', 'date'))
}

left_join_fixed <- function(x, y) {
  if ("country" %in% colnames(y))
    dplyr::left_join(x, y %>% dplyr::ungroup() %>% dplyr::select(-country),
                     by = c("countrycode"))
  else
    dplyr::left_join(x, y,
                     by = c("countrycode"))
}
