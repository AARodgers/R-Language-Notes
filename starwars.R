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
()# to see how many of the vores are Rodents and h.m. Primates
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

# Box plots
# graphical representation of the distribution of numerical
#data through five key summary statistics. These statistics
#are the minimum, first quartile (Q1), median (or second
#quartile, Q2), third quartile (Q3), and maximum.
starwars %>%
 drop_na(height) %>%
 ggplot(mapping = aes(x = height)) +
 geom_boxplot(fill = "steelblue") +
 theme_bw() +
 labs(title = "Boxplot of height",
      x = "Heght of character")

# Density Plots
# the probability of an observation at any particular value
starwars %>%
  drop_na(height) %>%
  filter(sex %in% c("male", "female")) %>%
  ggplot(mapping = aes(x = height,
                    color =sex,
                    fill = sex)) +
  # alpha is how dark the coloring is
  geom_density(alpha = .02)+
  theme_bw

# Scatter plots
starwars %>%
  filter(mass < 200) %>%
  # x axis is height, y is mass, colored by sex
  ggplot(aes(height, mass, color = sex)) +
  # geom_point is the scatter plot
  geom_point(size = 5, alpha = 0.5)+
  theme_minimal()
  labs(title = "Height and mass by sex")


# P-value:
# running a T test gets you the P-value
# start with a null hypothesis, that there is no difference
#btwn two sets of data, Ex. life expectancy in africa and
# europe. If there was no difference, how likely would it be
# you would get a sample with the difference that you got
# when you plotted the two next to each other.
library(gapminder)
View(gapminder)
t_test_plot

gapminder %>%
  filter(continent %in% c("Africa", "Europe")) %>%
  t.test(lifeExp ~ continent, data = .,
  # could be less than or more instead of two.sided
  altrnative = "two.sided",
  # if you were comparing africa to itself but in diff years
  paired = FALSE)
# returns data:  lifeExp by continent
#t = -49.551, df = 981.2, p-value < 2.2e-16
#p-value is small 2.2 to the negative 16th
# anything under .05 or 5% is good p-value, you can reject
# the null hypothesis that

# ANOVA
ANOVA_plot

gapminder %>%
  filter(year == 2007) %>%
  filter(continent %in% c("Americas", "Europe", "Asia")) %>%
  aov(lifeExp ~ continent, data = .) %>%
  summary()
#            Df Sum Sq Mean Sq F value   Pr(>F)
#continent    2  755.6   377.8   11.63 3.42e-05 ***
  #Residuals   85 2760.3    32.5
# the Pr(>F) is p value, it is small the differences are
# significant

# TukeyHSD()
gapminder %>%
  filter(year == 2007) %>%
  filter(continent %in% c("Americas", "Europe", "Asia")) %>%
  aov(lifeExp ~ continent, data = .) %>%
  TukeyHSD() %>%
  plot()

# Chi Squared, categorical data
chi_plot

head(iris)
flowers <- iris %>%
  mutate(size = cut(Sepal.Length,
              breaks = 3,
              labels = c("Small", "Medium", "Large"))) %>%
  select(Species, size)
View(flowers)

#Chi Squared goodness of fit test
# the null hypothesis is that there are equal proportions of
# small, medium, large sepal length, the alternative is that
# they are not equal,
flowers %>%
  select(Size) %>%
  table() %>%
  # how likely is it that we would see the differences we
  #are seeing
  chisq.test()
  # returns
  #X-squared = 28.44, df = 2, p-value = 6.673e-07
  # p value is small (way less than .05) so we reject the
  # null hypothesis and the data is statistically relevant

# Are we seeing the number of each species be the same for
#small, medium and large?
# it will show that one variable is dependent on another,
# this species is ususally small etc
# Chi squared test of independence
flowers %>%
  table() #%>%
  chisq.test()

#Linear Model
# x speed of car is independant, y = distance to stop is
# dependant on x = speed of car
# null hypothesis is that there is no relationship btwn
#speed of car and distance to stop, if it was true, how likely
#is it that you would get a sample with a slope of X
#R2, r squared is how much of the change of dots off of the slope
# can be explained by the x and y relationship, other words
# how much can the change in y be explained by the change in x
# if R2 = .65 it equals 65%, so 65% of the change in distance
# can be explained by the change in x or speed of x

cars %>%
  # distance as a function of speed, dependant variable ~ independant variable
  lm(dist ~ speed, data = .) %>%
  summary()
  plot(cars)
