
# clear the memory

rm(list = ls())
library(tidyverse)


# today's dataset: babies born in 1960-1967 in the SF East Bay area.

babies <- read.csv("data/babies.csv") 
print(babies)

## Logical expressions

# 1. Comparison Operators: >, <, =, !

# > (Greater than)
print(5 > 4)

# >= (Greater or equal)
print(3 >= 4)

# < (Smaller than)
print(5 < 4)

# >= (Smaller or equal)
print(3 <= 4)

# == (Equal to) 
print(4 == 4)

# != (Not equal to)
print("H" != "I")

# 2. AND: & (element wise), && (first element only)

# AND: & (element wise), && (first element only)
x <- c(3, 5, 8)
x > 4 & x < 7 # FALSE TRUE FALSE
x > 4 && x < 7 # FALSE

# OR: | (element wise), || (first element only)
x <- c(3, 5, 8)
x > 4 | x < 7 # TRUE TRUE TRUE
x > 4 || x < 7 # TRUE

# Use && if inside an if statement
if (TRUE || FALSE){
  print("TRUE!")
}

# & and | are useful as filters:
df <- data.frame(age = c(16, 22, 30, 40),
                 score = c(80, 90, 55, 60))
df[df$age > 18 & df$score > 70, ]

# 3. Check if object inside a vector or list: %in%

# example 1
fruit <- c("apple", "banana", "pear")
basket <- c("banana", "orange", "pear", "kiwi")
fruit %in% basket # FALSE TRUE TRUE

# example 2
3 %in% list(1, 2, 3, 4, 5) # TRUE
3 %in% list(1:5, 6:10) # FALSE
1:5 %in% list(1:5, 6:10) # FALSE FALSE FALSE FALSE FALSE
list(1:5) %in% list(1:5, 6:10) # TRUE

# 4. Use () for clearer expressions

x <- 7

# comparisons (>, <, ==) are evaluated before &
# & is evaluated before |
x > 4 & x < 10 | x == 2 & x > 8 # TRUE
# this is equivalent to
(x > 4 & x < 10) | (x == 2 & x > 8) # TRUE

# however, if you meant to calculate from left to right
(((x > 4 & x < 10) | x == 2) & x > 8) # FALSE

## Data Wrangling

# 1. Using pipeline to pass data to function: `%>%`

# example: calling the function to deal with numeric data
num <- -3:3
print(num)

num_abs <- num %>% 
  cumsum() %>%
  print()


# 2. Filter the data according to some conditions: `filter()`

## example 1: single condition
babies_height_62_64 <- babies %>% 
  filter(height %in% 62:64)

print(babies_height_62_64)


## example 2: multiple conditions
babies_bwt_gt120_smoke <- babies %>% 
  filter(bwt > 120 & smoke == 1)

print(babies_weight_gt120_smoke)

# 3. Select variables: `select()`
babies_age_bwt <- babies %>% 
  select(bwt, age)

print(babies_age_bwt)

babies_wo_case_bwt <- babies %>% 
  select(-c(case, bwt))

print(babies_age_bwt)

# 4. Generate new column from existing variables: `mutate()`

# example 1
babies_ht_wt <- babies %>% 
  mutate(ht_wt = height + weight)

print(babies_ht_wt)

# example 2
babies_age_gt30 <- babies %>% 
  mutate(age_30 = ifelse(age > 30, "age > 30", "age <= 30"))

print(babies_age_gt30)  

# example 3
babies_ht_group <- babies %>% 
  mutate(ht_group = case_when(
    is.na(height) ~ NA,
    height <= 63 ~ "ht <= 63",
    height > 63 & height < 67 ~ "63 < ht < 67",
    TRUE ~ "ht >= 67"
  ))

print(babies_ht_group)  


# 5. Sort the data according to some variable: `arrange()`

# descending order
babies_ht_desc <- babies %>% 
  arrange(desc(height)) # desc = descending; default = ascending

print(babies_ht_desc)

# ascending order
babies_ht_asc <- babies %>% 
  arrange(height) 

print(babies_ht_asc)


arrange(select(filter(babies, height >= 60), 
               bwt, 
               height),
        desc(bwt)
)