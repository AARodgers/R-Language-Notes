#call on tidyverse packages
library(tidyverse)

# View the data frame from original data, from SWAPI, the Star Wars API,
#https://swapi.py4e.com/, has been revised to reflect additional research into
#gender and sex determinations of characters.
View(starwars)
?starwars

# Get height and mass data and view in a plot
starwars %>%
  #filter is by the rows or observations
  filter(height > 150 & mass < 200) %>%
  #change the height from cm to meters
  mutate(height_in_meters = height/100) %>%
  #select the height_in_meters column and mass column to work with
  select(height_in_meters, mass) %>%
  # sort by mass smallest to largest
  arrange(mass) %>%
  # view the table
  #View()
  # put into a scatter plot
  plot()

  
