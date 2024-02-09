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


#-------------------SUBSETTING--------------------------#

A <- matrix(c(0.3,4.5,55.3,91,0.1,105.5,-4.2,8.2,27.9),nrow=3,ncol=3)
A

#extractig 105.5

A[3,2]



#---row, column, diagonal extractions


#extracting column 2
A[,2]

#extracting first row
A[1,]

#Extracting only 2nd and 3rd row
A[2:3,]


#Extracting 3rd and 1st col

A[,c(3,1)]

#accesses the third and first rows of A, in that order, and from those rows it
#returns the second and third column elements.
A[c(3,1),2:3]
