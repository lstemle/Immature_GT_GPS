#convert WGS84 Zone 17N to UTM

library(rgdal)
coords <- read.csv("turtles.csv")
coords.data.xy <- coords[c('x', 'y')]
coords.xy <- SpatialPoints(coords.data.xy)

#from WGS84 long lat
proj4string(coords.xy) <- CRS('+init=epsg:4326')
coords.utm <- spTransform(coords.xy, CRS('+init=epsg:2029'))

#To show your new utm coordinates:
coords.utm

#To write it to a CSV:
write.csv(coords.utm, 'UTM.csv')
