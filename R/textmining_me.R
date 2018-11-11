library(tidyverse)
library(tidytext)
library(KoNLP)
useNIADic()
library(wordcloud2)
library(reshape2)

m_df <- read_lines('data/moon.txt') %>% 
  SimplePos09 %>% 
  melt %>% 
  as_tibble %>%
  select(3, 1)

 m <- m_df %>%
  mutate(noun=str_match(value, '([가-힣]+)/N')[,2]) %>%
  na.omit %>%
  filter(str_length(noun)>=2)
  count(noun, sort=TRUE)
  
  wordcloud2(fontFamily = '나눔바른고딕',
              minRotation=0, maxRotation=0)
table(t(m))
  
  
ma %>%
  count(noun,sort = T) %>%
  filter(n>=2) %>%
  wordcloud2(fontFamily = '나눔바른고딕',
             minRotation=0, maxRotation=0)


write.csv(m, "data/wordcloud2.csv")

word2 <- read.csv("data/wordcloud2.csv")

table(word2)
