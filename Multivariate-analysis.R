#R code for multivariate analysis

setwd("C:/lab/")

install.packages("vegan")
library (vegan)
biomes <- read.table("biomes.csv", header=T, sep=",")

head(biomes)

#Detrended COrrespondence Analysis
multivar <- decorana(biomes)
plot(multivar)

#eigenvalues are the amount of dimensions in the system

biomes_types <- read.table("biomes_types.csv", header=T, sep=",")
head(biomes_types)

attach(biomes_types)
#ordiellipse connect in an ellipse all the plot related

ordiellipse(multivar, type, col=1:4, kind= "ehull", lwd=3)
#to put the lables in the ellipse

ordispider(multivar, type, col=1:4, label = T)
