// load data
insheet using data/GDPC1.csv

// parse dates
gen dates = date(date,"YMD")
gen dateq = qofd(dates)
tsset dateq, quarterly
label variable dateq "Quarter"

// plot gdp
rename value gdp
label variable gdp "GDP"
tsline gdp

// plot log gdp
gen lgdp = log(gdp)
label variable lgdp "Log GDP"
tsline lgdp

// growth rate (annualized)
gen growth = lgdp - lgdp[_n-4]
label variable growth "GDP Growth"
tsline growth
