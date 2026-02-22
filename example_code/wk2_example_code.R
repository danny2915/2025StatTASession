
# clear the memory, import package for graphing

  rm(list = ls())
  library(tidyverse)

  
# 1. import dataset: "read.csv()"
  ## check your working directory
  getwd()
  ## set your working directory, where we put all the data
  setwd("C:/your/working/directory")
  county <- read.csv("county.csv")
  loan <- read.csv("loan50.csv")
  
  ## check the type of imported data
  class(county)
  class(loan)
    
  
# 2. scatter plot: "geom_point()" (w/ county data)
  
  ## specify the parameters, including dataset and aesthetic (x, y-axis)
  ggplot(county, aes(x = multi_unit, y = homeownership)) +
    
    ## choose function 'geom_point' and the arguments you like to beautify your scatter point
    geom_point(color = "steelblue", 
               size = 1, 
               shape = 5
               )
  
  
# 3. histogram: "geom_histogram()" (w/ loan50 data)

  ## specify the parameters, including dataset and aesthetic (x-axis)
  ggplot(loan, aes(x = interest_rate)) +
    
    ## plot the histogram (choose appropriate bin width, and colors you like)
    geom_histogram(binwidth = 2.5, 
                   fill = "steelblue", 
                   color = "black"
                   )
  
  
# 4. box plot: "geom_boxplot()" (w/ loan50 data)
  
  ## specify the parameters, including dataset and aesthetic (y-axis)
  ggplot(loan, aes(x = grade, y = interest_rate)) +
    
    ## add the box plot (set the width of box you like)
    geom_boxplot(width = 0.3)
  
  
  
# 5. dot plot: "geom_dotplot()" (w/ loan50 data)
  
  ## specify the parameters, including dataset and aesthetic (y-axis)
  ggplot(loan, aes(x = grade, y = interest_rate)) +
    
    ## add the dot plot (center the dots, and scatter along y-axis)
    geom_dotplot(binaxis = 'y', 
                 stackdir = 'center', 
                 dotsize = 0.5, 
                 fill = "steelblue"
                 )
  
  
  
