# SCATTER PLOT: put in R Studio to see scatter plot of iris data set
# Good to see the relationship between pairs of variables in a data set
# has one category and 4 continuous variables
install.packages("ggplot2")
library(ggplot2)
data(iris)
ggplot(data =iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point()

# BAR CHART
# See the distribution of a categorical variable
library(ggplot2)
data(diamond)
ggplot(diamonds, aes(x=cut)) +
  geo_bar() +
  labs(x="Cut", y="Count") +
  ggtitle("Bar Chart of Diamond Cut")

# LINE CHART
# see the trend of a continuous variable( # of unemployed) over time
library(ggplot2)
data(economics)

ggplot(economics, aes(x=date, y=unemploy)) +
  geom_line() +
  labs(x="Date", y="Number of unemployed") +
  ggtitle("Unemployment over Time")
