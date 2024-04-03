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

#Selecting data and cleaning it
#Select variables or columns that you want to work with
starwars %>%
  select(name, height, mass)

#select columns 1, 2, and 3
starwars %>%
  select(1:3)

#to select columns that end in a certain word or string
starwars %>%
  select(ends_with("color"))

# Can select columns that end with 'color', can also do starts with and contains
starwars %>%
  select(ends_with("color"))

# Change the variable or column order
starwars %>%
  select(name, mass, height, everything())

#Change the variable name, change 'name' to 'character'
starwars %>%
  rename("characters" = "name") %>%
  head()

#Change the variable type
# To see what kind of variable hair_color is (it is a character variable)
class(starwars$hair_color)
# should give you result "character"
# to assign it or let R know it is a categorical character or string
starwars$hair_color <- as.factor(starwars$hair_color)
class(starwars$hair_color)
# should see result as "factor"

# Another way to change the type is using function mutate, it means to change
# or write over. Here change hair_color back to a character type from factor
starwars %>%
  mutate(hair_color = as.character(hair_color)) %>%
  glimpse()

#Changing factor levels, factor automatically are sorted in alphabetical order,
#but sometimes you don't want them to do that like months of the year
# Create a new dataframe and assign it to starwars
df <- starwars
# Make the sex variable a factor
df$sex <- as.factor(df$sex)
# Ask for the levels(df$sex), in other words, the type of sexes
levels(df$sex)
# these will automatically be in alphabetical order
# if you want to change the default order, you need to mutate the factors
df <- df %>%
  mutate(sex = factor(sex, levels = c("male", "female", "hermaphroditic", "none"
         )))
levels(df$sex)

# Filter rows
starwars %>%
  # select or highlight the columns that you want
  select(mass, sex) %>%
  # filter out the rows you want by a condition to be met
  filter(mass < 55 & sex == "male")

# To change the names of row observations, ex. change male to man
starwars %>%
  select(sex) %>%
  mutate(sex = recode(sex, "male" = "man", "female" = "woman"))

# Dealing with missing data ( mean will return NA if there is missing data)
mean(starwars$height, na.rm = TRUE)

#Dealing with duplicates
Names <- c("Peter", "John", "Andrew", "Peter")
Age <- c(22, 33, 44, 22)
friends <- data.frame(Names, Age)
friends %>%
  distinct()

# Manipulate data========

#Create or change a variablstarware (mutate)
starwars %>%
  mutate(height_m = height/100) %>%
  select(name, height, height_m)

  
