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


