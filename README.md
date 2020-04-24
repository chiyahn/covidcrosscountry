# covidcrosscountry

To use the package, simply run

```r
# install devtools if not installed
install.packages("devtools") 

# install the R package
devtools::install_github("chiyahn/covidcrosscountry")
```

## Fetching the data

```r
covidcrosscountry::fetch_all()
```

Returns all the fetched data in a single `master' dataframe object. To fetch the daily data only (cases / policy updates), run

```r
covidcrosscountry::fetch_all_daily()
```


