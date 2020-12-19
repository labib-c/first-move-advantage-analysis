library(tidyverse)

# data from https://www.kaggle.com/datasnaek/chess
raw_data <- read_csv("data/games.csv")

clean_data <- raw_data %>% 
  select(-c(id, 
            white_id, 
            black_id,
            created_at,
            last_move_at, 
            opening_ply)) %>% 
  mutate(white_won = ifelse(winner=="white", 1 ,0)) %>% 
  mutate(diff_rating = white_rating - black_rating)

write.csv(clean_data, "data/clean_games.csv")