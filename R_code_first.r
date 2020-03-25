install.packages("sp")
library(sp)
data(meuse)
# Let's see meuse dataset
meuse
# Let's look at the first rows(are called head)
head(meuse)
# Let's plot 2 variables together (i.e.the zinc[] is linked to the one of copper)
attach(meuse)
plot(zinc,copper)
plot(zinc,copper,col="purple")
# the point carachter(pch) sono i simboli per i punti su un grafico
plot(zinc,copper,col="purple",pch=21)
#cex is the carachetr exageration
plot(zinc,copper,col="purple",pch=19,cex=5)
