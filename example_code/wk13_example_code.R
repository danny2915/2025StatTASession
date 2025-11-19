
# clear the memory

  library(tidyverse)
  rm(list = ls())


# 0. pre-load the dataset
  
  china <- read.csv("data/china.csv")
  book <- read.csv("data/textbooks.csv")
  birth <- read.csv("data/ncbirths.csv")
  
  
# ==============================================
# 1. Hypothesis Testing: t-test
# ==============================================
  
  # 1-1. one-proportion t-test
  
    ## example 1: Is the weekly childcare time (for male) equal to 25 hrs?
    china_male <- china %>% filter(gender == 1)
    t.test(china_male$child_care,
           mu = 25, 
           conf.level = 0.95)
  
    ## example 2: Is the weekly childcare time less than 25 hrs?
    t.test(china$child_care,
           mu = 25,
           alternative = "less",
           conf.level = 0.95)
  

  
  # 1-2. paired sample t-test
    
    ## example: Does UCLA bookstore charge a different price of text?
    t.test(book$ucla_new,
           book$amaz_new,
           paired = TRUE,
           coef.level = 0.95)
  
  
  # 1-3. two independent sample t-test
  
    ## example: Do newborns’ weights differ btw smoking & nonsmoking mothers?
    t.test(birth$weight ~ birth$habit,
         conf.level = 0.95)
  


  
  