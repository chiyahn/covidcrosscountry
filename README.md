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

## Data sources
### Daily data
```r
covidcrosscountry::fetch_all_daily()
```
includes the following data:

- `fetch_mobility`: Google COVID-19 Community Mobility Reports; movement trends over time by geography, across different categories of places such as retail and recreation, groceries and pharmacies, parks, transit stations, workplaces, and residential. Repo: https://www.google.com/covid19/mobility/
- `fetch_cases`: 2019 Novel Coronavirus COVID-19 (2019-nCoV) Data Repository by Johns Hopkins CSSE; cross-country data for the number of confirmed/deceased/recovered cases. Repo: https://github.com/CSSEGISandData/COVID-19
- `fetch_policy`: Oxford Covid-19 Government Response Tracker (OxCGRT); systematic information on which governments have taken which measures, and when. Repo: https://github.com/OxCGRT/covid-policy-tracker/

### Country-level fixed data
```r
covidcrosscountry::fetch_all_fixed()
```
includes the following data:

- `fetch_fixed_pwt`: Penn World Table (2015 year as default); cross-country national-accounts data. Supported by an R package `pwt9`.
- `fetch_fixed_BCG`: National BCG vaccine policy for 57 countries. Data from [Akiyama and Ishida (2020)](http://www.bi.cs.titech.ac.jp/COVID-19/Death_vs_BCGpolicy_version2.0.html). 
- `fetch_fixed_telework`: [Dingel and Neiman (2020)](https://github.com/jdingel/DingelNeiman-workathome/) index for the share of jobs that can be done at home for each country. Repo: https://github.com/jdingel/DingelNeiman-workathome/
