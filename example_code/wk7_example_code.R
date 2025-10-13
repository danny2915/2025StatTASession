
# 0. import the dataset

  rm(list = ls())
  
  library(tidyverse)
  
  housing <- read.csv("data/ames.csv")
  
  loan <- read.csv("data/loans_full_schema.csv")
  
# ==============================================
# 1. Housing prices in Ames
# ==============================================
  
  # 1-1 add vertical line: `geom_vline()`
    
    # add "01" to date so it is of the form 2025-06-01
    housing$date <- as.Date(paste(housing$`Yr.Sold`,
                                  housing$`Mo.Sold`,
                                  "01",
                                  sep = "-")
                            )
  
    vline_plot <- ggplot(housing, aes(x = date, y = price)) + 
      geom_line(stat = "summary", 
                fun = "mean", 
                linewidth = 0.7, 
                color = "steelblue"
      ) +
      
      ## add vertical line to the one with highest average price
      geom_vline(xintercept = as.Date("2006-09-01"), color = "lightcoral")
    
    print(vline_plot)

  
  
    # 1-2: add horizontal line: `geom_hline()`
    hline_plot <- ggplot(housing, aes(x = date, y = price)) + 
      geom_line(stat = "summary", 
                fun = "mean", 
                linewidth = 0.7, 
                color = "steelblue"
      ) +
      geom_hline(yintercept = 180000, color = "gray")
    
    print(hline_plot)
  
      
# ==============================================
# 2. loan application interest rate
# ==============================================
    
  ## 2-1: plot loan application interest rate: according to different grades
  facet_wrap_plot <- ggplot(loan, aes(x = interest_rate)) +
      geom_histogram(bins = 20) +
      facet_wrap(~grade, scales = "free_y", nrow = 2)
  
  print(facet_wrap_plot)
    
  ## 2-2: save your graph
  ggsave(filename = "vline_plot.png",
         plot = vline_plot,
         path = "figures",
         width = 6,
         height = 4,
         dpi = 300)   
  
  ggsave(filename = "hline_plot.png",
         plot = hline_plot,
         path = "figures",
         width = 6,
         height = 4,
         dpi = 300) 
  
  ggsave(filename = "facet_wrap_plot.png",
         plot = facet_wrap_plot,
         path = "figures",
         width = 6,
         height = 4,
         dpi = 300) 
    