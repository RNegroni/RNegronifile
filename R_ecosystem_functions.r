# R code to see biomass over the world and to calculate changes
#
install.packages("rasterdiv")
install.packages("rasterVis")

library(rasterVis)
library(rasterdiv)
#NDVI (NIR-RED) or (NIR+RED)?

data(copNDVI)
plot(copNDVI)

copNDVI <- reclassify(copNDVI,cbind(253:255, NA))
copNDVI10 <- aggregate(copNDVI, fact=10)
levelplot(copNDVI10)

copNDVI100 <- aggregate(copNDVI, fact=100)
levelplot(copNDVI10)

levelplot(copNDVI)
setwd("C:/lab/")
library (raster)

defor1 <- brick("defor1_.jpg")
defor2 <- brick("defor2_.jpg")


par(mfrow=c(1,2))
plotRGB (defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB (defor2, r=1, g=2, b=3, stretch="Lin")

dvi1 <- defor1$defor1_.1 - defor1$defor1_.2
dvi2 <- defor2$defor2_.1 - defor2$defor2_.2

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100)
par(mfrow=c(1,2))
plot(dvi1, col=cl)
plot(dvi2, col=cl)

difdvi <- dvi1 - dvi2
dev.off()
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi)
plot(difdvi, col=cld)

hist(difdvi)
