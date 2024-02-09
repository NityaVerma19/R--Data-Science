#Creating a 2x2 matrix

a = matrix(data = c(-3,2,893,0.17), nrow = 2, ncol=2)
a


#byrow
matrix(data=c(1,2,3,4,5,6),nrow=2,ncol=3,byrow=FALSE)

matrix(data=c(1,2,3,4,5,6),nrow=2,ncol=3,byrow=TRUE)



#------------------------row and column bindings--------------------------------#

#If you have multiple vectors of equal length, you can quickly build a matrix
#by binding together these vectors using the built-in R functions, rbind and
#cbind.


rbind(1:3, 4:6)

cbind(c(1,4), c(2,5), c(3,6))

#---------------------Matrix Dimensions----------------------------------#

mymat = rbind(c(1,3,4), 5:3, c(100,20,90), 11:13)

dim(mymat)     #4 rows, 3 cols
nrow(mymat)    # 4 rows
ncol(mymat)   # 3 cols
dim(mymat)[2]  #extracting only no of cols = 3


