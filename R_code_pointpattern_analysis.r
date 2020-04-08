#Point pattern analysis: density map

install.packages("spatstat")

attach(covid)
head(covid)
# c indica il range
covids <- ppp(lon, lat, c(-180,180), c(-90,90))
#sono arrivato qui
d <- density(covids)

plot(d)
points(covids)
