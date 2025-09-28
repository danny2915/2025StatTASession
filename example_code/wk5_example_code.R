
# clear the memory and load necessary packages

  rm(list = ls())
  set.seed(20250930)
  
  library(tidyverse)

  
# 1. random number draw from normal distribution: "rnorm()"
  
  ## draw 20 samples from uniform distribution (mean = 0, sd = 1) (default)
  rdnum <- rnorm(10)
  print(rdnum)
  class(rdnum)
  
  ## draw 30 samples from uniform distribution (mean = 60, sd = 15)
  rdnum_test <- rnorm(n = 10, mean = 60, sd = 15)
  print(rdnum_test)
  class(rdnum_test)
  
  ## OPTIONAL TO READ: generate uniform random sample in different sizes (10, 50, 500, 1000) 
  par(mfrow = c(2, 2))
  for (n in c(10, 50, 500, 1000)){
    rdnum_diffsize <- rnorm(n)    
    hist(rdnum_diffsize,
         main = paste0("Standard Normal (n = ", n, ")"),
         xlab = "Sample value",
         breaks = seq(-4, 4, by = 0.5)
    )
  }


# 2. random number draw from binomial distribution: "rbinom()"
  
  ## draw 20 samples from binomial distribution, each sample expreienced 5 times bernoulli with probability = .5
  rdnum <- rbinom(n = 30, size = 20, prob = .5)
  print(rdnum)
  class(rdnum)
  print(mean(rdnum))
  
  ## OPTIONAL TO READ: generate uniform random sample in different sizes (10, 50, 500, 1000) 
  par(mfrow = c(2, 2))
  for (n in c(10, 50, 500, 1000)){
    rdnum_diffsize <- rbinom(n, size = 20, prob = .2)    
    hist(rdnum_diffsize,
         main = paste0("Binomial (n = ", n, ", size = 20, prob = 0.2)"),
         xlab = "Sample value",
         breaks = seq(0, 20, by = 1)
    )
  }

# 3. for loop
  
  ## example 1
  for (i in 1:5){
    print(i)
  }
  
  ## example 2
  for (j in c(1, -1, 1, 3, 0, -1)){
    print(j+1)
  }
  
  ## example 3
  for (k in seq(0, 10, by = 2)){
    print(k)
  }

  
# 4. if-else
  
  ## example 1
  score <- 95
  if(score > 60){
    print("Pass the course!")
  }else{
    print("Fail.")
  }
  
  ## example 2
  for (i in 55:65){
    if(i < 60){
      print("Fail.")
      }else if(i == 60){
        print("On the threshold.")
        }else{
          print("Pass the course!")
        }
    }
  
  
# 5. replicate()

  ## example 1: repeat value
  rep_value <- replicate(n = 10, "Hello!")
  print(rep_value)
  class(rep_value)
  
  ## example 2: repeat function (for instance, random sampling)
  rep_sample <- replicate(n = 4, 
                          rnorm(2, mean = 0, sd = 1)
                          )
  print(rep_sample)
  class(rep_sample)

  
# 6. self-defined function: function()
  
  ## example 1: define addition
  add <- function(a, b){
    return(a+b)
  }
  add(50, 100)  
  
  ## example 2: draw standard normal random sample and make histogram
  sample_hist <- function(sample_size){
    rdn <- rnorm(sample_size)
    ggplot() +
      geom_histogram(mapping = aes(x = rdn))
  }
  sample_hist(500)
  
# 7. colnames()
  
  # example 1: rename a dataframe's column names
  df <- data.frame(a = 1:3, b = 4:6)
  colnames(df) <- c("height", "weight")
  
  # example 2: rename a matrix's column names
  m <- matrix(1:6, nrow = 3)
  colnames(m) <- c("col1", "col2")
  
