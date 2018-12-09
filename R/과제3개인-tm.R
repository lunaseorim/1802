library(tidyverse)

country <- dget("../data/country.txt")

AA1 <- grep(",",country,value = T)
AA2 <- grep("\\.",country,value = T)

unique(
  unlist(
    list(P = grep(",",country,value = T),
         Q = grep("\\.",country,value = T))))



unique(AA1,AA2)

A1 <- country %>%
  grep("t", ., value = T) 
A2 <- country %>%
  grep("T", ., value = T)

A3 <- unlist(list(A1,A2))

B1 <- grep("land$", A3, value = T)

sub("land","LAND",B1)


ABC <- function(a){
 A1 <- unlist(list(grep("t",a,value = T),
              grep("T",a,value = T)))
 A2 <- unique(A1)
 grep("land$", A2, value = T)
}



XY <- unique(unlist(list(X = grep("t",country,value = T),
             Y = grep("T",country,value = T))))


grep("land$",XY,value = T)

ABC(country) %>%
  sub("land","LAND", .)
