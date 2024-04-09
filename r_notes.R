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
        pwd = "mypassword"
)

# execute a sql query and store the result in a data frame
data <- dbGetQuery(con, "SELECT * FROM mytable")

# close the database connection
dbDisconnect(con)

# END ========================

# START
# Reading and writing to a CSV file
data <- read.csv("file.csv")
write.csv(data, "file.csv")
# END ======================

# START
# Reading and writing an Excel File
install.packages("readx1")
library(readx1)
data <- read_excel("file.xlsx")
write.xlsx(data, "file.xlsx",
        sheetName = "Sheet1", colNames = TRUE,
        rowNames = FALSE
)
# END

# START
# vector is like a list of things all with same data type
nums <- c(1, 2, 3, 4)
chars <- c("red", "green", "blue")
# END

# START
# matrices = a two dimensional array of values of the same data type
# create a 3.3 matrix
mat <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow = 3, ncol = 3)
# END

# START: make small data frame and view the table and schema
ages <- c(5, 6)
names <- c("John", "James")
friends <- data.frame(names, ages)
View(friends)
str(friends)
# END

# to checkout a variable
data.set$variable
friends$names

# to get the value of the first row and first column
# data.set[row, column]
friends[1, 1]
# will give you all of the columns for row 1 ( a full record)
friends[1, ]
# will list whole first column or all rows in column one
friends[, 1]

# to view built in datasets in r studio
data()
# to view the CO2 dataset
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

# To remove empty or NA rows ##################

# na.omit() function removes rows with any missing values (NA) from a data frame.
# Remove empty rows with NA values
cleaned_data <- na.omit(your_data_frame)
# complete.cases() function returns a logical vector indicating which rows
# have no missing values (NA) across all columns.
# Remove empty rows with complete.cases()
cleaned_data <- your_data_frame[complete.cases(your_data_frame), ]

# To check your column or variable names #########################

# names() function can be used to get or set the names of the data
# frame's variables.
# If you want to retrieve the variable names, simply pass your data
# frame to names().
# Using names() to get variable names
variable_names <- names(your_data_frame)
print(variable_names)

# colnames() function is specifically for retrieving or setting column names in a matrix or data frame.
# It's similar to names() but is typically used with data frames or matrices.
# Using colnames() to get column names
variable_names <- colnames(your_data_frame)
print(variable_names)

# remove columns that start with X
remove_columns_starting_with_X <- function(data) {
  # Get the names of all columns
  column_names <- names(data)

  # Identify columns that start with "X"
  columns_to_remove <- grep("^X", column_names)

  # Remove identified columns
  cleaned_data <- data[, -columns_to_remove]

  return(cleaned_data)
}
# Example data frame
df <- data.frame(X1 = 1:3, X2 = 4:6, Y1 = 7:9)

# Remove columns starting with "X"
cleaned_df <- remove_columns_starting_with_X(df)

# View cleaned data frame
print(cleaned_df)

# Remove columns that start with X with if statement
# Example data frame
df <- data.frame(X1 = 1:3, X2 = 4:6, Y1 = 7:9)

# Function to remove columns starting with "X"
remove_columns_starting_with_X <- function(data) {
  # Get column names
  column_names <- names(data)

  # Check if any column starts with "X"
  if (any(grepl("^X", column_names))) {
    # If true, remove columns starting with "X"
    cleaned_data <- data[, !grepl("^X", column_names)]
    return(cleaned_data)
  } else {
    # If false, return original data frame
    return(data)
  }
}

# Apply the function
cleaned_df <- remove_columns_starting_with_X(df)

# View cleaned data frame
print(cleaned_df)

# ###############################
#Group data by category and summarize information

# Group expenses by category
grouped_expenses <- category_expenses %>%
  group_by(category)

# Summarize expenses within each category
summarized_expenses <- grouped_expenses %>%
  summarize(Total_Amount = sum(Amount))

# View the summarized data
print(summarized_expenses)
