# 2. faza: Uvoz podatkov

library(rvest)
library(XML)

url <- 'https://www.premierleague.com/players'
url2 <- "file:///Users/nejcjenko/Downloads/understat_player.csv.html"

players_EPL_22_23 <- read_html(url) %>% html_table(fill=TRUE) %>% .[[1]]

players_EPL_22_23_stats <- read_html(url2) %>% html_table(fill=TRUE) %>% .[[1]]
