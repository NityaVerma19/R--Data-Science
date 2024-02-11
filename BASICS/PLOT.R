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

R> plot(foo,bar,type="b",main="My lovely plot",xlab="",ylab="",col="seagreen4")


#Line and point appearances 

#To alter the appearance of the plotted points you would use pch, and to
#alter the lines you would use "lty"

plot(foo,bar,type="b",main="My lovely plot",xlab="",ylab="",
     col=4,pch=8,lty=2,cex=2.3,lwd=3.3)

# The lty parameter, which affects the type of line drawn, can
#take the values 1 through 6. 

#You can also control the size of plotted points using cex

#thickness of lines using lwd

plot(foo,bar,type="b",main="My lovely plot",xlab="",ylab="",
     col=4,pch=8,lty=2,cex=2.3,lwd=3.3,xlim=c(-10,5),ylim=c(-3,3))

#Both parameters require a numeric vector of length 2, provided as
#c(lower,upper).