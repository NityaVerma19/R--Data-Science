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


