# Scatter PLOT: put in R Studio to see scatter plot of iris data set
# Good to see the relationship between pairs of variables in a data set
# has one category and 4 continuous variables
install.packages("ggplot2")
library(ggplot2)
data(iris)
ggplot(data =iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) + geom_point()

