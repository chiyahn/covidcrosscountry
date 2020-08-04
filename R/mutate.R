first_date_per_group <- function (df, select, ...) {
  args <- rlang::enexprs(...)
  select <- enquo(select)
  df %>%
    dplyr::select(dplyr::group_cols(), (!! select), date) %>%
    dplyr::arrange(date) %>%
    dplyr::slice(if(any(is.na(!! select)) || any(!!! args))
      which.max(!!! args) else NA) %>%
    dplyr::select(dplyr::group_cols(), date)
}

last_date_per_group <- function (df, select, ...) {
  args <- rlang::enexprs(...)
  select <- enquo(select)
  df %>%
    dplyr::select(dplyr::group_cols(), (!! select), date) %>%
    dplyr::arrange(desc(date)) %>%
    dplyr::slice(if(any(is.na(!! select)) || any(!!! args))
      which.max(!!! args) else NA) %>%
    dplyr::select(dplyr::group_cols(), date)
}
