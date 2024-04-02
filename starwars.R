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


#Exploring data
#Data structure and types of variables

#view the msleep data frame about animals sleeping
View(msleep)
# to see the variables(colums), data type, and data in rows
glimpse(msleep)
#to see summary of first 6 rows
head(dataset)
# to see the data type of variable
class(dataframe$variable)
# number of variables(columns) in the dataframe
length(dataframe)
# to see how many observations or rows of a certain variable
length(dataframe$variable)
#to get a list of all of the variables so you can copy and paste
names(dataframe)
# to get a list of the unique observations or factors
#in a certain column or variable
#NA will mean missing data in a row
unique(dataframe$variable)

#create a variable to hold the rows with missing data
missing <- !complete.cases(dataframe)
#view all of the rows of missing data
dataframe[missing, ]
