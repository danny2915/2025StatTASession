
# clear the memory
  
  rm(list = ls())
  library(tidyverse)

# ==============================================
# 1. Data Wrangling:
# ==============================================

# 1-1. trim string: `substring()`

  ## example 1
  str1 <- "Cat_and_Dog"
  substr1 <- substring(str1, 1, 3)
  print(substr1)
  
  ## example 2
  str2 <- "aaaaHello!bbbb"
  substr2 <- substring(str2, 5)
  print(substr2)


# 1-2. Create Date Type Object: `as.Date()`
  
  ## example 1
  as.Date("2025/11/11",  "%Y/%m/%d")
  as.Date("2025 11 11",  "%Y %m %d")
  as.Date("2025abc11xyz11", "%Yabc%mxzy%d")
  
  ## example 2
  d1 <- as.Date("2025-11-11")
  d2 <- as.Date("2025-11-20")
  
  print(d2 - d1)      
  print(d1 + 30)


# 1-3. Create vector easily: `seq(begin, end, sep)`
  
  ## example 1: numeric vector
  print(seq(0, 100, 7))
  
  ## example 2: date vector
  begin_date <- as.Date("2025-01-01")
  end_date <- as.Date("2025-12-31")
  print(seq(begin_date, end_date, "1 months"))


# 1-4. remove missing values: `na.omit()`
  
  ## example 1: vector
  x <- c(1, NA, 3, NA, 5)
  x_clean <- na.omit(x)
  print(x_clean)
  as.vector(x_clean) # you can use as.vector() to remove attributes
  
  ## example 2: dataframe
  df <- data.frame(
    x = c(1, NA, 3, 4, NA),
    y = c(10, 20, NA, 40, 50)
    ) %>%
    na.omit()
  print(df)
  
# 1-5. Find patterns inside element: `grepl()`
  
  ## example 1: 
  fruits <- c("apple", "banana", "pineapple", "pear")
  grepl("apple", fruits) 
  
  ## example 2:
  strings <- c("abcba", "acbcb", "abbbc", "babcc")
  grepl("abc", strings)
  
