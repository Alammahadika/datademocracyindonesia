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


## Create circular graph analysis visual

 library(ggplot2)
   library(dplyr)
   library(tidyr)
   
   # Create a data frame from the provided data
   data <- data.frame(
     Category = c('Democracy Status', 'Stateness', 'Monopoly\n on the use of force', 'State Identity', 'No Interferences Religion Dogma', 'Basic Information',
                  'Political Participation', 'Free and fair election', 'Effective power to govern', 'Association / assembly rights', 'Freedom Experience',
                  'Rule of Law', 'Separation of powers', 'Independent judiciary', 'Prosecution of office abuse', 'Civil rights',
                  'Stability of Democratic Institutions', 'Performance of democratic institutions', 'Commitment to democratic institutions',
                  'Political and Social Integration', 'Party system', 'Interest groups', 'Approval of democracy', 'Social capital',
                  'Economy Status', 'Level of Socioeconomic Development', 'Socioeconomic barriers',
                  'Organization of the Market and Competition', 'Market organization', 'Competition policy', 'Liberalization of foreign trade',
                  'Banking system', 'Monetary and Fiscal Stability', 'Monetary stability', 'Fiscal stability',
                  'Private Property', 'Property rights', 'Private enterprise',
                  'Welfare Regime', 'Social safety nets', 'Equal opportunity',
                  'Economic Performance', 'Output strength', 'Sustainability', 'Environmental policy', 'Education / R&D policy',
                  'Governance Index', 'Level of Difficulty', 'Structural constraints', 'Civil society traditions', 
                  'Conflict intensity', 'GNI p.c. Atlas method rescaled','UN Educ. Index rescaled',
                  'Governance Performance','Steering Capability','Prioritization','Implementation','Policy learning',
                  'Resource Efficiency','Efficient use of assets','Policy coordination','Anti-corruption policy',
                  'Consensus-Building','Consensus on goals','Anti-democratic actors','Cleavage / conflict management','Public consultation','Reconciliation',
                  'International Cooperation','Effective use of support','Credibility','Regional cooperation'),
     Score = c(6.3, 6.5, 7, 7, 5, 7, 5.8, 8, 6, 5, 4, 6, 8, 5, 5, 6, 6.5, 7, 6, 6.8, 6, 7, 7, 7,
               6.7, 5, 5, 6.5, 6, 5, 7, 8, 7.5, 8, 8, 6, 6, 6,
               5.5, 6, 5,
               8, 8, 4, 3, 5,
               5.48, 5.1, 5.1, 6,
               5, 6 ,3,
               6.15 ,6.3 ,7 ,6 ,6,
               5 ,5 ,6 ,4,
               5.6 ,6 ,5 ,6 ,6 ,5,
               7.7 ,7 ,8 ,8)
   )
 
   print(data)
 
   # Assign colors based on Category
data <- data %>%
mutate(Color = case_when(
  Category %in% c('Democracy Status', 'Stateness', 'Monopoly\n on the use of force', 'State Identity', 'No Interferences Religion Dogma', 'Basic Information',
                       'Political Participation', 'Free and fair election', 'Effective power to govern', 'Association / assembly rights', 'Freedom Experience',
                       'Rule of Law', 'Separation of powers', 'Independent judiciary', 'Prosecution of office abuse', 'Civil rights',
                       'Stability of Democratic Institutions', 'Performance of democratic institutions', 'Commitment to democratic institutions',
                       'Political and Social Integration', 'Party system', 'Interest groups', 'Approval of democracy', 'Social capital') ~ 'darkred',
  Category %in% c('Economy Status', 'Level of Socioeconomic Development', 'Socioeconomic barriers',
                       'Organization of the Market and Competition', 'Market organization', 'Competition policy', 'Liberalization of foreign trade',
                       'Banking system', 'Monetary and Fiscal Stability', 'Monetary stability', 'Fiscal stability',
                       'Private Property', 'Property rights', 'Private enterprise',
                       'Welfare Regime', 'Social safety nets', 'Equal opportunity',
                       'Economic Performance', 'Output strength', 'Sustainability', 'Environmental policy', 'Education / R&D policy') ~ 'darkblue',
       TRUE ~ 'darkgreen'
     )) %>%
     mutate(id = row_number()) %>%
     arrange(id)
   
   # Add more empty bars for spacing
   empty_bar <- 20
   to_add <- matrix(NA, empty_bar, ncol(data))
   colnames(to_add) <- colnames(data)
   data <- rbind(data, to_add)
   data$id <- seq(1, nrow(data))
 
 print(data)  
     
   # Create the plot
   label_data <- data
   number_of_bar <- nrow(data)
   angle <- 90 - 360 * (label_data$id - 0.5) / number_of_bar
   label_data$hjust <- ifelse(angle < -90, 1, 0)
   label_data$angle <- ifelse(angle < -90, angle + 180, angle)
   
   p <- ggplot(data, aes(x = as.factor(id), y = Score, fill = Color)) +      
     geom_bar(stat = "identity", color = "white") +
     scale_fill_identity() +
     ylim(-15, 10) +  # Adjust to make the circle fuller
     theme_bw() +
     theme(
       axis.text = element_blank(),
       axis.title = element_blank(),
       panel.grid = element_blank(),
       plot.margin = unit(rep(-2, 4), "cm") 
     ) +
     coord_polar(start = 0) + 
     # Display Category names
     geom_text(data = label_data, aes(x = id, y = Score + 1.5, label = Category, hjust = hjust), color = "black", fontface = "bold", alpha = 0.7, size = 1.5, angle = label_data$angle, inherit.aes = FALSE) +
     # Display Score values
     geom_text(aes(x = as.factor(id), y = Score - 0.5, label = Score), color = "white", size = 2) +
     # Add central legend
     annotate("text", x = 0, y = -12, label = "Indonesia Transformation Index 2024", color = "black", fontface = "bold", size = 3) +
     annotate("text", x = 0, y = -13, label = "Political Transformation", color = "darkred",fontface = "bold", size = 2) +
     annotate("text", x = 0, y = -14, label = "Economic Transformation", color = "darkblue",fontface = "bold", size = 2) +
     annotate("text", x = 0, y = -15, label = "Governance", color = "darkgreen", fontface = "bold", size = 2) 
     
   print(p)





