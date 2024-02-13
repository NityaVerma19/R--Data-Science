#PCA 


df = iris
df
?prcomp

df = df[1:4]
pr.out = prcomp(x = df, scale =FALSE)
pr.out

pr.out$rotation

boxplot(df)
boxplot(scale(df))

pr.out1 = prcomp(x =df, scale =TRUE)

pr.out1$rotation

var = pr.out1$sdev^2
pve = var/sum(var)
pve


plot(pve, xlab = 'Principal Component',
     ylab = 'Proportion of variation explained',
     type ='b')

plot(cumsum(pve), xlab ='Cumulative Principal Component', type ='b')
biplot(pr.out1, scale = 0)

df1 = iris

fviz_pca_biplot(col.ind = df1$Species, pr.out1, addEllipses = TRUE)






