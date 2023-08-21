# SQL Projekt - Analýza Šíření Koronaviru v Jednotlivých Státech

Tento repozitář obsahuje SQL skript a další relevantní informace pro analýzu faktorů ovlivňujících rychlost šíření koronaviru na úrovni jednotlivých států.

## Popis Projektu

### Zadání

Zadání projektu bylo získáno od kolegy statistika, který potřeboval pomoc s přípravou dat pro statistickou analýzu šíření koronaviru. Data budou použita pro vytvoření panelového modelu, který bude vysvětlovat denní nárůsty nakažených v jednotlivých zemích.

### Cíle Projektu

Cíle tohoto projektu zahrnují:
- Příprava dat z různých zdrojů.
- Vytvoření SQL databáze obsahující relevantní tabulky.
- Generování výsledné tabulky pro statistickou analýzu.

## Obsah Repozitáře

- `sql_script.sql`: SQL skript pro vytvoření databáze a generování výsledné tabulky.
- `data/`: Složka obsahující potřebná vstupní data.
- `docs/`: Složka obsahující dokumentaci a popisy výstupních dat.
- `LICENSE`: Licenční smlouva pro tento projekt.

## Použité Zdroje

Pro tento projekt byly použity následující zdroje dat:
- `countries`: Informace o jednotlivých státech.
- `economies`: Ekonomické údaje států.
- `life_expectancy`: Údaje o průměrné délce života obyvatel.
- `religions`: Informace o náboženství v jednotlivých státech.
- `covid19_basic_differences`: Základní údaje o COVID-19.
- `covid19_testing`: Informace o testování na COVID-19.
- `weather`: Meteorologická data.
- `lookup_table`: Tabulka s referenčními hodnotami.

## Jak Používat SQL Skript

1. Importujte SQL skript do svého databázového prostředí.
2. Spusťte skript pro vytvoření databáze a generování výsledné tabulky.

## Kontaktní Informace

Pro dotazy ohledně tohoto projektu mě kontaktujte na [vaše emailová adresa].

S pozdravem,

[Vaše Jméno]







# SQL_Project

Cílem zvoleného SQL skriptu bylo vytvořit flat tabulku, která obsahuje následující:
1. Časové proměnné
+ binární proměnná pro víkend / pracovní den
+ roční období daného dne (zakódujte prosím jako 0 až 3)
2. Proměnné specifické pro daný stát
+ hustota zalidnění - ve státech s vyšší hustotou zalidnění se nákaza může šířit rychleji
+ HDP na obyvatele - použijeme jako indikátor ekonomické vyspělosti státu
+ GINI koeficient - má majetková nerovnost vliv na šíření koronaviru?
+ dětská úmrtnost - použijeme jako indikátor kvality zdravotnictví
+ medián věku obyvatel v roce 2018 - státy se starším obyvatelstvem mohou být postiženy více
+ podíly jednotlivých náboženství - použijeme jako proxy proměnnou pro kulturní specifika. Pro každé náboženství v daném státě bych chtěl procentní podíl jeho příslušníků na celkovém obyvatelstvu
+ rozdíl mezi očekávanou dobou dožití v roce 1965 a v roce 2015 - státy, ve kterých proběhl rychlý rozvoj mohou reagovat jinak než země, které jsou vyspělé už delší dobu
3. Počasí (ovlivňuje chování lidí a také schopnost šíření viru)
+ průměrná denní (nikoli noční!) teplota
+ počet hodin v daném dni, kdy byly srážky nenulové
+ maximální síla větru v nárazech během dne

Finálně se připravená data statisticky vyhodnocují.

### SQL skript je obsažen v betaapp0.sql
