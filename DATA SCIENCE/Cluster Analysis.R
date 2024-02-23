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
