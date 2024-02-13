#FACTOR ANALYSIS
data= read.csv("C://Users//DELL//Downloads//protein.csv")
data = data[2:9]
normelized_data = scale(data)
fa = factanal(x = normelized_data, n.obs = 50, rotation = 'varimax', factors = 2)
fa

fad = factanal(x = data, n.obs = 50, rotation = 'varimax', factors = 2)
fad


#the p value is greater than 0.05 hence significant but the variation explained is low

fa2 = factanal(data, n.obs = 50, rotation = 'varimax', factors = 3)
fa2


fa3 = factanal(data, n.obs = 50, rotation = 'varimax', factors = 4)
fa3

comm = fad$loadings %*% t(fad$loadings)
diag(comm)
