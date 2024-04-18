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
#logarithmic scale can be useful for displaying large ranges
#of data, it can also distort the relationship between variables.

# Keep it simple
# Show data accurately
# Choose the right type of chart or visualization
# Use appropriate scales
# Use appropriate colors
# Always labe axes and provide context
# Use annotations and callouts to hightlight important info and draw viewer's attention
# to specific areas

# stick with consistent color schemes
scale_fill_brewer(palette = "GnBu")

# Adding annotations example
 library (ggplot)

 data <- data.frame(x = c(1:10), y = c(1:10))

 #Basic plot
 p <- ggplot(data, aes(x, y)) + geom_point()

# Add annotations and callouts
p +
  annotate(geom = "text", x = 5, y = 5 ,label = "Important Information", size = 6, vjust = -1) +
  annotate(geom_segment", x= 5, xend = 5, y =1, yend =4, color = "red", size = 1.5,
  arrow = arrow(length = unit(0.3, "cm")))

# other kinds of annotations and callouts
p +
  annotate(geom = "text", x =5, y = 5, label = "Important Information",
           size = 6, vjust = -1) +
  annotate(geom_segment, x = 5, xend = 10, y = 5, yend = 10,
  color = "red", size = 1.5, arrow = arrow(length = unit(0.3, "cm")))
