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



#-----Omitting and Overwriting


#To delete or omit elements from a matrix, you again use square brackets,
#but this time with negative indexes

A
A[,-2]  #omitting 2nd col


#Removing the first row and extracting 3rd and 2nd col
A
A[-1, c(3,2)]


#Removing 1st row and 2nd col

A[-1,-2]



#To overwrite particular elements, or entire rows or columns, you identify
#the elements to be replaced and then assign the new values

B = A
B

# overwrites the second row of B with the sequence 1, 2,and 3
B[2,] = 1:3
B


#overwrites the second column elements of the first andthird rows with 900

B[c(1,3), 2] = 900
B



# replace the diagonal of a square matrix

diag(x =B) = rep(x = 0, times = 3)
B


#-------------------------------------------EXERCISE 3.1---------------------#

#a) 

C = matrix(c(4.3, 3.1, 8.2, 8.2, 3.2, 0.9, 1.6,6.5), nrow = 4, ncol = 2)
C

#b) 
B = C[-1,]
dim(B)

#c) 
C
C[,2] = sort(C[,2])
C


#d) 
 
matrix(C[-4,-1])


#e)
C
matrix(data = C[c(3,4),c(1,2)], nrow =2, ncol = 2)


#----------------------------------------MATRIX OPERATIONS AND ALGEBRA--------------------------------------#

#-----Transpose

A= rbind(c(2,5,2), c(6,1,4))

t(A)


#-----Identity matrix

I = diag(x =3)
I


#NOTE: 
#If, as earlier, x is a matrix, diag will retrieve the diagonal elements
#of the matrix. If x is a single positive integer, as is the case here, then diag
#will produce the identity matrix of the corresponding dimension



#---------Scalar multiple of a matrix

A = rbind(c(2,5,2),c(6,1,4))
A
a = 2
A*a


#-------Matrix Addition and Subtraction

A = cbind(c(2,5,2),c(6,1,4))
A

B <- cbind(c(-2,3,6),c(8.1,8.2,-9.8))
B

A-B

#-------Matrix multiplication

A <- rbind(c(2,5,2),c(6,1,4))
A

B <- cbind(c(3,-1,1),c(-3,1,5))
B
A%*%B


#----------Matrix Inversion
A <- matrix(data=c(3,4,1,2),nrow=2,ncol=2)
A

solve(A)


#You can also verify that the product of these two matrices (using matrix
#multiplication rules) results in the 2 × 2 identity matrix

A%*%solve(A)




#-------------------------------EXERCISE 3.2-------------------------------------------#

#a)
A = matrix(data= c(1,2,7,2,4,6), nrow = 3, ncol =2)
A

B= matrix(data = c(10,30,50,20,40,60), nrow=3, ncol =2)
B

C =2/7

C*(A-B)

#b)

A=cbind(c(1,2,7))
A

B = cbind(c(3,4,8))
B

dim(A)
dim(B)

A%*%B  #not possible

t(A)%*%B

t(B)%*%(A%*%t(A))

solve((B%*%t(B))+ (A%*%t(A)) - 100*diag(3))

