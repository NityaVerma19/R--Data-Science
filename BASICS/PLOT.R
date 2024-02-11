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
