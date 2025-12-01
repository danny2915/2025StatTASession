
# clear the memory

  library(tidyverse)
  rm(list = ls())


  # drop pitcher sample
  mlb <- read.csv("data/mlb_players_18.csv") %>% 
    filter(position != "P" & position != "DH")
  
  possum <- read.csv("data/possum.csv")
  
  # Before started, let's take a look at the Scatter plot of total length and head length
  ggplot(possum, aes(x = total_l, y = head_l)) +
    geom_point(color = "steelblue", size = 2.5) +
    labs(
      x = "Total Length (cm)",
      y = "Head Length (mm)"
    )
  
# ==============================================
# 1. Hypothesis Testing: ANOVA
# ==============================================
  
  # 1.1 Create grouped box plot to 
  ggplot(mlb, aes(x = position, y = OBP)) +
    geom_boxplot()
  
  
  # 1.2 Compute the variance of OBP across groups
  mlb %>% 
    group_by(position) %>% 
    summarize(OBP_sd = sd(OBP)) %>% 
    
    ggplot(aes(x = position, y = OBP_sd)) +
      geom_bar(stat = 'identity')
  
    
  # 1.3 ANOVA: Is variable values different by groups?
  aov_result <- aov(mlb$OBP ~ mlb$position)
  summary(aov_result)
  
  
  
  
# ==============================================
# 2. Linear Regression
# ==============================================
  
  # 2.1 Linear regression model
  
    lm_model <- lm(possum$total_l ~ possum$head_l)
    lm_model <- lm(data = possum, total_l ~ head_l) # these two are equivalent
    print(lm_model)
    
  # 2.2 Obtain the result of linear regression
    
    summary(lm_model)
    summary(lm_model)$coefficient
    summary(lm_model)$r.squared


  ## 2.3 Adding fitted line on scatter plot
  
  ggplot(possum, aes(x = total_l, y = head_l)) +
    geom_point(color = "steelblue", size = 2.5) +
    geom_smooth(method = "lm", se = TRUE) +
    labs(
      x = "Total Length (cm)",
      y = "Head Length (mm)"
    )
  
