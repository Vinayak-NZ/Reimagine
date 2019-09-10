library(highcharter)
library(htmlwidgets)
library(tidyr)
library(reshape2)

country <- read.csv("data/country.csv", header = TRUE)
disabledPeople <- read.csv("data/disabledPeople.csv", header = TRUE)
econAct <- read.csv("data/economicactivity.csv", header = TRUE)
income <- read.csv("data/incomeconnection.csv", header = TRUE)
never_internet <- read.csv("data/never_internet.csv", header = TRUE)
noInternet <- read.csv("data/noInternetReason.csv", header = TRUE)
region_never <- read.csv("data/region_never.csv", header = TRUE)
region_zero <- read.csv("data/region_zero.csv", header = TRUE)

hc_country <- country %>%
  hchart("bar", hcaes(x = "Country", y = "Percentage")) %>%
  hc_title(
    text = "<b>Percentage of internet users across the EU</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "The United Kingdom has the third highest rate of intenet users",
              align = "left", style = list(color = "#2b908f", fontWeight = "bold")) 

disabledPeople.melt <- melt(disabledPeople, id = "Year")
disabledPeople.melt <- disabledPeople.melt %>% dplyr::rename(percentage = value)
hc_disabledPeople <- disabledPeople.melt %>% 
  hchart('line', hcaes(x = 'Year', y = 'percentage', group = "variable")) %>%
  hc_title(
    text = "<b>Disability and digital dis-engagement</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "Disabled people are far more likely to be disengaged from digital",
              align = "left", style = list(color = "#2b908f", fontWeight = "bold")) 

hc_econAct <- econAct %>% 
  hchart('column', hcaes(x = 'Economic.Activity', y = 'Percentage')) %>%
  hc_title(
    text = "<b>Economic Activity and Digital dis-engagement</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "Sick or disabled people are less likely to have internet access",
              align = "left", style = list(color = "#2b908f", fontWeight = "bold")) 

hc_income <- income %>% 
  hchart('bar', hcaes(x = 'Household.income.band', y = 'Percentage')) %>%
  hc_title(
    text = "<b>Income and Internet connection</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "More than 50% of households with income below £15000 don't have internet connectivity",
              align = "left", style = list(color = "#2b908f", fontWeight = "bold")) 

hc_noInternet <- noInternet %>% 
  hchart('bar', hcaes(x = 'Reason', y = 'Percentage')) %>%
  hc_title(
    text = "<b>Reason for not having internet connection</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "Most people who don't have internet access don't think it's useful",
              align = "left", style = list(color = "#2b908f", fontWeight = "bold")) 

hc_never_int <- never_internet %>%
  hchart("area", hcaes(x = "Year", y = "Percentage"))

region_zero_long <- gather(region_never, year, percentage, X2012:X2018, factor_key = TRUE)

hc_zero_int <- region_zero_long %>%
  hchart("bar", hcaes(x = "Region", y = "percentage", group = "year"))

saveWidget(hc_country, file = "country.html")
saveWidget(hc_disabledPeople, file = "disabledPeople.html")
saveWidget(hc_econAct, file = "econAct.html")
saveWidget(hc_income, file = "income.html")
saveWidget(hc_noInternet, file = "noInternet.html")
saveWidget(hc_never_int, file = "never_internet.html")
saveWidget(hc_zero_int, file = "zero_internet.html")
