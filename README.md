# INDONESIAN DEMOCRACY INDEX 

An R-based guide to exploring, critiquing and visualizing Democracy data in Indonesia, through a collection of publicly available data sources. The democracy data results have been collected from [the Central Bureau of Statistics of Indonesia](https://www.bps.go.id/id/statistics-table?subject=528/)Various functions of the appropriate R packages, I use to statisticize Indonesian democracy from 2009 to 2024.
Hopefully it will be a useful open-source & transparent guide to investigate the past and future state of Indonesian democracy. All work presented here can be reproduced in its entirety.

## Indonesian Democracy Index (IDI) by Province 2009 - 2011

```{r}
library(readxl)
library(knitr)

idi_data <-read_excel("idi2009-2011.csv)

head(idi_data)

markdown_table <- kable(idi_data, format = "markdown")
cat(markdown_table)

```




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

