foo <- list(matrix(data=1:4,nrow=2,ncol=2),c(T,F,T,T),"hello")
foo

length(foo)


#Note: use double square brackets
foo[[1]]

foo[[3]]



#NOTE:
#This action is known as a member reference. When you’ve retrieved a
#component this way, you can treat it just like a stand-alone object in the
#workspace; there’s nothing special that needs to be done

foo[[1]] + 5.5

foo[[1]][1,2]

cat(foo[[3]],"you!")  #concatenate and print


foo[[3]] <- paste(foo[[3]],"you!")
foo

bar <- foo[c(2,3)]
bar                  


#-----------Naming 

#n name list components to make the elements more recognizable andeasy to work with

names(foo) <- c("mymatrix","mylogicals","mystring")
foo

#extracting using names

foo$mymatrix

all(foo$mymatrix[,2] == foo[[1]][,2])
