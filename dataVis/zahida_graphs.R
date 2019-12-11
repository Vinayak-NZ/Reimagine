home_emp <- read.csv("data/home_emp.csv", header = TRUE)
home_soc <- read.csv("data/home_soc.csv", header = TRUE)

hc_emp <- home_emp %>% 
  hchart('column', hcaes(x = 'Job.Status', y = 'Percentage')) %>%
  hc_title(
    text = "<b>Percentage of those with home internet access by job status</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "Those unemployed or not participating in the labour force are less likely to have internet access",
              align = "left", style = list(color = "#2b908f", fontWeight = "bold")) 

hc_soc <- home_soc %>% 
  hchart('column', hcaes(x = 'Social.Grade', y = 'Percentage')) %>%
  hc_title(
    text = "<b>Percentage of those with home internet access by social grade</b>",
    margin = 20, align = "left",
    style = list(color = "#90ed7d", useHTML = TRUE)
  ) %>%
  hc_subtitle(text = "Those in lower social grades are less likely to have internet access",
              align = "left", style = list(color = "#2b908f", fontWeight = "bold")) 

saveWidget(hc_emp, file = "empStat.html")
saveWidget(hc_soc, file = "socGrade.html")