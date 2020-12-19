install.packages("pROC")
library(tidyverse)
library(janitor)
library(pROC)

data <- read_csv('data/clean_games.csv')
n <- length(data$white_won)
chess.full_model <- glm(white_won ~ rated + turns + diff_rating + as.factor(victory_status) + game_type + white_rating + black_rating + as.factor(opening_eco), data = data, family = "binomial")
chess.step <- step(chess.full_model, k=log(n), trace=0)

#Goodness of Fit: ROC curve
roc_curve <- function(glm){
  p2 <- fitted(glm)
  y <- data$white_won
  roc_logit2 <- roc(y ~ p2)
  TPR <- roc_logit2$sensitivities
  FPR <- 1 - roc_logit2$specificities
  plot(FPR, TPR, xlim =c(0,1), ylim =c(0,1), type ='l', lty = 1, lwd = 2,col ='red', bty = "n", main="ROC")
  abline(a = 0, b = 1, lty = 2, col ='blue')
  text(0.7,0.4,label =paste("AUC = ",round(auc(roc_logit2),4)))
  auc(roc_logit2) 
}

par(mfrow=c(1,2))
#Full Model
roc_curve(chess.full_model)

#StepWise Reduced Model
roc_curve(chess.step)