#creating an equally spaced sequence of increasing or decreasing numeric vaues

x = 3:27   #from 3 to 27 (by 1)
x

foo = 5.3
bar = foo:(-2+1)
bar


#USING SEQ

#seq(from=, to=, by=)

seq(from = 3, to = 27, by =3)


seq(from = 3, 27,length.out = 40)






#REPETITION WITH rep

#used for repeating a certain value

rep(x = 1, times = 4)
rep(x = c(3,62,8.3), times= 5)
rep(x = c(3,43,2,1), each =2)

foo = 4
c(3,8.3, rep(x = 32, times = foo), seq(from = -2, to = 1, length.out =foo+1))



#SORTING WITH sort

sort(x = c(2.5,-1,-10), decreasing= FALSE)
sort(x = c(2.5, -1,-10), decreasing =TRUE)


#FINDING LENGTH WITH length

length(x = 5:13)


#EXERCISE

#A)Create and store a sequence of values from 5 to −11 that progresses in steps of 0

seq1 = seq(from = 5, to= -11, by = -0.3)
seq1

#B)  Overwrite the object from (a) using the same sequence with the
#order reversed.

seq1 = seq(from = -11, to= 5, by = 0.3)
seq1

#C) Repeat the vector c(-1,3,-5,7,-9) twice, with each element
#repeated 10 times, and store the result. Display the result sorted
#from largest to smallest.


vec = rep(c(-1,3,-5,7,-9), times = 2,each =10)
sort(vec, decreasing= TRUE)
length(vec)

#D) Create and store a vector that contains, in any configuration, the
#following:
#  i. A sequence of integers from 6 to 12 (inclusive)
#  ii. A threefold repetition of the value 5.3
#  iii. The number −3
#  iv. A sequence of nine values starting at 102 and ending at the
       #number that is the total length of the vector created in (c)

vec2 = c(6:12, rep(5.3, times= 3), -3, seq(from=102, to=length(vec), length.out = 9))
vec2


#E)Confirm that the length of the vector created in (d) is 20.

length(vec2)
