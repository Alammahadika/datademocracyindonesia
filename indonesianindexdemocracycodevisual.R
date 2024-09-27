# INDONESIAN DEMOCRACY INDEX CODE FOR VISUAL 

                    # (1) Indonesia Democracy Index 2009 - 2011

# Read Data Table
library(knitr)
markdown_table <-kable(idi2009_2011, format = "markdown")

cat(markdown_table)

#View data
print(markdown_table)


# Create Visual 
library(ggplot2)
library(tidyr)

idi2009_2011 <- read_xlsx("/Users/mymac/Desktop/Data Github/idi2009_2011.xlsx")

print(idi2009_2011)


idi2009_2011_long <- idi2009_2011 %>%
  pivot_longer(cols = c('2009','2010','2011'), names_to = 'Year', values_to = 'Index')

#Plot the data
ggplot(idi2009_2011_long, aes(x = reorder(Province, -Index), y = Index, fill = Year)) +
  geom_bar(stat = "identity", position = position_dodge(width = 0.7)) +
  coord_flip() +
  labs(title = "Indonesia Democracy Index 2009-2011",
       subtitle = "Source: Central Statistica Agency",
       x = "Province",
       y = "Index",
       fill = "Year") +
  theme_minimal() 


        # (2) Index Democracy Province in Indonesia 2023 (Aspects of Freedom)

# Read Data Markdown
library(knitr)

markdown_table1 <- kable(idi2021_2023)
cat(markdown_table1)

#View data
print(markdown_table1)

# Create Visual 

library(plotly)

fig <-plot_ly(idi2021_2023, x = ~X2021, y = ~Province, type = 'bar',
              name = '2021', orientation = 'h',
              text = ~paste('2021'), textposition = 'auto') %>%
  add_trace(x = ~X2022, name = '2022', orientation = 'h',
            text = ~paste('2022'), textposition = 'auto') %>%
  add_trace(x = ~X2023, name = '2023', orientation ='h',
            text = ~paste('2023'), textposition = 'auto') %>%
  layout(yaxis = list(title = 'Province'), xaxis = list(title = 'Index'),
         barmode = 'stack',
         title = list(text = "Index Democracy Province in Indonesia 2023 (Aspects of Freedom)",
                      x = 0.2,
                      pad =list(t = 5, b = 15)
         ),
         margin = list(t = 25)
  )
fig

          # (3) Index Democracy Province in Indonesia 2023 (Aspect of Equality)


# Read Data Base

library(knitr)

markdown_table2 <-kable(aspectofequality, format = "markdown")
cat(markdown_table2)
print(markdown_table2)


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




                  # (4) Indonesian Democracy Index (IDI) 2009 - 2023

# Read Data Base
library(readxl)
library(knitr)

markdown_table3 <-kable(idi2009_2023, format = "markdown")
cat(markdown_table3)
print(markdown_table3)


#Create Data Visualization
library(ggplot2)
library(dplyr)


idi2009_2023 <- idi2009_2023 %>%
  mutate(Index = as.numeric(Index))

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


                #(5) Indicator Indonesian Democracy Index 2021-2023

# Import Data 
library(readxl)
indicatorindexdemocarcyprovince21.23 <-read_xlsx("/Users/mymac/Desktop/Data Github/indicatorindexdemocarcyprovince21-23.xlsx", sheet = "Sheet1")

# Format Long Data FORMAT LONG DATA !!!
library(tidyr)
library(dplyr)

indicatorindexdemocarcyprovince21.23 <-indicatorindexdemocarcyprovince21_23 %>%
  pivot_longer(cols = c(`2021`, `2022`, `2023`),
               names_to = "Year",
               values_to = "Value")

# Read Data 
library(knitr)

View(indicatorindexdemocarcyprovince21.23)
markdownindicatoridi21.23 <-kable(indicatorindexdemocarcyprovince21.23, format = "markdown")
cat(markdownindicatoridi21.23)
print(markdownindicatoridi21.23)


# Create Heat map

library(ggplot2)

ggplot(indicatorindexdemocarcyprovince21.23, aes(x = Year, y = `Democracy Indicators`,
                                                 fill = Value)) +
  geom_tile(colour = "white", linewidth = 1)+
  scale_fill_gradient(low = "skyblue", high = "darkblue") +
  geom_text(aes(label = round(Value, 2)), color = 'white', size = 3.5) +
  theme_minimal()+
  labs(title = "Indicators Indonesian Democracy Index Source Province 2021-2023",
       subtitle ="Source: Central Statistica Agency & IDI") +
  theme(plot.title = element_text(face = "bold"))


