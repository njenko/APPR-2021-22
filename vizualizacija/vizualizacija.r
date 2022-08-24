# 3. faza: Vizualizacija podatkov

library(dplyr)
#=============================================================
# Podatki
#=============================================================

podatki1 <- read.csv("podatki/Tabela1.csv", fileEncoding = "utf8")
podatki2 <- read.csv("podatki/Tabela2.csv", fileEncoding = "utf8")

#=============================================================

# Tablea, s številom golov po državah

tabela1 <- podatki1 %>%
  select(c("Nationality", "goals")) %>% 
  group_by(Nationality) %>%
  summarise(Goals = sum(goals)) %>%
  subset(Goals != 0)


#graf1 = tabela1 %>%

ggplot(tabela1, aes(x = Nationality, y = Goals)) +
  geom_bar(stat =  "identity", fill="steelblue")+
  geom_text(aes(label=Goals))+
  theme_minimal()







