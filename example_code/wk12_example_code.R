
# clear the memory

  library(tidyverse)
  rm(list = ls())
  

# 0. pre-load the dataset
  
  earthquake <- read.csv("data/earthquakes.csv")
  oil <- read.csv("data/offshore_drilling.csv")

  
# ==============================================
# 1. Data Wrangling
# ==============================================
  
# 1-1. summarize the data: `summarize()`
  
  earthquake %>% 
    na.omit() %>% 
    summarize(
      avg_scale = mean(richter),
      avg_death = mean(deaths)
    )
  
  
# 1-2. grouping the data: `group_by()`
# [REMARK] we usually use `group_by()` together with `summarize()`
  
  ## example 1: compute the average number of death for each country from 1900 to 1999
  earthquake %>% 
    group_by(region) %>% 
    summarize(
      max_scale = max(richter),
      min_scale = min(richter),
      avg_death = mean(deaths)
    ) %>% 
    arrange(desc(avg_death))
  
  ## example 2: add the statistics of example 1 to the whole dataframe using mutate()
  earthquake %>% 
    group_by(region) %>% 
    mutate(
      max_scale = max(richter),
      min_scale = min(richter),
      avg_death = mean(deaths)
    ) %>% 
    arrange(desc(avg_death)) %>%
    ungroup()
  
  ## example 3: compute the number of earthquake in each year from 1900 to 1999
  earthquake %>%
    mutate(N = 1) %>% 
    group_by(year) %>% 
    summarize(earthquake_time = sum(N))
  
  ## example 4: forget using ungroup() may cause problems
  sales <- data.frame(region = c("N","N","S","S","S","S"),
                      store  = c("A","B","A","A","B","B"),
                      sales  = c(100,120,90,110,150,140))
  
  # forget to ungroup()
  by_region_store <- sales %>%
    group_by(region, store) %>%
    summarise(total_sales = sum(sales))
  
  # Now by_region_store is group by region
  # So there would be two columns instead of one
  by_region_store %>% filter(total_sales == max(total_sales))
  
  
  
# ==============================================
# 2. Hypothesis Testing: Chi-squared Test
# ==============================================
  
# 2-0. clean the data first 
  
  colnames(oil) <- oil[1, ]
  oil <- oil[-1, ]
  
# 2-1. proportion table: "prop.table()"

  ## recall "table()" function we learned in week 4, which gives us the number count (contigency) table 
  count_table <- table(oil$position, 
                       oil$college_grad
                       )
  print(count_table)
  class(count_table)
  
  ## now let's transform it into proportion for comparison, conditional on x-axis and y-axis respectively
  
  ### compute probability conditional on x-axis (position)
  pct_table_1 <- prop.table(count_table, margin = 1)
  print(pct_table_1)
  class(pct_table_1)
  
  ### compute probability conditional on y-axis (position)
  pct_table_2 <- prop.table(count_table, margin = 2)
  print(pct_table_2)
  class(pct_table_2)


# 2-2. Chi-squared test: "chisq.test()"

  chisq.test(count_table)

