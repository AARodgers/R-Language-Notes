# SCATTER PLOT: put in R Studio to see scatter plot of iris data set
# Good to see the relationship between pairs of variables in a data set
# has one category and 4 continuous variables
# Good for showing correlations between variables
install.packages("ggplot2")
library(ggplot2)
data(iris)
ggplot(data =iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point()

# BAR CHART
# See the distribution of a categorical variable
# good for comparing values
library(ggplot2)
data(diamond)
ggplot(diamonds, aes(x=cut)) +
  geo_bar() +
  labs(x="Cut", y="Count") +
  ggtitle("Bar Chart of Diamond Cut")

# LINE CHART
# see the trend of a continuous variable( # of unemployed) over time
# good for showing trends over time
library(ggplot2)
data(economics)

ggplot(economics, aes(x=date, y=unemploy)) +
  geom_line() +
  labs(x="Date", y="Number of unemployed") +
  ggtitle("Unemployment over Time")


# HISTOGRAM
# allows you to see the distribution of a continuous variable (highway miles per gallon)
library(ggplot)
data(mpg)

ggplot(mpg, aes(x=hwy)) +
  geom_histogram(bins=20, fill="blue", color="white") +
  labs(x="Highway MPG", y="Frequency") +
  ggtitle("Histogram of the Highway MPG")


# PIE CHART
# allows you to see the porportion of a categorical variable (carburetor count)
# NEEDS TO BE FIXED
library(ggplot2)
data(mtcars)

carb_count <- table(mtcars$carb)

ggplot(mtcars, aes(x="")) +
  geom_bar(aes(y=carb_count, fill=factor(carb_count))) +
  labs(x="", y="Count") +
  ggtitle("Pie Chart of Car Carburetor Count") +
  coord_polar("y", start=0)


# Plotting Notes:
