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
