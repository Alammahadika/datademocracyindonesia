# INDONESIAN DEMOCRACY INDEX 

An R-based guide to exploring, critiquing and visualizing Democracy data in Indonesia, through a collection of publicly available data sources. The democracy data results have been collected from [the Central Bureau of Statistics of Indonesia](https://www.bps.go.id/id/statistics-table?subject=528/)Various functions of the appropriate R packages, I use to statisticize Indonesian democracy from 2009 to 2024.
Hopefully it will be a useful open-source & transparent guide to investigate the past and future state of Indonesian democracy. All work presented here can be reproduced in its entirety.

## Indonesian Democracy Index (IDI) by Province 2009 - 2011 

### [Read Data Base](https://www.bps.go.id/id/statistics-table/2/NTk4IzI=/indeks-demokrasi-indonesia--idi--menurut-provinsi.html)
```{r}
library(knitr)
markdown_table <-kable(idi2009-2011, format = "markdown")
cat(markdown_table)
print(markdown_table)

```
|Province                     |  2009|  2010|  2011|
|:----------------------------|-----:|-----:|-----:|
|Aceh                         | 66.29| 65.36| 55.54|
|North Sumatera               | 60.20| 63.45| 66.15|
|West Sumatera                | 60.29| 63.04| 65.02|
|Riau                         | 75.85| 71.45| 70.65|
|Jambi                        | 71.00| 65.88| 70.46|
|South Sumatera               | 72.52| 73.65| 67.92|
|Bengkulu                     | 64.76| 70.78| 71.36|
|Lampung                      | 67.47| 67.80| 74.08|
|Bangka Belitung Island       | 67.01| 65.94| 67.13|
|Riau Island                  | 73.61| 62.89| 70.78|
|Jakarta                      | 73.91| 77.44| 77.81|
|West Java                    | 71.07| 59.41| 66.18|
|Central Java                 | 66.45| 63.42| 65.59|
|Special Region of Yogyakarta | 67.55| 74.33| 71.67|
|East Java                    | 62.49| 55.12| 55.98|
|Banten                       | 67.98| 60.60| 67.37|
|Bali                         | 70.35| 72.44| 74.20|
|West Nusa Tenggara           | 58.12| 58.13| 54.49|
|East Nusa Tenggara           | 71.64| 72.05| 72.34|
|West Kalimantan              | 72.38| 69.32| 74.86|
|Central Kalimantan           | 77.63| 71.10| 76.28|
|South Kalimantan             | 66.63| 70.94| 66.47|
|East Kalimantan              | 72.31| 73.04| 66.37|
|North Kalimantan             |  0.00|  0.00|  0.00|
|North Sulawesi               | 70.94| 65.94| 71.19|
|Central Sulawesi             | 66.02| 66.63| 64.00|
|South Sulawesi               | 61.48| 56.67| 65.31|
|Southeast Sulawesi           | 64.29| 54.79| 57.56|
|Gorontalo                    | 73.50| 64.97| 62.77|
|West Sulawesi                | 67.99| 68.82| 66.36|
|Maluku                       | 69.07| 69.51| 68.38|
|North Maluku                 | 67.21| 59.92| 59.17|
|West Papua                   | 63.06| 67.75| 61.78|
|Papua                        | 63.80| 60.26| 59.05|

### Create Visual 
```{r}
library(ggplot2)
library(tidyr)

ggplot(idi2009_2011_long, aes(x = reorder(Province, -Index), y = Index, fill = Year)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7)) +
  coord_flip() +
  labs(title = "Indonesia Democracy Index 2009-2011",
       subtitle = "Source: Central Statistica Agency",
       x = "Province",
       y = "Index",
       fill = "Year") +
  theme_minimal()

````
![Indonesia Democracy Index](./indonesiademocracyindex1.png)


### Decriptive about Indonesian Democracy 2009 - 2011

