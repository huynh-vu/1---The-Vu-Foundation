library(tidyr)
library(dplyr)
library(ggplot2)
library(sqldf)

# read file 
imported_data <- read.csv("data/transactions.csv",header=TRUE, skip = 0)

# exclude variables 
newdata <- imported_data[c(1,2,4,5,6,7)]

newdata <- subset(newdata, Transaction.Type=='debit')
newdata <- subset(newdata, as.Date(newdata$Date, format = "%m/%d/%Y") > '4/1/2017')

# get first 1000 observations
# newdata <- newdata[1:1000,]

newdata <- aggregate(newdata$Amount, by=list(Account.Name=newdata$Account.Name), FUN=sum)

newdata






as.Date(dates, format = "%m/%d/%y") 


imported_data <- sapply(head(imported_data, 1), 1, paste)



# trim variable obtain just the percentage
imported_data <- as.numeric(gsub("([0-9]+).*$", "\\1", substring(imported_data, 19, 22)))

# writes the table of best rate info
write.table(paste(toString(Sys.time()), imported_data, sep = " "), "data/transactions.txt",
            sep = "", row.names = FALSE, quote = FALSE, append = TRUE, col.names = FALSE)