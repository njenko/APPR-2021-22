# Analiza podatkov s programom R - 2021/22

Avtor: Nejc Jenko

## Analiza FPL Statistike

## Tematika

V sklopu mojega projekta si bom pogledal statistike igralcev v angleški Premier Ligi, pregledal točke, ki so jih na podlagi te statistike dobili igralci v dosedanjih krogih Fantasy Premier League-a. Nato bom poskušal s pregledom statistike ekip in pričakovanih vrednosti statistike igralcev (xG - pričakovani goli, xA - pričakovane asistence,...) napovedati uspešnost igralcev v naslednjih krogih igre. S tem želim določiti optimalno izbiro za igralca igre na podlagi dosedaj znanih informacij.


## Podatki:

1. **Statistika Igralcev** (https://understat.com/league/EPL)
    * `Ime Igralca`
    * `Odigrane tekme`
    * `Odigrane minute`
    * `Goli`
    * `xG90` - Pričakovani goli
    * `Asistence`
    * `xA90` - Pričakovane asistence
    * `xG90+xA90` - Pričakovano sodelovanje pri golih
    * `xCS` - Pričakovanje "cleen sheet-a"


2. **Seznam PL Igralcev** (https://www.premierleague.com/players)
    * `Ime Igralca`
    * `Pozicija` (GK, DEF, MID, FWD)
    * `Nacionalnost`



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
