vec = c(1,5,10)
vec[3]


vec[length(x = vec)]
#length (x=vec) gives the last index

#Extracting all the items in a vector
1:length(vec)


#Deleting individual items using negative indexing

vec[-1]  #first item is removed

vec[-2] #second item is removed

qux <- vec[-(length(vec)-1)]
qux

#NOTE: Using the square-bracket operator to extract or delete values from a
#vector does not change the original vector you are subsetting unless you
#explicitly overwrite the vector with the subsetted version


#---------------------------------------VECTOR ORIENTED BEHAVIOUR-----------------------------------#

foo <- 5.5:0.5
foo

foo-c(2,4,6,8,10,12)
foo

#You could explicitly multiply foo by c(1,-1,1,-1,1,-1), but you
#don’t need to write out the full latter vector.


bar = c(1,-1)
foo
foo*bar

#Now let’s see what happens when the vector lengths are not evenly divisible.

baz = c(1,-1,0.5,-.5)
foo
foo*baz

# this vector-oriented behavior applies in the
#same way to overwriting multiple elements

foo
foo[c(1,3,5,6)] = c(-99,99) #replacing elements
foo







#------------------------------EXERCISE 2.5------------------------------------#

#a. Convert the vector c(2,0.5,1,2,0.5,1,2,0.5,1) to a vector of only
#1s, using a vector of length 3.


foo = c(2,0.5,1,2,0.5,1,2,0.5,1)
foo/c(2,0.5,1)
foo


#b) 

temp = c(45, 77, 20, 19, 101, 120,212)

C = (5/9)*(temp-32)
C

