disabledPeople <- read.csv("data/disabledPeople.csv", header = TRUE)
econAct <- read.csv("data/economicactivity.csv", header = TRUE)

disabledPeople.melt <- melt(disabledPeople, id = "Year")
disabledPeople.melt <- disabledPeople.melt %>% dplyr::rename(percentage = value)
hc_disabledPeople <- disabledPeople.melt %>% 
  hchart('line', hcaes(x = 'Year', y = 'percentage', group = "variable")) %>%
  hc_title(
    text = "<b>Percentage of internet non-users over time and by disability status</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "Disabled people are far more likely to be disengaged from digital",
              align = "left", style = list(color = "#2b908f", fontWeight = "bold")) 

hc_econAct <- econAct %>% 
  hchart('column', hcaes(x = 'Economic.Activity', y = 'Percentage')) %>%
  hc_title(
    text = "<b>Percentage of internet non-users by economic activity</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "Sick or disabled people are less likely to have internet access",
              align = "left", style = list(color = "#2b908f", fontWeight = "bold")) 

saveWidget(hc_disabledPeople, file = "disabledPeople.html")
saveWidget(hc_econAct, file = "econAct.html")
