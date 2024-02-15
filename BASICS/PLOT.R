foo = c(1.1, 2, 3.5, 3.9, 4.2)
bar = c(2,2.2,-1.3,0,0.2)
plot(foo, bar)


#The x and y locations don’t necessarily need to be specified as separate vectors

baz = cbind(foo,bar)
baz
plot(baz)


plot(foo,bar,type="l")

plot(foo,bar,type ="b",main = "plot" , xlab = "x axis label", ylab = "location y")


#Color

plot(foo, bar, type = "b" , main = "plot", xlab = "", ylab = "", col = 2)

plot(foo,bar,type="b",main="My lovely plot",xlab="",ylab="",col="seagreen4")


#Line and point appearances 

#To alter the appearance of the plotted points you would use pch, and to
#alter the lines you would use "lty"

plot(foo,bar,type="b",main="My lovely plot",xlab="",ylab="",
     col=2,pch=5,lty=2,cex=2.3,lwd=3.3)

# The lty parameter, which affects the type of line drawn, can
#take the values 1 through 6. 

#You can also control the size of plotted points using cex

#thickness of lines using lwd

plot(foo,bar,type="b",main="My lovely plot",xlab="",ylab="",
     col=4,pch=8,lty=2,cex=2.3,lwd=3.3,xlim=c(-10,5),ylim=c(-3,3))

#Both parameters require a numeric vector of length 2, provided as
#c(lower,upper).


#--------------Adding Point,Lines and text to an existing plot--------------------#'


#points Adds points
#lines, abline, segments Adds lines
#text Writes text
#arrows Adds arrows
#legend Adds a legend

x = 1:20
y = c(-1.49,3.37,2.59,-2.78,-3.94,-0.92,6.43,8.51,3.41,-8.23,
      -12.01,-6.58,2.87,14.12,9.63,-4.58,-14.78,-11.67,1.17,15.62)



#Step 1 =  The first step is to create the empty plotting region where you can add
#points and draw lines

plot(x,y,
     type = "n",
    main = "")


#Step 2 : The abline function is a simple way to add straight lines spanning a plot.


#the line can be specified with slope and intercept 
#this code adds two separate horizontal lines, one at y =-5 and the other at y= 5

abline(h =c(-5,5), col = "red", lty = 2, lwd = 2)

#Step 3 : adding shorter vertical lines

#we will use segments not abline, since we don't want the lines to span the entire region
#from x0,y0 to x1,y1

segments(x0 = c(5,15), y0 = c(-5,5),
         x1 = c(5,15), y1 = c(5,5),
         col = 'red',
         lty = 3 ,
         lwd = 2)


#Step 4 : adding points to values of y > 5 

#Just like plot, points takes two vectors of equal lengths
#with x and y values.

points(x[y>5], y[y>5], pch = 4, col = "darkmagenta", cex = 2)



#Step 5: extracting values> = -5

points(x[y<= -5], y[y<=-5], pch = 3, col = "darkgreen", cex =2)

#The sixth step adds the blue “sweet spot” points, which are identified
#with (x>=5&x<=15)&(y>-5&y<5).


points(x[(x>=5&x<=15) & (y>-5&y<5)] , y[(x>=5&x<=15) & (y>-5&y<5)], pch =19, col ="blue")


#Step  7- adding the remaining points
points(x[(x<5|x>15)&(y>-5&y<5)],y[(x<5|x>15)&(y>-5&y<5)])


#Step - 8 draw lines connecting the coordinates in x and y

lines(x,y,lty = 4)

#step 9: add arrow pinting to the sweet spot
#arrows has a from and to parameter

arrows(x0= 8, y0= 14, x1 = 11, y1 = 2.5)

#step 10: add a label on the plot

#default behaviour of text is centered

text(x = 8, y=15, labels="sweet spot")

#step 11 - add legend

legend("bottomleft",
      legend=c("overall process","sweet","standard",
               "too big","too small","sweet y range","sweet x range"),
      pch=c(NA,19,1,4,3,NA,NA),lty=c(4,NA,NA,NA,NA,2,3),
      col=c("black","blue","black","darkmagenta","darkgreen","red","red"),
      lwd=c(1,NA,NA,NA,NA,2,2),pt.cex=c(NA,1,1,2,2,NA,NA))
