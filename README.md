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
