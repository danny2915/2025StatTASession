
# clear the memory

  rm(list = ls())
  set.seed(2025)
  library(tidyverse)


# ==============================================
# 1. Random Number Generator
# ==============================================
  
# 1-1. draw random number from poisson distribution: `rpois()`

  # draw 20 samples from poisson distribution (lambda = 5), and plot sample histogram
  rdnum_pois <- rpois(n = 20, lambda = 5)
  print(rdnum_pois)
  # draw 1,000 samples from poisson distribution (lambda = 5), and plot sample histogram
  rdnum_pois_2 <- rpois(n = 1000, lambda = 5)
  ggplot() +
    geom_histogram(mapping = aes(x = rdnum_pois_2))
  
# 1-2. draw random number from exponential distribution: `rexp()`
  
  ## draw 20 samples from exponential distribution (rate = 5)
  rdnum_exp <- rexp(20, rate = 5)
  rdnum_exp <- round(rdnum_exp, digits = 6)
  print(rdnum_exp)
  
  rdnum_exp_2 <- rexp(1000, rate = 5)
  ggplot() +
    geom_histogram(mapping = aes(x = rdnum_exp_2))

# ==============================================
# 2. Data Wrangling
# ==============================================
  
# 2-1. combine two different dataset by rows
  
  ## first, let's draw two different sets of random sample
  rdnum_pois_20 <- rpois(n = 20, lambda = 5)
  rdnum_pois_10000 <- rpois(n = 10000, lambda = 5)
  
  ## using the two sets of random sample, build two DataFrames respectively
  df_20 <- data.frame(
    size = 20,
    values = rdnum_pois_20
  )
  df_10000 <- data.frame(
    size = 10000,
    values = rdnum_pois_10000
  )
  
  ## combine the two DataFrames together, and draw the histogram
  df <- rbind(df_20, df_10000)
  
  ggplot(df, aes(x = values)) +
    geom_histogram() +
    facet_wrap(~size, scales = "free_y")
  

# 2-2. combine two different dataset by columns
  
  ## first, let's draw two different sets of random sample
  rdnum_pois_param5 <- rpois(n = 1000, lambda = 5)
  rdnum_pois_param20 <- rpois(n = 1000, lambda = 20)
  
  ## using the two sets of random sample, build two DataFrames respectively
  df_param5 <- data.frame(
    values_param5 = rdnum_pois_param5
  )
  df_param20 <- data.frame(
    values_param20 = rdnum_pois_param20
  )
  
  ## combine the two DataFrames together, and draw the histogram
  df <- cbind(df_param5, df_param20)
  ggplot(df) +
    geom_histogram(mapping = aes(x = values_param5, 
                                 fill = "lambda = 5"), 
                   alpha = 0.7
                   ) +
    geom_histogram(mapping = aes(x = values_param20, 
                                 fill = "lambda = 20"), 
                   alpha = 0.7
                   )

