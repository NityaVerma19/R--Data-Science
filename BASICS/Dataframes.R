
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
