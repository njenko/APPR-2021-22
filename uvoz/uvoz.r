# 2. faza: Uvoz podatkov
library(RSelenium)
library(rvest)
library(XML)



# # Tabla s seznamom igralcev in njihovimi državami
# url <- 'https://www.premierleague.com/players'
# 
# driver <- rsDriver(browser=c("firefox"), port = 4445L)
# remote_driver <- driver[["client"]]
# remote_driver$navigate(url)
# scroll_d <- remote_driver$findElement(using = "css", value = "body")
# scroll_d$sendKeysToElement(list(key = "end"))
# 
# players_EPL <- read_html(scroll_d) %>% html_table(fill = TRUE) %>%
#   .[[1]]
# 
# #players_EPL <- read_html(url) %>% html_table(fill=TRUE) %>% .[[1]]



# Tabela s statistikami
player_stats_GW2 <- read.csv("Podatki/understat_player.csv", header = TRUE, skip = 2) 
player_stats_GW2 <- player_stats[order(player_stats$player_name), ]

# Tabela z igralci in nacionalnostmi
players_EPL <- read.csv("Podatki/PL_Players.csv", header = TRUE, skip = 2) 
players_EPL <- players_EPL[-c(4, 5)] #%>% rename(player_name = Player) 
players_EPL <- players_EPL[order(players_EPL$Player), ]

str(player_stats)
str(players_EPL)

players_nat_goals <- merge(players_EPL, player_stats, by.x = 1, by.y = 2, all.y = T)
