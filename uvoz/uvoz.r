# 2. faza: Uvoz podatkov
library(RSelenium)
library(rvest)
library(XML)

# Tabla s seznamom igralcev in njihovimi državami
url <- 'https://www.premierleague.com/players'

driver <- rsDriver(browser=c("firefox"), port = 4445L)
remote_driver <- driver[["client"]]
remote_driver$navigate(url)
scroll_d <- remote_driver$findElement(using = "css", value = "body")
scroll_d$sendKeysToElement(list(key = "end"))

players_EPL <- read_html(scroll_d) %>% html_table(fill = TRUE) %>%
  .[[1]]

#players_EPL <- read_html(url) %>% html_table(fill=TRUE) %>% .[[1]]


# Tabela s statistikami
player_stats <- read.csv("Podatki/understat_player.csv", header = TRUE, skip = 2)
