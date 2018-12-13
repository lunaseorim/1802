
library(xlsx)
data <- read.xlsx("data/서울시_착한가격_업소.xlsx",
                  sheetIndex = 1,
                  startRow = 1,
                  endRow = 824,
                  colIndex = 5,
                  colClasses = "character",
                  encoding = "UTF-8")

D1 <- data$업소.주소

dong <- function(x){
  A1 <- regmatches(x,gregexpr("\\(.+\\)",x))
  A2 <- unlist(A1) 
  A3 <- gsub("[\\(\\)]","",A2) 
  A4 <- regmatches(A3,gregexpr(".+동$",A3))
  A5 <- unlist(A4) 
  A6 <- gsub(" \\,.+","",A5)
  gsub(".+\\층","",A6)
 }

dong(D1) 

