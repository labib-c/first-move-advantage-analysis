library(janitor)
library(tidyverse)
library(ggplot2)

data <- read_csv('data/clean_games.csv')
chess.glm <- glm(white_won ~ turns + diff_rating + game_type, data = data, family = "binomial")

chess.glm %>% 
  broom::tidy() %>% 
  knitr::kable()

# best opening move for white  
chess.opening_eco <- glm(white_won ~ opening_eco, data = data, family = "binomial")
sort(coefficients(chess.opening_eco), decreasing = TRUE) %>% 
  as.data.frame() %>% 
  knitr::kable()

ggplot(data, aes(x=turns, y=white_won)) + 
  geom_point(shape=1) + 
  stat_smooth(method = "glm", method.args = list(family="binomial"), se = FALSE) +
  ggtitle("Turns vs. White Won")

ggplot(data, aes(x=game_type, y=white_won)) + 
  geom_point(shape=1) + 
  stat_smooth(method = "glm", method.args = list(family="binomial"), se = FALSE) +
  ggtitle("Game Type vs. White Won")

ggplot(data, aes(x=diff_rating, y=white_won)) + 
  geom_point(shape=1) + 
  stat_smooth(method = "glm", method.args = list(family="binomial"), se = FALSE) +
  ggtitle("Difference in Rating vs. White Won")