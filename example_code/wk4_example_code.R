
# clear the memory and read necessary packages

  rm(list = ls())
  library(ggplot2)

  
# 1. set random seed (for replication): "set.seed()"
  
  set.seed(20250923)
  
  
# 2. draw random number from uniform distribution: "runif()"
  
  # draw 20 samples from uniform distribution [0, 1] (default min/max)
  rdnum <- runif(10)
  print(rdnum)
  class(rdnum)
  
  ## draw 30 samples from uniform distribution [0, 100]
  rdnum_2 <- runif(n = 10, min = 0, max = 100)
  print(rdnum_2)
  class(rdnum_2)
  
  ## *additional work* (optional to read): generate uniform random sample in different sizes
  par(mfrow = c(2, 2))
  for (n in c(10, 100, 1000, 10000)){
    rdnum_diffsize <- runif(n)
    hist(rdnum_diffsize,
       main = paste("Uniform Sample Size =", n),
       xlab = "Sample value",
       breaks = seq(0, 1, by = 0.1)
    )
  }

  
# 3. denote head when number is greater than 0.5 and tail otherwise: "as.numeric()"

  ## by using operator ">", we will obtain logical result
  head_logical <- rdnum > 0.5
  print(head_logical)
  class(head_logical)
  
  ## we can also get numeric result for later computation
  head_numeric <- as.numeric(rdnum > 0.5)
  print(head_numeric)
  class(head_numeric)
  
  ## sometimes the data are given by characters. convert them to numeric before analysis
  data_example <- data.frame(name = c("Alice", "Bob", "Cindy"),
                             score = c("80", "60", "100")
                             )
  mean(data_example$score) # NA !
  
  mean(as.numeric(data_example$score))
  
  
  
# 4. cumulative sum of head over flips: "cumsum()"
  
  cum_head <- cumsum(head_numeric)
  cum_head_logical <- cumsum(head_logical) ## this can work too!
  print(cum_head)
  class(cum_head)
  
  ## additional work (optional to read): generate number of heads of over 1,000 flips
  flips <- as.numeric(runif(1000) > 0.5)
  df_flip <- data.frame(
    head_cum = cumsum(flips) / 1:1000,
    flip_cum = seq_along(flips)
  )
  ggplot(df_flip, aes(x = flip_cum, y = head_cum)) +
    geom_line()


# 5. generate regular sequence for a given sequence: "seq_along()"
  
  cum_head_serial <- seq_along(cum_head)
  print(cum_head_serial)

