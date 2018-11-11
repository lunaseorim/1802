library(tidyverse)

country <- dget("data/country.txt")

grep(",",country,value = T)
grep("\\.",country,value = T)

unlist(list(grep(",",country,value = T),
            grep("\\.",country,value = T)))

A1 <- country %>%
  grep("t", ., value = T) 
A2 <- country %>%
  grep("T", ., value = T)

A3 <- unlist(list(A1,A2))

B1 <- grep("land$", A3, value = T)

sub("land","LAND",B1)


ABC <- function(a){
 A1 <- list(grep("t",a,value = T),
            grep("T",a,value = T))
 A2 <- unlist(A1)
 grep("land$", A2, value = T)
}

ABC(country) %>%
  sub("land","LAND", .)

country %>%
  list(grep("t", .,value = T),
       grep("T", .,value = T))


