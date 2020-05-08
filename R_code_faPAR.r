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

 
