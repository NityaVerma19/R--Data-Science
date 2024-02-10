
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


