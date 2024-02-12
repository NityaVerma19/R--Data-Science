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

