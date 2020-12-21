library(tidyverse)
library(gginference)

t.test(data$white_won, mu = 0.50, alternative = "two.sided") %>% 
  broom::tidy() %>% 
  knitr::kable(caption = "Two Sided t-test Results")

ggttest(t.test(data$white_won, mu = 0.50, alternative = "two.sided"))