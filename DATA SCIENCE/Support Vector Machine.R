set.seed(1)
x = matrix(rnorm(20*2), ncol = 2)
y = c(rep(-1,10), rep(1,10))
y
x[y==1,] = x[y==1,]+1
plot(x, col = (3-y))

dat = data.frame(x = x, y = as.factor(y))

install.packages("e1071")
library(e1071)

svmfit = svm(y~., data =dat, kernel = "linear", cost = 10, scale = FALSE) 
#cost needs to be optimized, that can be done using tune
svmfit$index
summary(svmfit)

#-----optimizing cost--------#
set.seed(1)
tune.out = tune(svm, y~., data = dat, kernel = "linear",
                ranges = list(cost = c(0.001, 0.01, 0.1, 1,5,10,100)))

summary(tune.out)

bestmod = tune.out$best.model
summary(bestmod)   #the best cost is 5



#-----------test data--------#
set.seed(2)
xtest = matrix(rnorm(20*2), ncol = 2)
ytest = sample(c(-1,1), 20, rep = TRUE)

xtest[ytest ==1,]=xtest[ytest ==1,]+1
testdat = data.frame(x = xtest, y = as.factor(ytest))
ypred = predict(bestmod, testdat)
table(predict = ypred,  truth = testdat$y)




#-----non-linear data-----------#

set.seed(1)
x = matrix(rnorm(200*2), ncol =2)
x[1:100,] = x[1:100,]+2
x[101:150,] = x[101:150,]-2

y = c(rep(1,150), rep(2,50))
data = data.frame(x = x, y = as.factor(y))

plot(x, col = y)



train = sample(200,100)
svmfit = svm(y~., data =dat[train,], kernel = "radial", gamma = 1,cost = 10, scale = FALSE) 
svmfit$index

set.seed(1)
tune.out = tune(svm,y~., data = dat[train,],kernel = "radial",
                ranges = list(cost = c(0.1,0.01,5,10,100), gamma = c(1,2,3,4,5)))
summary(tune.out)



















