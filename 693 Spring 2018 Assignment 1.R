##install packages
install.packages("tidyverse")
install.packages("nycflights13")

## load libraries
library(tidyverse)
library(nycflights13)

## dataset for assignment
flights

#3a
flights %>% 
  filter(arr_delay>2*60)


#3b 
flights %>% 
  filter(dest=="IAH"|| "HOU" )

#3c
flights %>% 
  filter(carrier %in% c("DL","AA","UA"))

#3d
flights %>% 
  filter(month==6,7,8)
         
#3e 
flights %>% 
  filter(arr_delay>2*60 & dep_delay<1)

#3f
flights %>% 
  filter(arr_delay<-30 & dep_delay>=60)

#3g
flights %>% 
  filter(dep_time<=600)

#3h
flights %>% 
  arrange(desc(dept_delay)) #most delayed
flights %>% 
  arrange(dept_delay) #left the earliest


#3i
flights %>% 
  arrange(air_time) 

#3j
flights %>% 
  arrange(desc(distance)) #longest
flights %>% 
  arrange(distance) #shortest

