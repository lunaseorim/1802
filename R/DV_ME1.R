``````
##
library(ggplot2)
library(dplyr)

##Read and Data File
LC <- read.csv("data/lung-cancer.csv")

#Data visualization 1
L1T <- data.frame(table(LC[ ,1])) %>%
  `colnames<-`(c("Cancer","Freq"))

ggplot(L1T,aes(x = Cancer, y = Freq)) +
  geom_bar(stat = "identity", width = 0.4) +
  ylim(0, max(L1T$Freq) * 1.05)


#Data visualization 2_1 / geom_boxplot()
ggplot(LC,aes(x=LC,
              y=Smoking)) +
  geom_boxplot()

#Data visualization 3_1
L3T <- data.frame(LC[,c(1,2)]) %>%
  `colnames<-`(c("Cancer","Sex")) %>%
  table() %>%
  data.frame()

ggplot(L3T,mapping = aes(x = Sex,y = Freq,
                         fill = Cancer)) +
  geom_bar(stat = "identity", width = 0.5) +
  scale_fill_brewer(palette = "YlOrRd")

#Data visualization 3_2
L3T_1 <- L3T %>% 
  ddply("Sex", transform, percent_cancer = Freq / sum(Freq) *100)

ggplot(L3T_1, aes(x = Sex, y = percent_cancer, fill = Cancer)) +
  geom_bar(stat = "identity",width = 0.5) +
  geom_text(aes(label = paste0(round(L3T_1$percent_cancer,0),"%")),
            position = position_stack(vjust=1.05),
            size=3.8, color = "Brown") +
  scale_fill_brewer(palette = "YlOrRd") +
  ylim(0,105)
  
#Data visualization 3_3 _ interaction()

  ggplot(L3T_1,aes(x=interaction(Cancer,Sex),
                   y=percent_cancer,
                   fill=Cancer)) +
    geom_bar(stat = "identity",width = 0.8) +
    ylim(0,max(L3T_1$percent_cancer)*1.05) +
    geom_text(aes(label = paste0(round(L3T_1$percent_cancer,0),"%")),
              vjust=-0.5, color = "Brown") +
    scale_fill_brewer(palette = "YlOrRd")
  