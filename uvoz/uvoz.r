# 2. faza: Uvoz podatkov
library(RSelenium)
library(rvest)
library(XML)
library(dplyr)



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



# Tabela s statistikami - Gameweek 2
player_stats_GW2 <- read.csv("Podatki/player_stats_GW2.csv", header = TRUE, skip = 2) 
player_stats_GW2 <- player_stats_GW2[order(player_stats_GW2$player_name), ]

#Tabela s statistikami - Gameweek 3
player_stats_GW3 <- read.csv("Podatki/player_stats_GW3.csv", header = TRUE, skip = 2) 
player_stats_GW3 <- player_stats_GW3[order(player_stats_GW3$player_name), ]

# Tabela z igralci in nacionalnostmi
players_EPL <- read.csv("Podatki/PL_Players.csv", header = TRUE, skip = 2) 
players_EPL <- players_EPL[-c(4, 5)]
players_EPL <- players_EPL[order(players_EPL$Player), ]


# Združimo v tabelo statistiko GW3 in podatke o pozicijah ter nacionalnostih
# Left-join, saj je v tabeli z igralci veliko vec igralcev, ki še niso/ne bodo igrali
players_nat_goals <- merge(players_EPL, player_stats_GW3, by.x = 1, by.y = 2, all.y = T) %>% select(-21) %>% drop_na()

