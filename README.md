# INDONESIAN DEMOCRACY INDEX 

An R-based guide to exploring, critiquing and visualizing Democracy data in Indonesia, through a collection of publicly available data sources. The democracy data results have been collected from [the Central Bureau of Statistics of Indonesia](https://www.bps.go.id/id/statistics-table?subject=528/)Various functions of the appropriate R packages, I use to statisticize Indonesian democracy from 2009 to 2024.
Hopefully it will be a useful open-source & transparent guide to investigate the past and future state of Indonesian democracy. All work presented here can be reproduced in its entirety.

## [Indonesian Democracy Index (IDI) by Province 2009 - 2011](https://www.bps.go.id/id/statistics-table/2/NTk4IzI=/indeks-demokrasi-indonesia--idi--menurut-provinsi.html)

### Read Data Base
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

### Create Visualization Indonesian Democracy Index 2009 - 2011  
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


### Intrepetation Data about Indonesian Democracy 2009 - 2011

From the visualization results displayed, we can read the development of the level of democracy in each province in Indonesia during 2009 to 2011. If interpreted, the Papua Province Red Bar (2009) is longer than the green bar (2010) and blue (2011). This means that the Papua democracy index decreased from 2009 to 2011. In Aceh Province, the red bar (2009) and blue (2011) are slightly longer, indicating a slight increase in democracy in 2010, but then decreased in 2011.

## [New Methods: Indonesian Democracy Index (IDI) by Province 2021 - 2023 by Aspect of Freedom](https://www.bps.go.id/id/statistics-table/2/MjE2MCMy/-metode-baru--aspek-indeks-demokrasi-indonesia--idi--menurut-provinsi.html)

### Read Data Base

```{r}
library(knitr)

markdonw_table1 <- kable(idi2021_idi2023)
cat(markdown_table1)

```
|Province                        | X2023| X2022| X2021|
|:-------------------------------|-----:|-----:|-----:|
|Aceh                            | 85.71| 84.66| 85.50|
|North Sumatera                  | 83.12| 87.66| 88.51|
|West Sumatera                   | 72.15| 78.01| 76.19|
|Riau                            | 79.39| 84.46| 88.40|
|Jambi                           | 65.28| 77.13| 66.50|
|South Sumatera                  | 80.94| 86.78| 85.08|
|Bengkulu                        | 74.62| 68.95| 78.81|
|Lampung                         | 73.79| 79.90| 76.64|
|Bangka Belitung Island          | 68.34| 66.36| 68.80|
|Riau Island                     | 79.72| 88.34| 90.91|
|Special of Capital City Jakarta | 90.66| 87.39| 89.27|
|West Java                       | 87.97| 90.61| 89.71|
|Central Tengah                  | 85.84| 88.83| 87.90|
|Special of Region Yogyakarta    | 77.76| 87.35| 74.31|
|East Java                       | 87.29| 88.48| 88.11|
|Banten                          | 83.11| 83.80| 82.26|
|Bali                            | 85.23| 85.78| 84.62|
|West Nusa Tenggara              | 64.49| 76.75| 77.41|
|East Nusa Tenggara              | 90.05| 89.06| 87.99|
|West Kalimantan                 | 92.16| 91.35| 81.15|
|Centra Kalimantan               | 82.01| 82.05| 76.09|
|South Kalimantan                | 81.40| 80.70| 70.13|
|East Kalimantan                 | 83.00| 91.40| 89.46|
|North Kalimantan                | 84.59| 77.93| 82.78|
|North Sulawesi                  | 78.15| 77.76| 82.92|
|Central Sulawesi                | 87.11| 81.69| 92.76|
|South Sulawesi                  | 81.70| 83.39| 88.18|
|Southeast Sulawesi              | 71.72| 87.49| 79.28|
|Gorontalo                       | 81.68| 65.31| 81.57|
|West Sulawesi                   | 74.87| 67.78| 67.24|
|Maluku                          | 70.55| 74.49| 59.36|
|North Maluku                    | 65.58| 70.84| 80.61|
|West Papua                      | 72.89| 53.64| 82.47|
|Papua                           | 79.98| 67.23| 75.64|

### Create Visualization Indonesian Democracy by Aspect of Freedom Index 2021 - 2023 

```{r}
library(plotly)

fig <-plot_ly(idi2021_2023, x = ~X2021, y = ~Province, type = 'bar',
              name = '2021', orientation = 'h') %>%
  add_trace(x = ~X2022, name = '2022', orientation = 'h') %>%
  add_trace(x = ~X2023, name = '2023', orientation ='h') %>%
  layout(yaxis = list(title = 'Province'), xaxis = list(title = 'Index'),
         barmode = 'stack',
         title = list(text = "Index of Democracy in Indonesia 2021-2023",
                      x = 0.2,
                      pad =list(t = 5, b = 15)
                      ),
         margin = list(t = 25)
         )
fig

```
![Indonesia Democracy Index](./idiaspectoffreedom.png) 
### Intrepertation Indonesian Democracy by Aspect of Freedom Index 2021-2023

The graph you produced shows the Indonesian Democracy Index (IDI) for each province from 2021 to 2023. This data comes from the Indonesian Democracy Index (IDI) and the Central Statistics Agency (BPS). West Sulawesi; This province experienced an increase in its IDI score from 2021 to 2023, with the green bar being longer than the orange and blue bars.West Papua; There was significant fluctuation with the green bar (2023) being longer than the blue bar (2021), but there was a decline in 2022.
This graph helps provide an overview of how the level of democracy in various Indonesian provinces has changed over the past three years. This can be the basis for further analysis, for example to see what factors influenced the increase or decrease in the IDI score in a particular province.

## [New Methods: Indonesian Democracy Index (IDI) by Province 2023 by Aspect of Equality](https://www.bps.go.id/id/statistics-table/2/MjE2MCMy/-metode-baru--aspek-indeks-demokrasi-indonesia--idi--menurut-provinsi.html)

### Read Data Base

```r{}
library(knitr)

markdown_table2 <-kable(aspectofequality, format = "markdown")
cat(markdown_table2)
print(markdown_table2)

```
| Province|Label                           | Index|
|--------:|:-------------------------------|-----:|
|        1|Papua                           | 60.10|
|        2|West Papua                      | 72.52|
|        3|Aceh                            | 74.47|
|        4|Central Sulawesi                | 74.78|
|        5|North Maluku                    | 74.84|
|        6|Nusa Tenggara East              | 75.66|
|        7|Jambi                           | 76.91|
|        8|Maluku                          | 77.60|
|        9|Central Kalimantan              | 77.66|
|       10|North Sulawesi                  | 78.09|
|       11|West Kalimantan                 | 78.55|
|       12|Riau Island                     | 78.82|
|       13|Bangka Belitung Island          | 78.98|
|       14|Nusa Tenggara West              | 79.26|
|       15|Bengkulu                        | 79.27|
|       16|South Sulawesi                  | 79.52|
|       17|Riau                            | 80.13|
|       18|Central Java                    | 80.24|
|       19|Lampung                         | 80.48|
|       20|Banten                          | 80.59|
|       21|East Kalimantan                 | 81.08|
|       22|North Kalimantan                | 81.24|
|       23|West Sumatera                   | 81.48|
|       24|North Sumatera                  | 81.49|
|       25|West Sulawesi                   | 81.68|
|       26|South Sumatera                  | 82.14|
|       27|South Kalimantan                | 82.60|
|       28|East Jawa                       | 83.24|
|       29|Gorontalo                       | 83.32|
|       30|West Java                       | 83.63|
|       31|Bali                            | 85.75|
|       32|Special of Capital City Jakarta | 86.51|
|       33|Southeast Sulawesi              | 87.06|
|       34|Special of Region Yogyakarta    | 89.21|

### Create Visualization (Geom Text) Indonesian Democracy Index Aspect of Equality 2023

```r{}
library(ggplot2)
library(ggrepel)

ggplot(aspectofequality, aes(x = Province, y = Index)) + 
  geom_point(color = "white", size = 1) +
  geom_text_repel(aes(label = Label),  
                  color = "black", 
                  size = 3.5,
                  max.overlaps = 30) + 
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Index Democracy Province in Indonesia 2023 (Aspect of Equality)",
       subtitle = "Source: Indonesian Democracy Index (IDI) and Central Statistics Agency",
       x = "Province",
       y = "Index") + 
  ylim(min(aspectofequality$Index) - 10, max(aspectofequality$Index) + 10) +
  theme(plot.title = element_text(face="bold")) +
  theme_bw()
```

![Indonesia Democracy Index](./aspectofequality.png)

### Intrepretation Indonesian Democracy Index in Aspect of Equality 2023

The image you uploaded shows the 2023 Democracy Index in Indonesia in terms of equality. with the horizontal (X) axis showing the provinces and the vertical (Y) axis showing the index score for each province.
Each point on the graph represents the index value for a province, and the provinces are labeled on the graph. For example, Papua has an index score below 60 (the lowest value in the graph), while the Special Region of Yogyakarta is close to 100 (the highest value in the graph).
The red line shown is a regression or trend line, which shows how the general relationship between provinces and the democracy index in terms of equality. This line tends to rise, indicating that most provinces have higher democracy equality index scores.
Papua has the lowest index score, indicating challenges in terms of democracy equality in the province. The Special Region of Yogyakarta, Southeast Sulawesi, and the Special Region of Capital City Jakarta have the highest index scores, indicating better levels of democracy equality. Overall, the graph shows that there is variation in the equality index across provinces in Indonesia, but most provinces tend to have index scores in the range of 70 to 90.


## [New Methods: Indonesian Democracy Index (IDI) by Province 2009-2023](https://www.bps.go.id/id/statistics-table?subject=528)
I immediately tried to make a graph of the Indonesian democracy index from 2009 to 2023 using data from the Central Statistics Agency and the Indonesian Democracy Index.

### Read Data Base
```r{}
library(readxl)
library(knitr)

markdown_table3 <-kable(idi2009_2023, format = "markdown")
cat(markdown_table3)
print(markdown_table3)

```
| Years| Index|
|-----:|-----:|
|  2009| 67.30|
|  2010| 63.17|
|  2011| 65.48|
|  2012| 62.63|
|  2013| 63.72|
|  2014| 73.04|
|  2015| 72.82|
|  2016| 70.09|
|  2017| 72.11|
|  2018| 72.39|
|  2019| 74.92|
|  2020| 73.66|
|  2021| 78.12|
|  2022| 80.41|
|  2023| 79.51|

### Create Visualization Indonesian Index Democracy (IDI) 2009-2023
```r{}
library(ggplot2)
library(dplyr)

idi2009_20223 <-idi2009_2023 %>%
  mutate(Index = as.numeric(Index)) #conversion index to be come numeric

idi2009_2023 %>%
  tail(15) %>%
  ggplot(aes(x = Years, y = Index, group = 1)) +
  geom_line(aes(x = Years, y = Index), color = "black", size = 0.1) +
  geom_point(shape = 20, color = "black", size = 3) +
  geom_text(aes(label = round(Index, 2)),
            vjust = -1, hjust = 0.5, size = 3)+
  theme_test() +
  labs(title = "Indonesia Democracy Index 2009 - 2023",
       subtitle = "Source: Central Statistica Agency & IDI", 
       y = "Index",
       x = "Years") +
  scale_x_continuous(breaks = seq(2000, 2023, by = 1))

```

![Indonesia Democracy Index](./indonesiandemocracyindex2009-2023.png)

### Critical Indonesian Democracy Index 2009-2023
Indonesia's democracy index has increased drastically and remained stable from 2017 to 2020, reaching its highest peak of 80.41. After the highest peak, there was a decline in 2023, although it was still above 79, which indicates a problem in Indonesian democracy. The decline in the period from 2022 to 2023 is a signal that Indonesian democracy is not yet fully stable and is still vulnerable to political and social challenges.

## [New Method: Indicators Indonesian Democracy Index by Province 2021-2023](https://www.bps.go.id/id/statistics-table/2/MjE2MyMy/-metode-baru--indikator-indeks-demokrasi-indonesia--idi--tingkat-provinsi.html)

Based on the source of the Indonesian Democracy Index Province 2009 - 2023, Indonesian Democracy in 2023 experienced a decline from 2022 which obtained a value of 80.41. The following is a graphic analysis with the Indonesian Democracy Index Indicator on a Provincial Scale.

### Read Data Base 
```r{}
library(readxl)
indicatorindexdemocarcyprovince21.23 <-read_xlsx("/Users/mymac/Desktop/Data Github/indicatorindexdemocarcyprovince21-23.xlsx", sheet = "Sheet1") # import data
View(indicatorindexdemocarcyprovince21.23)


library(tidyr)
library(dplyr) make format long data
indicatorindexdemocarcyprovince21.23 <-indicatorindexdemocarcyprovince21_23 %>%
  pivot_longer(cols = c(`2021`, `2022`, `2023`),
               names_to = "Year",
               values_to = "Value")

library(knitr)
markdownindicatoridi21.23 <-kable(indicatorindexdemocarcyprovince21.23, format = "markdown")
cat(markdownindicatoridi21.23)
print(markdownindicatoridi21.23) #view result data markdown

```
|Democracy Indicators                                                                  |Year | Value|
|:-------------------------------------------------------------------------------------|:----|-----:|
|Freedom Between Governments                                                           |2021 | 84.00|
|Freedom Between Governments                                                           |2022 | 80.63|
|Freedom Between Governments                                                           |2023 | 84.87|
|Freedom Between Peoples                                                               |2021 | 76.28|
|Freedom Between Peoples                                                               |2022 | 74.10|
|Freedom Between Peoples                                                               |2023 | 74.90|
|Freedom of Belief                                                                     |2021 | 88.41|
|Freedom of Belief                                                                     |2022 | 86.15|
|Freedom of Belief                                                                     |2023 | 82.94|
|Freedom to Make Policies                                                              |2021 | 84.01|
|Freedom to Make Policies                                                              |2022 | 83.69|
|Freedom to Make Policies                                                              |2023 | 82.88|
|Guaranteed Right to Vote & be Election in Election                                    |2021 | 82.00|
|Guaranteed Right to Vote & be Election in Election                                    |2022 | 82.00|
|Guaranteed Right to Vote & be Election in Election                                    |2023 | 82.00|
|Fullfilment of Workers Right                                                          |2021 | 70.18|
|Fullfilment of Workers Right                                                          |2022 | 73.98|
|Fullfilment of Workers Right                                                          |2023 | 69.08|
|Freedom of Pers                                                                       |2021 | 77.71|
|Freedom of Pers                                                                       |2022 | 78.71|
|Freedom of Pers                                                                       |2023 | 75.69|
|Gender Equality                                                                       |2021 | 91.62|
|Gender Equality                                                                       |2022 | 92.36|
|Gender Equality                                                                       |2023 | 92.50|
|Public participation in influencing public policy through representative institutions |2021 | 77.38|
|Public participation in influencing public policy through representative institutions |2022 | 91.34|
|Public participation in influencing public policy through representative institutions |2023 | 86.22|
|Anti-monopoly of economic resources                                                   |2021 | 63.51|
|Anti-monopoly of economic resources                                                   |2022 | 65.31|
|Anti-monopoly of economic resources                                                   |2023 | 65.15|
|Poor people's access to social protection and security                                |2021 | 76.60|
|Poor people's access to social protection and security                                |2022 | 73.52|
|Poor people's access to social protection and security                                |2023 | 76.61|
|Equality Oportunities Jobs Region                                                     |2021 | 94.51|
|Equality Oportunities Jobs Region                                                     |2022 | 95.03|
|Equality Oportunities Jobs Region                                                     |2023 | 95.39|
|Society Access to Public Information                                                  |2021 | 71.90|
|Society Access to Public Information                                                  |2022 | 76.85|
|Society Access to Public Information                                                  |2023 | 77.75|
|Equality in Basic Policy                                                              |2021 | 72.66|
|Equality in Basic Policy                                                              |2022 | 73.21|
|Equality in Basic Policy                                                              |2023 | 73.46|
|Peformance of Legislation                                                             |2021 | 54.35|
|Peformance of Legislation                                                             |2022 | 54.36|
|Peformance of Legislation                                                             |2023 | 53.92|
|Performance of Yudication                                                             |2021 | 87.41|
|Performance of Yudication                                                             |2022 | 86.82|
|Performance of Yudication                                                             |2023 | 86.51|
|Election of Netrality                                                                 |2021 | 64.36|
|Election of Netrality                                                                 |2022 | 64.36|
|Election of Netrality                                                                 |2023 | 61.44|
|Decision of the State Administrative Court regarding government official policies     |2021 | 68.69|
|Decision of the State Administrative Court regarding government official policies     |2022 | 61.50|
|Decision of the State Administrative Court regarding government official policies     |2023 | 69.09|
|Environmental & Living Space Guarantee                                                |2021 | 72.21|
|Environmental & Living Space Guarantee                                                |2022 | 73.07|
|Environmental & Living Space Guarantee                                                |2023 | 73.36|
|Government Budget Transparency                                                        |2021 | 68.91|
|Government Budget Transparency                                                        |2022 | 83.61|
|Government Budget Transparency                                                        |2023 | 94.54|
|Performance Birocration and Public Services                                           |2021 | 78.02|
|Performance Birocration and Public Services                                           |2022 | 81.36|
|Performance Birocration and Public Services                                           |2023 | 72.85|
|Education Politics to Political Party                                                 |2021 | 54.27|
|Education Politics to Political Party                                                 |2022 | 73.45|
|Education Politics to Political Party                                                 |2023 | 54.02|

### Indicators Indonesian Democracy Index by Province 2021-2023
```r{}
library(ggplot2)

ggplot(indicatorindexdemocarcyprovince21.23, aes(x = Year, y = `Democracy Indicators`,
                                                 fill = Value)) +
  geom_tile(colour = "white", linewidth = 1)+
  scale_fill_gradient(low = "skyblue", high = "darkblue") +
  geom_text(aes(label = round(Value, 2)), color = 'black', size = 3.5) +
  theme_minimal()+
  labs(title = "Indicators Indonesian Democracy Index Source Province 2021-2023",
       subtitle ="Source: Central Statistica Agency & IDI") +
  theme(plot.title = element_text(face = "bold"))

```

![Indonesia Democracy Index](./indicatoridiprovince2021-2023.png)

### How to Read Changes in the Indonesian Democracy Index Indicator from 2021-2023
Stability: If an indicator shows almost the same color from 2021 to 2023, this indicates that the index value of the indicator has been relatively stable over the past three years. Increase: An indicator that shows a shift from a lighter color (lower value) to a darker color (higher value) from 2021 to 2023 indicates an increase in the index. Decrease Conversely, if the shift occurs from a dark color to a light color, this indicates a decrease in the democracy index on the indicator.


