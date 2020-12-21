# First Move Advantage Analysis
Statistical analysis in determining if White has a consistent advantage in Chess

## Table of Contents
---

- [Data](#data)
- [Report](./first-move.pdf)
- [Model Code](./model/)
    - [Cleaning Data](./model/clean_data.R)
    - [Variable Selection](./model/variable_selection.R)
    - [Logistic Model](./model/model.R)
    - [Significance Test](./model/significance_test.R)


## Data
https://www.kaggle.com/datasnaek/chess

To produce the cleaned data needed to run the analysis, do the following:

1. Set the working dir to the root of this repo

```
setwd(<< path to root of repo>>)
```

2. Download data from the link above

3. Make a new directory `data` in the root of this project

4. Move `games.csv` into the `data` directory (`games.csv` is the data downloaded from step 2.)

5. Run `model/clean_data.R`

This will create the `clean_games.csv` dataset used in the analysis.
