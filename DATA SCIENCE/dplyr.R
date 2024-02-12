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




#------------ARRANGE-----------------#
#arrange() works similarly to filter() except that instead of selecting rows, it changes their order.

df

arrange(df, year, month, day)
?arrange



#-------------Exercises----------------#
#1. How could you use arrange() to sort all missing values to the start? (Hint: use is.na().)
arrange(flights, desc(is.na(dep_time)))

#2. Sort flights to find the most delayed flights. Find the flights
#that left earliest.

arrange(flights, desc(dep_delay))
arrange(flights, !desc(dep_time))

#3. Sort flights to find the fastest flights.

flights = mutate(flights, 
       time_taken = arr_time - dep_time)   
arrange(flights, !desc(time_taken))


#4. Which flights traveled the longest? Which traveled the shortest


View(flights)
longest = arrange(flights, desc(distance))

arrange(flights, !desc(distance))


#------------------SELECT-------------------w


#selecting only month and year
select(flights, month, year)

# Select all columns between year and day (inclusive)

select(flights, year:day)

# Select all columns except those from year to day (inclusive)

select(flights, -(year:day))


#There are a number of helper functions you can use within select()


#starts_with("abc")

select(flights, starts_with('ta')) #column that starts with ta

#ends_with("xyz")

select(flights, ends_with('ay'))

#contains("ijk") 

select(flights, contains('a'))

#---------Add New Variables with mutate() ------------#


#compute hour and minute from dep_time 

#%/% (integer division) and %% (remainder)

mutate(flights,dep_time ,hour = dep_time%/%100 )
mutate(flights, dep_time, min = dep_time %% 100)
flights$minute

#---------Grouped Summaries with summarize()------------#

#. It collapses a data frame to a single row

#group_by and summarize should be used together


by_day = group_by(flights, day, month, year)
summarize(by_day, delay = mean(dep_delay, na.rm = TRUE))
?group_by

#------Combining Multiple Operations with the Pipe----------#


delays = flights %>%
  group_by(dest) %>%
  summarize(count = n(), dist = mean(distance, na.rm = TRUE),
           delay = mean(arr_delay, na.rm = TRUE))%>%
  filter(count >20, dest != 'HNL')

#na.rm removes the missing values

#flights which are not cancelled

not_can = flights %>%
  filter(!is.na(dep_delay), !is.na(arr_delay))

#Whenever you do any aggregation, it’s always a good idea to include
#either a count (n()), or a count of nonmissing values
#(sum(!is.na(x))). That way you can check that you’re not drawing
#conclusions based on very small amounts of data.


#-----------SURVEYS DATASET-------------#

#importing data
choose.files()
sur = read.csv("C:\\Users\\DELL\\Downloads\\surveys.csv")
sur


#class of the data

class(sur)

#data type of each column

str(sur)

#Using pipes, subset the surveys data to include animals collected 
#before 1995 and retain only the columns year, sex, and weight


sur%>%
  filter(year<1995)%>%
  select(year, sex, sex, wgt)

#To create a new column of weight in kg
View(sur)
sur%>%
  filter(!is.na(wgt))
  mutate(wt_in_kg = wgt/1000 )%>%
  head



#Find the sex wise, spcies_id wise mean weight.

sur%>%
  group_by(sex)%>%
  summarise(mean_wt = mean(wgt , na.rm = TRUE))

#Modify the previous output by adding a column indicating the 
#minimum weight for each species for each sex.

sur%>%
  filter(!is.na(wgt))%>%
  group_by(sex)%>%
  summarise(mean_wt = mean(wgt , na.rm = TRUE),
            min_wt = min(wgt))

#• Display the output for lighter species first (Hint: arrange())


sur%>%
  filter(!is.na(wgt))%>%
  group_by(sex)%>%
  summarise(mean_wt = mean(wgt , na.rm = TRUE),
            min_wt = min(wgt))%>%
  arrange(min_wt)


# count the number of rows of data for each sex

count(sur, sex)

# make a contingency table of sex and species_id

count(sur, sex, species)

#• Arrange the table in
#• an alphabetical order of the levels of the species
#• in descending order of the count

sur%>%
  count(sex, species)%>%
  arrange(!desc(species), desc(n))

#What was the heaviest animal measured in each year? Return the 
#columns year, genus, species_id, and weigh

sur%>%
  filter(!is.na(wgt))%>%
  group_by(year)%>%
  filter(wgt == max(wgt))%>%
  select(year, species, wgt)%>%
  arrange(year)





