library(janitor)
library(tidyverse)
library(survey)

data <- read_csv('data/clean_games.csv')
chess.glm <- glm(white_won ~ turns + diff_rating + as.factor(victory_status) + game_type, data = data, family = "binomial")

chess.glm %>% 
  broom::tidy() %>% 
  knitr::kable()

# best opening move for white  
chess.opening_eco <- glm(white_won ~ opening_eco, data = data, family = "binomial")
sort(coefficients(chess.opening_eco), decreasing = TRUE) %>% 
  broom::tidy() %>% 
  knitr::kable()