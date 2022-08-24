# 2. faza: Uvoz podatkov
library(RSelenium)
library(rvest)
library(XML)
library(dplyr)

#=============================================================

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

#=============================================================
#=============================================================

# Tabela s statistikami - Gameweek 2
player_stats_GW2 <- read.csv("Podatki/player_stats_GW2.csv", header = TRUE, skip = 2, , fileEncoding = "utf8") 
player_stats_GW2 <- player_stats_GW2[order(player_stats_GW2$player_name), ]

#=============================================================
#=============================================================

#Tabela s statistikami - Gameweek 3
player_stats_GW3 <- read.csv("Podatki/player_stats_GW3.csv", header = TRUE, skip = 2, fileEncoding = "utf8") 
player_stats_GW3 <- player_stats_GW3[order(player_stats_GW3$player_name), ]

#=============================================================
#=============================================================

# Tabela z igralci in nacionalnostmi
players_EPL <- read.csv("Podatki/PL_Players.csv", header = TRUE, skip = 2, fileEncoding = "utf8") 
players_EPL <- players_EPL[-c(4, 5)]
players_EPL <- players_EPL[order(players_EPL$Player), ]

#=============================================================
#=============================================================

# Združimo v tabelo statistiko GW3 in podatke o pozicijah ter nacionalnostih
# Left-join, saj je v tabeli z igralci veliko vec igralcev, ki še niso/ne bodo igrali
players_nat_goals <- merge(players_EPL, player_stats_GW3, by.x = 1, by.y = 2, all.y = T) %>% 
  select(-21) %>% 
  drop_na()

#=============================================================
#=============================================================

#Get the table with team stats from the website 
url <- "https://fbref.com/en/comps/9/Premier-League-Stats"
team_stats <- read_html(url) %>% 
  html_table(fill=TRUE) %>% 
  .[[3]]

header <- as.character(as.vector(team_stats[1,]))
names(team_stats) <- header
team_stats <- team_stats[-1, ]


#=============================================================
# Write the tables I intend to use
#=============================================================

tabela1 <- players_nat_goals %>% select("Player", "Nationality", "team_title", "Position", "goals", "assists")
tabela1 %>% write.csv("podatki/Tabela1.csv", fileEncoding = "utf8")

#=============================================================

tabela2_1 <- player_stats_GW2 %>% select("player_name", "goals", "assists", "xG", "xA")
colnames(tabela2_1)[2] <- "goals_GW2"
colnames(tabela2_1)[3] <- "assists_GW2"
colnames(tabela2_1)[4] <- "xG_GW2"
colnames(tabela2_1)[5] <- "xA_GW2"

tabela2_2 <- player_stats_GW3 %>% select("player_name", "goals", "assists", "xG", "xA")
colnames(tabela2_2)[2] <- "goals_GW3"
colnames(tabela2_2)[3] <- "assists_GW3"
colnames(tabela2_2)[4] <- "xG_GW3"
colnames(tabela2_2)[5] <- "xA_GW3"

tabela2 <- merge(tabela2_1, tabela2_2, all.x = T)
tabela2 %>% write.csv("podatki/Tabela2.csv", fileEncoding = "utf8")

#=============================================================


