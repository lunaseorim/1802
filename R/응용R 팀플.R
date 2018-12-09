

AAAA1 <- read.csv("data/1in.csv")

str(AAAA1)

AAAA1$경력연관성 <- factor(AAAA1$경력연관성,
                   labels = c("전혀 연관이 없다",
                              "연관이 없다",
                              "보통이다",
                              "연관이 있다",
                              "매우 연관이 있다"),
                   levels = 1:5)

library(plyr)

ddply(AAAA1,~경력연관성,summarize, 매출평균 = round(mean(매출액),0))


"전혀 연관이 없다",
"연관이 없다",
"보통이다",
"연관이 있다",
"매우 연관이 있다",
