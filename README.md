# SQL Projekt - Analýza Šíření Koronaviru v jednotlivých státech

Tento repozitář obsahuje SQL skript pro analýzu faktorů ovlivňujících rychlost šíření koronaviru na úrovni jednotlivých států. Následující README vám poskytne přehled o tom, jak projekt funguje a jak používat výslednou tabulku.

## Obsah Repozitáře

- `sql_script.sql`: SQL skript obsahující kód pro vytvoření databáze a generování výsledné tabulky.
- `README.md/`: Složka obsahující informace o projektu.
- 


## Jak Používat SQL Skript

1. Importujte SQL skript do svého databázového prostředí.
2. Spusťte skript pro vytvoření databáze a generování výsledné tabulky.

## Popis Projektu

Tento projekt analyzuje různé faktory, které mohou ovlivnit rychlost šíření koronaviru na úrovni jednotlivých států. Zahrnuje následující kroky:

1. Vytváření binární proměnné pro víkend / pracovní den a proměnné pro roční období.
2. Tvorba základní tabulky obsahující informace o nakažených, provedených testech, populaci a dalších ekonomických ukazatelích.
3. Přidání ekonomických ukazatelů, včetně HDP na obyvatele a GINI koeficientu.
4. Integrace dat o náboženství a vytvoření sloupců pro procentuální podíly různých náboženství.
5. Výpočet rozdílu mezi očekávanou dobou dožití v roce 1965 a v roce 2015 pro jednotlivé státy.
6. Tvorba průměrné denní teploty, počtu hodin s nenulovými srážkami a maximální síly větru během dne.
7. Vytváření finální tabulky obsahující všechny relevantní proměnné pro analýzu šíření koronaviru.

## Popis Výsledné Tabulky

Výsledná tabulka obsahuje následující sloupce:

- `country`: Název státu.
- `date`: Datum pozorování.
- `tests_performed`: Počet provedených testů.
- `population`: Počet obyvatel daného státu.
- `confirmed`: Počet potvrzených případů nákazy.
- `vikend_flag`: Binární proměnná pro víkend / pracovní den (1 pro víkend, 0 pro pracovní den).
- `rocni_obdobi`: Číslo ročního období (0 - Jaro, 1 - Léto, 2 - Podzim, 3 - Zima).
- `population_density`: Hustota zalidnění státu.
- `hdp_na_obyvatele`: HDP na obyvatele.
- `gini`: GINI koeficient.
- `mortaliy_under5`: Dětská úmrtnost.
- `median_age_2018`: Medián věku obyvatel v roce 2018.
- `Christianity`, `Islam`, `Judaism`, `Unaffiliated_Religions`, `Hinduism`, `Buddhism`, `Folk_religions`, `Other_religions`: Procentuální podíl jednotlivých náboženství na celkovém obyvatelstvu.
- `life_expectancy_difference`: Rozdíl mezi očekávanou dobou dožití v roce 1965 a v roce 2015.
- `pocet_hodin_srazek`: Počet hodin v daném dni, kdy byly srážky nenulové.
- `max_wind_gust`: Maximální síla větru v nárazech během dne.
- `prum_den_tep`: Průměrná denní teplota.







