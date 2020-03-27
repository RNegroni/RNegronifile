# Multipanel in R-2nd lesson 

library(sp) #si può scrivere anche require(sp)

data(meuse)

attach(meuse)

#exercise: see the name of the variables and plot cadmium vs zinc, there are 2 ways to see the variables

names(meuse)
head(meuse)
plot(cadmium,zinc,pch=18,col="green",cex=2)

#exercise: make all the possible pairwise within the dataset. anzichè fare tutti i plot per ogni coppia di varibali si può fare:

pairs(meuse)
pairs(~cadmium+copper+lead+zinc, data=meuse)
#create a subset of the dataset

pairs(meuse[,3:6])
#Exercise-fare il grafico + bello
pairs(meuse[,3:6],pch=15,col="blue",cex=2)

#prettify the graph part2
install.packages("GGally")
#thi is used for the function ggpairs

library (GGally)
#GGally package to prettify
ggpairs(meuse[,3:6])
