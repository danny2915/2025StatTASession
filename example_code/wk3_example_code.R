  
# clear the memory, import package for graphing

  rm(list = ls())
  library(ggplot2)


# 1. import the dataset
  loan <- read.csv("data/loans_full_schema.csv")
  county <- read.csv("data/county.csv")

# 2. Create contingency table object: `table()`

  ## using 'table' function to easily build contingency table within dataset
  table <- table(loan$application_type, 
                 loan$homeownership
                 )
  print(table)
  class(table)

  ## we can also specify the column name in the function arguments 
  ## by giving a vector of names to parameter `dnn`, which means "dimension names"
  table <- table(loan$application_type, 
                 loan$homeownership, 
                 dnn = c("application type", 
                         "home ownership"
                         )
                 )
  print(table)
  class(table)


# 3. Create sum column and sum row in contingency table: `addmargins()`
  table_withsum <- addmargins(table)
  print(table_withsum)
  class(table_withsum)


# 4. Bar plot: `geom_bar()`
  
  ## specify the x-axis and subgroup for filling color of the graph
  bar_graph <- ggplot(loan, aes(x = homeownership, fill = application_type)) +
    
    ## add bar graph, and let different bars dodge each other
    geom_bar(position = "dodge")

  print(bar_graph)


# 5. Add labels to the graph: `labs()`

  ## let's continue from the bar graph we just draw
  bar_graph_withlabel <- bar_graph +

    ## add graph title and axis label to make the graph more readable
    labs(
      x = "Type of Homeownership",
      y = "Number of People",
      title = "The Bar Graph with Beautiful Labels",
      fill = "Application Type"
    ) +

    ## center the title text
    theme(plot.title = element_text(hjust = 0.5))

  print(bar_graph_withlabel)


# 6. Adjust the scale of x and y-axis: `scale_x_continuous()` or `scale_y_continuous()`

  ## recall the scatter plot we drawn two weeks ago
  scatter_plot <- ggplot(county, aes(x = multi_unit, y = homeownership)) +
    geom_point(color = "steelblue", shape = 5)
  print(scatter_plot)

  ## We want to change the scale of x, y-axis in the plot to make it more readable
  scatter_plot_scale <- scatter_plot +

    ### change the scale and label of x-axis
    scale_x_continuous(
      breaks = c(0, 20, 40, 60, 80, 100),
      labels = c("0%", "20%", "40%", "60%", "80%", "100%")
    ) +
    
    scale_y_continuous(
      breaks = c(0, 50, 100),
      labels = c("0%", "50%", "100%")
    )
  print(scatter_plot_scale)






