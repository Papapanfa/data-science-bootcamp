# เรียกใช้ library
library(nycflights13)         
library(tidyverse) # dplyr
library(dplyr)


# ask 5 questions about this dataset
# database
data("flights")       
data("airlines")
#data("airports")

## 1. Top 10 all of time most flights 
top_ten <- flights %>%      # select dataframe
  count(carrier) %>%        # count flights
  head(10) %>%              # select top 10
  arrange(desc(n)) %>%      # sort n
  left_join(airlines)

## 2. Top 5 most air time in hours
flights %>%
  select(carrier, origin, dest, air_time) %>%
  mutate(air_time_hours = air_time/60) %>%
  arrange(desc(air_time_hours)) %>%
  head(5) %>%
  left_join(airlines)

# 3. Summarise total hours, total minutes in Q1
q1 <- flights %>%
  filter(year == 2013 & month %in% c(1, 2, 3)) %>%
  count(carrier)



# 4. Summarise total hours, total minutes in Q2
q2 <- flights %>%
  filter(year==2013 & month %in% c(4, 5, 6)) %>%
  count(carrier) 

            
# 5. Compare Q1 and Q2
View(q1)
View(q2)

joined_table <- q1 %>%
  left_join(q2, by = "carrier")

joined_table %>%
  mutate(diff_per = if_else(n.y > n.x, ((n.y-n.x))*100/n.x, ((n.y-n.x)/n.x)*100))
  


View(flights)

# 6. Which most 10 destination from JFK
q3 <- flights %>%
  select(carrier, origin, dest) %>%
  filter(origin == "JFK") %>%
  count(dest) %>%                   # count = n
  mutate(flights_from_JFK = n) %>%
  arrange(-n)

q3 %>%
  select(dest, flights_from_JFK) %>%
  head(10)
