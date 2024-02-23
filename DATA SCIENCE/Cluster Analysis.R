install.packages('ISLR2')
library(ISLR2)


usarres = USArrests
boxplot(usarres)
?dist   #computes the distance matrix

dim(usarres)   #50 cities, 4 variables
View(as.matrix(dist(usarres)))       #50 X 50

#Complete linkage using Euclidean Distance

usarres_comp = hclust(dist(usarres), method ='complete')
?hclust #Hierarchical cluster analysis on a set of dissimilarities and methods for analyzing it.
usarres_comp
plot(usarres_comp)


#cutting the tree according to the height
ct = cutree(usarres_comp, h=150)
ct
?cutree

#cities in cluster 1
ct[which(ct==1)]
?which

#cities in cluster 2
ct[which(ct==2)]

#cities in cluster 3
ct[which(ct==3)]

plot(usarres$Murder, usarres$UrbanPop,
     col = ct, cex = 3)
#we can't see any groups


plot(usarres$Murder, usarres$Assault,
     col = ct, cex = 2)
#we can see groups. Assaults are high for the black clusters irrespective of the murders

#------SCALING THE VARIABLE AND THEN PLOTTING-----------------#

usarres_scaled = scale(usarres, center =  FALSE, scale = TRUE) #center = FALSE means the mean doesn't have to be the same

boxplot(usarres_scaled)


#Complete linkage using euclidean distance

usarres_scaled_comp = hclust(dist(usarres_scaled), method = 'complete')

plot(usarres_scaled_comp)

View(as.matrix(dist(usarres_scaled)))


#making a new cutree on the scaled data based on 2 clusters
ct1 = cutree(usarres_scaled_comp,k=2)


plot(usarres_scaled[,1], usarres_scaled[,2], col = ct1)   #based on arrests and urban pop
plot(usarres_scaled[,1], usarres_scaled[,3], col = ct1)   #based on arrests and murders


#1 - murder, 2- arrest
usarres_scaled[,1]

?abline

#======================IRIS DATASET(NON- HEIRARCHICAL - k-means)=================================#


iris = iris
head(iris)

boxplot(iris)


iris_num = iris[-5] #obtainging the numerical variables

iris_df = as.data.frame(scale(iris_num))  #converting into a scaled data frame
boxplot(iris_df)


wssplot = function(data, nc, seed){
  wss = (nrow(data)-1)*sum(apply(data, 2, var))
  for( i in 2:nc){
    set.seed(seed)
    wss[i] = sum(kmeans(data, centers =i)$withinss)
  
  }
  plot(1:nc, wss, type ='b',
       xlab = "Number of clusters",
       ylab="within groups sum of squares")
}

?kmeans
#nc = number of clsuter
?nrow
?set.seed

wssplot(iris_df, nc = 149, seed = 1234)  #we can keep 2 or 3 cluster


sum(kmeans(iris_df, centers =c(2,15)))
?withinss


#fitting the clusters

iris_kmeans_2 = kmeans(iris_df, 2)
iris_kmeans_2$ce
?kmeans

iris_df$cluster_2 = iris_kmeans_2$cluster  #added a column
plot(iris_df$Sepal.Length,
     iris_df$Sepal.Width,
     col = iris_df$cluster_2)

iris_kmeans_2$centers[,3]
points(iris_kmeans_2$centers[,c("Sepal.Length","Sepal.Width")], 
       col = 1:2 , pch =1, 
       cex = 2)



#on 3 clusters



iris_kmeans_3 = kmeans(iris_df[-5], 3)
iris_df$cluster_3 = iris_kmeans_3$cluster

plot(iris_df$Petal.Length,
     iris_df$Petal.Width,
     col = iris_df$cluster_2)

points(iris_kmeans_3$centers[,c("Petal.Length","Petal.Width")], 
       col = 1:2 , pch =1, 
       cex = 2)



par(mfrow = (c(3,2)))
plot(iris_df$Sepal.Length,
     iris_df$Sepal.Width,
     col = iris_df$cluster_3)
plot(iris_df$Petal.Length,
     iris_df$Petal.Width,
     col = iris_df$cluster_3)
plot(iris_df$Sepal.Length,
     iris_df$Sepal.Width,
     col = iris_df$cluster_3)

plot(iris_df$Sepal.Length,
     iris_df$Petal.Width,
     col = iris_df$cluster_3)

plot(iris_df$Sepal.Length,
     iris_df$Petal.Length,
     col = iris_df$cluster_3)

plot(iris_df$Sepal.Length,
     iris_df$Sepal3.Width,
     col = iris_df$cluster_3) 







