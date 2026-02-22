
# 0. import the dataset

  rm(list = ls())
  
  library(tidyverse)
  
  housing <- read.csv("data/ames.csv")
  
# ==============================================
# 1. Paste functions
# ==============================================
  # 1-1. Paste strings together: `paste()`
  
    paste("test", 1:5, sep = "_")
    
    paste(c("A","B","C"), collapse = ", ")
    
    paste("test", 1:5, sep = "^", collapse = "+")
    
    # `paste()` works pairwise across inputs; shorter vectors recycle:
    paste(c("A", "B", "C", "D"), 1:2, sep = "_")
    
    # You can combine more than two vectors or strings.
    paste("ID", 1:3, "Section", c("A", "B"), sep = "_")
    
  # 1-2. Shorthand for paste(..., sep = ""): `paste0()`
    
    paste0("test", 1:5)
    
    paste0(c("A","B","C"), collapse = ", ")
    
    paste0("test", 1:5, collapse = "+")
    

# ==============================================
# 2. Date Type: Date
# ==============================================
  # 2-1. Turn strings into date type: `as.Date()`
    
    as.Date("2025-01-02")
    
    as.Date("01-02-2025", format = "%m-%d-%Y")
    
    

# ==============================================
# 3. Yearly Birth Number in Taiwan
# ==============================================
  
  # 3-1. Line Graph: `geom_line()`
    
    # add "01" to date so it is of the form 2025-06-01
    housing$date <- as.Date(paste(housing$`Yr.Sold`,
                                  housing$`Mo.Sold`,
                                  "01",
                                  sep = "-")
                            )
    
    # without stat and fun
    ggplot(housing, aes(x = date, y = price)) + 
      geom_line(linewidth = 0.7, 
                color = "steelblue"
                )

    # with stat and fun
    ggplot(housing, aes(x = date, y = price)) + 
      geom_line(stat = "summary", 
                fun = "mean", 
                linewidth = 0.7, 
                color = "steelblue"
                )
      
