library(tidyverse)
library(tidytext)
library(KoNLP)
library(wordcloud2)

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

