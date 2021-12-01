# Analiza podatkov s programom R - 2021/22

Avtor: Nejc Jenko

##Analiza FPL Statistike

## Tematika

V sklopu mojega projekta si bom pogledal statistike igralcev v angleški Premier Ligi pregledal točke, ki so jih na podlagi te statistike dobili igralci v dosedanjih krogih Fantasy Premier League-a. Nato bom poskušal s pregledom statistike ekip in pričakovanih vrednosti statistike igralcev (xG - pričakovani goli, xA - pričakovane asistence,...) napovedati uspešnost igralcev v naslednjih krogih igre. S tem želim določiti optimalno izbiro za igralca igre na podlagi dosedaj znanih informacij.


## Podatki:

* **Statistika Igralcev** (Stoplci: Ime Igralca, Ekipa, Status, Goli, Asistence, xG90, xA90, xG90+xA90, xCS)
https://understat.com/league/EPL

* **Seznam PL Igralcev** (Stolpci: Ime Igralca, Ekipa, Pozicija, Nacionalnost)
https://www.premierleague.com/players

* **Statistika Ekip** (Stolpci: Ime Ekipe, Dani goli doma, Dani goli v gosteh, Prejeti goli doma, Prejeti goli v gosteh, xG, xGA)

* **Razpored tekem** (Stopci: Ekipa, Nasprotniki v vseh "Gameweekih")
https://fantasy.premierleague.com/fixtures/fdr


## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Potrebne knjižnice so v datoteki `lib/libraries.r`
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).
