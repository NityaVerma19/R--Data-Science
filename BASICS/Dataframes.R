
#NOTE: The most important distinction between a list and dataframe is that in a df, the members must all be vectors of equal length

#-------CREATING A DF--------#

df = data.frame(person = c("Peter", "Lois", "Meg", "Chris", "Stewie"),
                    age = c(42,40,17,14,1),
                    sex = factor(c("M", "F", "F","M","M")))
#factors are a class of data that allow for ordered categories with a fixed set of acceptable values
df


#Extracting positions
df[2,2]
df[3:5,3]
df[,c(3,1)]

df$age
df$age[2]
nrow(df)
ncol(df)
dim(df)

#R’s default behavior for character vectors passed to data.frame is to convert each variable into a factor object

df$person



#--------Adding data columns and combining df-----#

#using rbind to add a new row

newrec = data.frame(person="Brian",age=7,
                     sex=factor("M",levels=levels(df$sex)))
newrec
#Note that for a factor, you can extract the levels of the existing factor variable using levels

df = rbind(df, newrec)   #added a new record
df


#Adding a new column using cbind

funny <- c("High","High","Low","Med","High","Med")
funny <- factor(x=funny,levels=c("Low","Med","High"))
#The first line creates the basic character vector as funny, and the second
#line overwrites funny by turning it into a factor.

funny
df = cbind(df, funny)
df


# One useful alternative for adding a variable is to use the dollar operator, much like adding a new member to a named list

#adding another variable to mydata by including acolumn with the age of the individuals in months
df$age.mon= df$age+ 12
df



#--------------LOGICAL RECORD SUBSETS-----------------------#

#This flags the male records
df$sex == 'M'

#This returns data for all variables for only the male participants
df[df$sex == 'M',]

#Omitting sex using negative indexing
df[df$sex == 'M',-3]

#Or by using names instead
df[df$sex == 'M',c("person","age","funny","age.mon")]


# Let’s extract from mydata the full records for individuals who are
#more than 10 years old OR have a high degree of funniness.


df[df$age>10 | df$funny == 'High']

#Sometimes, asking for a subset will yield no records. In this case, R

df[df$age >45,]



#------------------------NAN---------------------------------#

qux = c(NA,5.89,Inf,NA,9.43,-2.35,NaN,2.10,-8.53,-7.58,NA,-4.58,2.01,NaN)

which(x = is.nan(qux))  #index of values which are nan
x #a boolean result

?which


#Omitting the nan values

qux = na.omit(object = qux)
qux


#-----------------------NULL-----------------------#

#An instance of NA clearly denotes an existing
#position that can be accessed and/or overwritten if necessary—not so for
#NULL. You can see an indication of this if you compare the assignment of NA
#with the assignment of a NULL.

r = c(2,3,4, NA,5)
q = c(2,3,NULL,2)


opt.arg <- c("string1","string2","string3")

is.na(opt.arg)
is.null(opt.arg)

#The position-specific nature of NA means that this check is element-wise
#and returns an answer for each value in opt.arg. This is problematic because
#you want only a single answer—is opt.arg empty or is it supplied? This is
#when NULL comes to the party

