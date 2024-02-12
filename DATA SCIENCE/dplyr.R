library("tidyverse")
library(dplyr)
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






