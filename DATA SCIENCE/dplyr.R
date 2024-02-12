library("tidyverse")
install.packages("nycflights13")
library("nycflights13")

nycflights13::flights
View(flights)



#Pick observations by their values (filter()).
#Reorder the rows (arrange())
#Pick variables by their names (select()).
# Create new variables with functions of existing variables (mutate()).


#selecting all flights on jann 1st


#addign a paranthesis before jan will save the result in a new variable and then print the result too
(jan = filter(flights, month == 1, day== 1))


#------------Logical operators----------------#

#The following code finds all flights that departed in November or December

filter(flights, month == 11 | month == 12)
#alternate way
filter(flights, month %in% c(11,12))



#if you wanted to find flights that weren’t delayed (on arrival or departure) by more than two hours

filter(flights, !(arr_delay > 120| dep_delay > 120))

#If you want to determine if a value is missing, use is.na()


#---------------EXERCISES--------------#

df = flights
df

#1. Find all flights that:

#a. Had an arrival delay of two or more hours

(arr2 = filter(flights, arr_delay > 120 ))

#b. Flew to Houston (IAH or HOU)

(flew = filter(flights, dest == "IAH" | dest == "HOU"))

#c. Were operated by United, American, or Delt

(carr = filter(flights, carrier %in% c('UA','AA','DT' )))

#d. Departed in summer (July, August, and September)

(dept = filter(flights, dep_time == 7 & dep_time == 8 & dep_time == 9))


#e. Arrived more than two hours late, but didn’t leave late

filter(flights, arr_delay >2 , dep_delay == 0)


#g. Departed between midnight and 6 a.m. (inclusive)

filter(flights,dep_time >= 1200 & dep_time <= 600)

filter(flights, between(dep_time, 1200,600))

#2. Another useful dplyr filtering helper is between(). What does it do? Can you use it to simplify the code needed to answer the previous challenges?


filter(flights, )
?between()


#3. How many flights have a missing dep_time? What other variables are missing? What might these rows represent?

filter(flights, is.na(dep_time))

















