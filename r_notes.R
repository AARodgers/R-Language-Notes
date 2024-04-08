# START
# connecting to SQL DB (ODBC is Open DB Connectivity)

library(DBI)
library(odbc)
# establish connection to db
con <- dbConnect(odbc::obdc(),
        driver = "SQL Server",
        server = "myserver",
        database = "mydatabase",
        uid = "myusername",
        pwd = "mypassword")

#execute a sql query and store the result in a data frame
data <- dbGetQuery( con, "SELECT * FROM mytable")

#close the database connection
dbDisconnect(con)

#END ========================

# START
# Reading and writing to a CSV file
data <- read.csv("file.csv")
write.csv(data, "file.csv")
# END ======================

#START
# Reading and writing an Excel File
install.packages("readx1")
library(readx1)
data <- read_excel("file.xlsx")
write.xlsx(data, "file.xlsx", sheetName = "Sheet1", colNames = TRUE,
           rowNames = FALSE)
# END

#START
# vector is like a list of things all with same data type
nums <- c(1, 2, 3, 4)
chars <- c("red", "green", "blue")
#END

#START
# matrices = a two dimensional array of values of the same data type
#create a 3.3 matrix
mat <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, ncol =3)
#END

#START: make small data frame and view the table and schema
ages <- c(5, 6)
names <- c("John", "James")
friends <- data.frame(names, ages)
View(friends)
str(friends)
#END

#to checkout a variable
data.set$variable
friends$names

# to get the value of the first row and first column
#data.set[row, column]
friends[1,1]
# will give you all of the columns for row 1 ( a full record)
friends[1, ]
#will list whole first column or all rows in column one
friends[ ,1]

#to view built in datasets in r studio
data()
#to view the CO2 dataset
view(CO2)

# to make a table or dataframe for a budget
# Create a data frame representing the household budget
budget <- data.frame(
  Category = c("Housing", "Utilities", "Groceries", "Transportation", "Entertainment"),
  Budgeted_Amount = c(1500, 200, 400, 300, 100),
  Actual_Spending = c(1450, 220, 380, 280, 90)
)

# Calculate variance
budget$Variance <- budget$Actual_Spending - budget$Budgeted_Amount

# Print the budget data
print(budget)

# Calculate total budgeted amount and total actual spending
total_budgeted <- sum(budget$Budgeted_Amount)
total_spending <- sum(budget$Actual_Spending)

# Print total budgeted amount and total actual spending
cat("Total Budgeted Amount: $", total_budgeted, "\n")
cat("Total Actual Spending: $", total_spending, "\n")

# Calculate total variance
total_variance <- total_spending - total_budgeted

# Print total variance
cat("Total Variance: $", total_variance, "\n")

# Create a bar plot to visualize budgeted amount vs. actual spending
library(ggplot2)
ggplot(budget, aes(x = Category, y = c(Budgeted_Amount, Actual_Spending), fill = factor(Category))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Household Budget", y = "Amount ($)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

