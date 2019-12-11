users <- read.csv("data/users.csv", header = TRUE)
smartp <- read.csv("data/smart.csv", header = TRUE)
ongo <- read.csv("data/ongo.csv", header = TRUE)

hc_users <- users %>%
  hchart("bar", hcaes(x = "Age", y = "Percentage", group = "Time")) %>%
  hc_title(
    text = "<b>Frequency of internet use by age</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "Most adults aged 75 and over have not used the internet in the last three months",
              align = "left", style = list(color = "#2b908f", fontWeight = "bold")) 

hc_smartp <- smartp %>%
  hchart("bar", hcaes(x = "Age", y = "Percentage")) %>%
  hc_title(
    text = "<b>Smartphone use by age</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "Smartphone use still not as prevalent amongst elderly",
              align = "left", style = list(color = "#2b908f", fontWeight = "bold")) 

hc_ongo <- ongo %>%
  hchart("bar", hcaes(x = "Age", y = "Percentage")) %>%
  hc_title(
    text = "<b>Percentage of adults accessing internet away from home or work</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "Fewer individuals in older age groups report accessing internet on the go",
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

saveWidget(hc_users, file = "users.html")
saveWidget(hc_smartp, file = "smartp.html")
saveWidget(hc_ongo, file = "ongo.html")
saveWidget(hc_noInternet, file = "noInternet.html")
