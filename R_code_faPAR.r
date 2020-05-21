# How to look at a chemical cycle from remote 


# install.packages("raster")

 

library(raster)
library(rasterVis)
library(rasterdiv)
#NDVI stands for different vegetation index
plot(copNDVI)
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
levelplot (cop NDVI)

#let's work on the faPAR
setwd("C:/lab/")

#to import the data 
faPAR10 <- raster("faPAR10.tif")
levelplot(faPAR10)

pdf("copNDVI.pdf")
levelplot(copNDVI)
dev.off()

pdf("faPAR.pdf")
levelplot(faPAR10)
dev.off()

#la llezione prima l'ho saltata 
#regression models for faPAR and NDVI
#example on erosion

erosion <- c(12, 14, 16, 24, 26, 40, 55, 67)
#and heavy metals(hm)
hm <- c(30, 100, 150, 200, 260, 340, 460, 600)
plot(erosion, hm, col="red", pch=19, xlab="erosion", ylab="heavy metals")
#let's make the model (linear model [lm])
model1 <- lm(hm ~ erosion)
#we're considering a formula like y=b(slope)x+a(intercept)
#p values=how many times the pattern is random, so they are related by chance. Lower it is better for us
abline(model1)
setwd("C:/lab/")

#faPAR vs NDVI: how much are they related?
lirary(raster)
faPAR10 <- raster("C:/lab/faPAR10.tif")
#now let's relate it with NDVI
library(rasterdiv)
#cop sta per Copernicus
copNDVI <- reclassify(copNDVI, cbind(253:255, NA), right=TRUE)
faPAR10

levelplot(copNDVI)
random.points <- function(x,n)
{
lin <- rasterToContour(is.na(x))
pol <- as(st_union(st_polygonize(st_as_sf(lin))), 'Spatial') # st_union to dissolve geometries
pts <- spsample(pol[1,], n, type = 'random')
}
#pts it's a "folder"
pts <- random.points(faPAR10,1000)
#those 1000 points are representative of the actual 56mln
#there's a function that select only the points that we want from the raster(extract)

copNDVIp <- extract(copNDVI,pts)
faPAR10p <- extract(faPAR10,pts)

plot(copNDVIp,faPAR10p)
#there's a function that select only the points that we want from the raster

#let's see photosyntesis vs NDVI
model2 <- lm(faPAR10p~copNDVIp)

plot(copNDVIp,faPAR10p,col="green")
abline(model1,col="red")

