# 2. faza: Uvoz podatkov
library(RSelenium)
library(rvest)
library(XML)

# Tabla s seznamom igralcev in njihovimi državami
url <- 'https://www.premierleague.com/players'

#Start the web driver 
driver <- rsDriver(browser=c("firefox"), port = 4445)
#Say 'I'm a client'    
remote_driver <- driver[["client"]]
#Send to browser the web site address    
remote_driver$navigate(url)
#Find in the css enviroment the body   
scroll_d <- remote_driver$findElement(using = "css", value = "body")
#send to the browser to go to the end of the page
scroll_d$sendKeysToElement(list(key = "end"))

players_EPL <- read_html(remote_driver) %>% html_table(fill=TRUE) %>% .[[1]]


# Tabela s statistikami
player_stats <- read.csv("Podatki/understat_player.csv", header = TRUE, skip = 2)
