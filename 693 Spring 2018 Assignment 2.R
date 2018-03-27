##install packages
install.packages("tidyverse")
install.packages("nycflights13")

## load libraries
library(tidyverse)
library(nycflights13)

## dataset for assignment
flights

#Part 3 kinda
f.dorc=flights %>% 
  mutate(Cancelled=is.na(flights$dep_delay),
         Date=paste(year, month, day, sep="-" )) %>% 
  group_by(Date) %>% 
  summarize(PerCancelled=mean(Cancelled)*100,
            avgDelay=mean(dep_delay,na.rm = T))
ggplot(data = f.dorc, aes(x=PerCancelled, y=avgDelay  )) +
  geom_point()


#Part 4 kinda
flights %>% 
  group_by(carrier) %>% 
  summarise(mean(dep_delay, na.rm = T))

#F9

#Challenge part
flights %>% 
  group_by(carrier, dest) %>% 
  summarise(n())

#Part 5

flights %>% 
  arrange(time_hour) %>%
  group_by(tailnum) %>%
  filter(between(arr_delay,left=60,   right = Inf )) %>% 
  summarise(n())



#Part 6
flights %>% 
  group_by(tailnum) %>% 
  mutate(On_timeper=mean(arr_delay>0,na.rm = T)*100) %>% 
  arrange((On_timeper)) %>% 
  select(tailnum, On_timeper)
#Lots of flights never on time

#Part 7
flights %>% 
  group_by(hour) %>% 
  mutate(NoDelay=arr_delay<=0) %>% 
  summarise(mean(NoDelay, na.rm=T))
#Fly at 7am 

#Part 8
#8.1
flights %>% 
  filter(arr_delay>0) %>% 
  group_by(dest) %>% 
  summarise(sum(arr_delay, na.rm = T))

#8.2
flights %>% 
  filter(arr_delay>0 ) %>% 
  group_by(dest) %>% 
  mutate(dest_delay=sum(arr_delay, na.rm = T)) %>% 
  group_by(flight) %>% 
  arrange(arr_delay/dest_delay)

#9
flights %>% 
  group_by(dest) %>% 
  mutate(shortest=min(distance, na.rm = T)) %>% 
  ungroup() %>% 
  mutate(suspicion=shortest/air_time) %>% 
  arrange(desc(suspicion)) %>% 
  select(flight, air_time, distance, suspicion)
#Probably could find better code for this. 
#Nothing has a terribly suspicious speed


#9.2  
flights %>% 
  mutate(air_delay=arr_delay - dep_delay) %>% 
  arrange(desc(air_delay)) %>% 
  select(flight, air_delay)