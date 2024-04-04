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

#Create or change a variable (mutate)
starwars %>%
  mutate(height_m = height/100) %>%
  select(name, height, height_m)

#Conditional change (if_else)
starwars %>%
  mutate(height_m = height/100) %>%
  select(name, height, height_m) %>%
  mutate(tallness =
           if_else(height_m < 1,
                   "short",
                   "tall"))

# Reshape data with Pivot wider
#dataset is in long format and we want to consolidate by year
library(gapminder)
view(gapminder)
data <- select(gapminder, country, year, lifeExp)
wide_datat <- datat %>%
  pivot_wider(names_from = year, values_frome = lifeExp)
View(wide_data)

# to do the reverse of above
#reshape data with Pivot longer
long_data <- wide_data %>%
  pivot_longer(2:13,
    names_to = "year",
    values_to = "lifeExp"
  )
View(long_data)

# Describing your data
View(msleep)
# Range / spread
min(msleep$awake)
max(msleep$awake)
range(msleep$awake)
# QR stands for Interquartile Range. It is a measure of statistical
#dispersion that represents the range between the first
#quartile (Q1) and the third quartile (Q3) of a dataset
IQR(msleep$awake)

#Centrality
mean(msleep$awake)
median(msleep$awake)

# Variance is a measure of statistical dispersion that
# quantifies the spread or variability of a dataset.
# It measures how much the values in a dataset deviate
# from the mean.
var(msleep$awake)

# To get a summary of the statistical descriptions
summary(msleep$awake)
# if you just want a summary for 2 variables
msleep %>%
  select(awake, sleep_total) %>%
  summary()

# Summarize your data
msleep %>%
  # drop missing values from vore
  drop_na(vore) %>%
  # group all of the vore types
  group_by(vore) %>%
  # Create new variable or column headings
  summarise(Lower = min(sleep_total),
            Average = mean(sleep_total),
            Upper = max(sleep_total),
            Difference =
            max(sleep_total)-min(sleep_total)) %>%
  arrange(Average) %>%
  View()

# Create tables
# will count the number of observation types in a column
table(msleep$vore)
# to see how many of the vores are Rodents and h.m. Primates
msleep %>%
  # select the vore and order columns
  select(vore, order) %>%
  # filter the order column by Rodentia and Primates
  filter(order, %in% c("Rodentia", "Primates")) %>%
  table()

#Visualise data
############################

plot(pressure)

# The grammar of graphics
 # data
 # mapping
 #geometry

 # Bar plots
 # ggplot is the function but ggplot2 is the library
 # is in tidyverse
 # code creates a bar chart of the count of each gender
 ggplot(data = starwars,
 #aes means estetics like mapping on an x and y access
   mapping = aes(x = gender)) + geom_bar()

#Histograms
# consists of a series of adjacent rectangular bars, where
#the width of each bar represents the range of values, and the
# height represents the frequency or count of observations
#falling within that range
starwars %>%
  drop_na(height) %>%
  ggplot(mapping = aes(x = height)) +
  geom_histogram()

# this is the same as above
starwars %>%
  drop_na(height) %>%
  ggplot(aes(height)) +
  geom_histogram()
