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

 m_df %>%
  mutate(noun=str_match(value, '([가-힣]+)/N')[,2]) %>%
  na.omit %>% 
  filter(str_length(noun)>=2) %>% 
  count(noun, sort=TRUE) %>% 
  filter(n>=2) %>% 
  wordcloud2(fontFamily = '나눔바른고딕',
              minRotation=0, maxRotation=0)

russia1 <- read_lines('data/russia1.txt') %>% 
   SimplePos09 %>% 
   melt %>% 
   as_tibble %>%
   select(3, 1)
 
R1 <- russia1 %>%
   mutate(noun=str_match(value, '([가-힣]+)/N')[,2]) %>%
   na.omit %>% 
   filter(str_length(noun)>=2) %>% 
   count(noun, sort=TRUE) %>% 
   filter(n>=2)
   wordcloud2(R1,fontFamily = '나눔바른고딕',
              minRotation=0, maxRotation=0)
 
R1[33,1] <- "한국"

R1 %>%
  wordcloud2(fontFamily = '나눔바른고딕',
             minRotation = 0, maxRotation = 0)

