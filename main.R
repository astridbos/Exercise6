# AD-Scripting, Astrid Bos & David Scholte-Albers
# 12 January 2014
# Exercise 6

# Start with empty environment
rm(list=ls())

# Import packages
library(sp)
library(rgdal)
library(rgeos)
library(raster)

# Check working directory
getwd()

# Call functions
source("R/download_data.R")

# Specify weblinks to download
#URL

#Download & unzip data
MODISdata <- download_data("https://github.com/GeoScripting-WUR/VectorRaster/raw/gh-pages/data/MODIS.zip")
placesData <- download_data("http://www.mapcruzin.com/download-shapefile/netherlands-places-shape.zip")

MODIS <- brick(MODISdata[1])
MODIS
spplot(MODIS)
plot(placesData, add=T)

# Change projection
#project_RD <- CRS("+proj=sterea +lat_0=52.15616055555555 +lon_0=5.38763888888889
#                  +k=0.9999079 +x_0=155000 +y_0=463000 +ellps=bessel +towgs84=565.2369,
#                  50.0087,465.658,-0.406857330322398,0.350732676542563,-1.8703473836068,
#                  4.0812 +units=m +no_defs")

#railways_RD <- spTransform(railways, project_RD)
#places_RD <- spTransform(places, project_RD)

# Plot & print result

############ end of script ####################