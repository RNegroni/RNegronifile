# R code for spatial view of points

library(sp)

data(meuse)
head(meuse)

#coordinates as spatial dataset
coordinates(meuse) = ~x+y

plot(meuse)
# with sp plot I can select one variable
spplot(meuse, "zinc")

#Exercise: plot the amount of copper

spplot(meuse, "copper")
#To change the title

spplot(meuse, "copper", main=copper concentration)
# instead of colors in the plot we have the size 
bubble(meuse, "zinc")
bubble(meuse, "zinc", main="Zinc concentration")

#Exercise
bubble(meuse, "copper", col="red", main="Copper concentration")

#importing new data(covid_agg.csv into C: in a folder called lab)

#setting the working directory: lab (for windows)
setwd("C:/lab/")

#import our data, first putting the name, then we link a function to the object
covid <- read.table("covid_agg.csv", head=TRUE)
head(covid)
#let's see the number of cases per country

attach(covid)
plot(country,cases)
#per cambiare le x e le y (las=labels)
plot(country,cases, las=1) #for orizontal labels
plot(country,cases, las=2) #for perpendicular labels
plot(country,cases, las=3) #for vertical labels

plot(country,cases, las=3, cex.axis=0.5)
#let's plot the data, spatially, with ggplot

install.packages("ggplot2")
library(ggplot2)
#to save datas in R

#load R datas, setting the working directory (wd)
load("R_covid.RData")
#let's see the data we have by the function ls()
ls()

#let's use ggplot for fancy plots
library(ggplot2)
data(mpg)
head(mpg)
#key components: data, aes, geometry

ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()

#let's change the geometry of the graph
ggplot(mpg, aes(x=displ, y=hwy)) + geom_line()
ggplot(mpg, aes(x=displ, y=hwy)) + geom_polygon()

head(covid)
ggplot(covid, aes(x=lon, y=lat, size=cases)) + geom_point()


