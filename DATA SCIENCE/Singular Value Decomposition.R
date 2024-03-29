
install.packages("imager")
library(imager)

setwd("C:/Users/DELL/Downloads")
img = load.image("C:/Users/DELL/Downloads/_Flower_.jpg")
img


class(img)
dim(img)
#1 - depth of image
#3- signifies that there are three colurs RGB


megraay = grayscale(img)
plot(megraay, axes = TRUE, main = "Grayscale image")

dim(megraay)
#1 signifies that it doesn't have RGB


svd1 = svd(scale(megraay))

str(svd1)

#d - diagonal matrix
#u - X*X'
#v - X'*X

#FINDING THE VARIANCE EXPLAINED BY EACH SINGULAR 

plot(svd1$d^2/sum(svd1$d^2),
     pch = 19,
     xlab = "Singular Vector",
     ylab = "Variance Explained")

#Note: d gives the diagonal matrix
#d^2 gives the eigen values
#d^2/sum(d^2) gives the total variation explained


plot(1:564,
     cumsum(svd1$d^2/sum(svd1$d^2)))

abline(h=0.99, v = 85)  #we can choose v by looking at cumsum and seeing where it will have 99% value
#h is 0.99 because we wanna see ki 99% variance kaha explain ho raha hai


#OBTAIN THE MATRIX OF ORIGINAL DIMENSION USING VARIOUS VALUES SINGULAR MATRIX

#matrix multiplication of U,V*,D

#including only first 5 singular vector

approx5 = svd1$u[,1:5] %*% diag(svd1$d[1:5]) %*% t(svd1$v[,1:5])

#including only first 10 singular vector

approx10 = svd1$u[,1:10] %*% diag(svd1$d[1:10]) %*% t(svd1$v[,1:10])


#including only first 25 singular vector\

approx25 = svd1$u[,1:25] %*% diag(svd1$d[1:25]) %*% t(svd1$v[,1:25])


#including only first 35 singular vector

approx35 = svd1$u[,1:35] %*% diag(svd1$d[1:35]) %*% t(svd1$v[,1:35])

#including only first 85 singular vector

approx85 = svd1$u[,1:85] %*% diag(svd1$d[1:85]) %*% t(svd1$v[,1:85])


approx105 = svd1$u[,1:105] %*% diag(svd1$d[1:105]) %*% t(svd1$v[,1:105])

par(mfrow = c(2,3) , mar =c(1,1,1,1))

#plotting the reduced images

plot(as.cimg(approx5), main ="(a) 5 singular vectors", axes = FALSE)
plot(as.cimg(approx10), main ="(b) 10 singular vectors", axes = FALSE)
plot(as.cimg(approx25), main ="(c) 25 singular vectors", axes = FALSE)
plot(as.cimg(approx85), main ="(e) 85 singular vectors", axes = FALSE)
plot(as.cimg(approx105), main ="(e) 105 singular vectors", axes = FALSE)
plot(as.cimg(megraay), main = "(f) Full image", axes = FALSE)



#-------------------Obtain the matrices corresponding to RGB colour scale--------------------------#

R = img[,,1]
G = img[,,2]
B = img[,,3]


#plot the image in thre colours

par(mfrow = c(1,3), mar = c(1,1,1,1))

cscale = function(v) rgb(v,0,0)
grayscale(img) %>% plot(colourscale = cscale, 
                        rescale = FALSE,
                        axes = FALSE)

cscale = function(v) rgb(0,v,0)
grayscale(img) %>% plot(colourscale = cscale, 
                        rescale = FALSE,
                        axes = FALSE)


cscale = function(v) rgb(0,0,v)
grayscale(img) %>% plot(colourscale = cscale, 
                        rescale = FALSE,
                        axes = FALSE)


cscale = function(v) rgb(v,v,0)
grayscale(img) %>% plot(colourscale = cscale, 
                        rescale = FALSE,
                        axes = FALSE)
cscale = function(v) rgb(0,v,v)
grayscale(img) %>% plot(colourscale = cscale, 
                        rescale = FALSE,
                        axes = FALSE)

cscale = function(v) rgb(v,v,v)
grayscale(img) %>% plot(colourscale = cscale, 
                        rescale = FALSE,
                        axes = FALSE)

#Perform SVD on each of the colour scale

#separately and store it in the list

svdR = svd(R)
svdG = svd(G)
svdB = svd(B)
svdRGB = list(svdR , svdG, svdB)



#Reconstruct the original coloured image

par(mfrow=c(2,3), mar = c(1,1,1,1))

for (j in c(5,10,25,35,50)){
  comp = sapply(svdRGB, function(i){
    compressed = i$u[,1:j]%*%diag(i$d[1:j])%*%t(i$v[,1:j])
  }, simplify = 'array')
  comp = as.cimg(comp)
  plot(comp, axes = FALSE , main = paste("Rank=", j))
}
