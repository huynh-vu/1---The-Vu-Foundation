# install.packages('quantmod')
library(quantmod)

getSymbols("SNAP")
colnames(SNAP) <- c("OPEN", "HIGH", "LOW", "CLOSE", "VOLUME", "ADJUSTED")
data_SNAP <-capture.output(tail(SNAP, 2))
cat("SNAP", data_SNAP, file="data/stocks_summary.txt", sep="\n", append=FALSE)

getSymbols("JPM")
colnames(JPM) <- c("OPEN", "HIGH", "LOW", "CLOSE", "VOLUME", "ADJUSTED")
data_JPM <-capture.output(tail(JPM, 2))
cat("", "" , file="data/stocks_summary.txt", sep="\n", append=TRUE)
cat("JPM", data_JPM, file="data/stocks_summary.txt", sep="\n", append=TRUE)

getSymbols("AAPL")
colnames(AAPL) <- c("OPEN", "HIGH", "LOW", "CLOSE", "VOLUME", "ADJUSTED")
data_AAPL <-capture.output(tail(AAPL, 2))
cat("", "" , file="data/stocks_summary.txt", sep="\n", append=TRUE)
cat("AAPL", data_AAPL, file="data/stocks_summary.txt", sep="\n", append=TRUE)