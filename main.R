# AD-Scripting, Astrid Bos & David Scholte-Albers
# 12 January 2014
# Exercise 6

# This script enables one to find the greenest city (municipality) 
# in a certain area (in this case: the Netherlands).
# We define "greenest" as the municipality with the highest average 
# NDVI value for the given period within the municipality boundaries.

# Start with empty environment
rm(list=ls())

# Import packages
library(sp)
library(rgdal)
library(rgeos)
library(raster)
library(ggplot2)

# Check working directory
getwd()

# Call functions
source("R/download_data.R")

# Specify weblinks to download
MODISdata <- download_data("https://github.com/GeoScripting-WUR/VectorRaster/
                           raw/gh-pages/data/MODIS.zip")
MODIS <- brick(MODISdata[1])
places <- getData('GADM', country = "NLD", level=3)

# Change projection
places_rprj <- spTransform(places, CRS(proj4string(MODIS)))

# Select column with places and provinces
places_name <- places_rprj[,c(8,6)]

# Extract NDVI per month (and remove NAs) and add Annual mean column
NDVIs <- extract(MODIS, places_name, fun=mean, df=T, sp=T, na.rm=T)
NDVIdf <- data.frame(NDVIs)             # Convert spatial polygon data frame to data frame
NDVIs$Annual_Mean <- rowMeans(NDVIdf [,c(-1,-2)])
NDVIdf$Annual_Mean <- rowMeans(NDVIdf [,c(-1,-2)])           ##overbodig?

# Plot NDVI for 1 month or for the annual mean(select by using zcol="")
spplot(NDVIs)                     # Plot all months
spplot(NDVIs, zcol="January")     # Plot January NDVI
spplot(NDVIs, zcol="August")      # Plot August NDVI
spplot(NDVIs, zcol="Annual_Mean", col.regions = colorRampPalette(c("white","darkkhaki","darkgreen"))(100),
       main = "Average annual NDVI per municipality", sub = "municipality with highest value marked in red") # Plot Annual mean NDVI
spplot((places_rprj[places_rprj$NAME_2 == "Graafstroom",]), add=T, cex = 3, col = "red")

# Obtain max NDVI values
January <- NDVIdf[,c(1,3)]
January_order <- January[order(January$January, decreasing = T), ]
print(paste("The max NDVI in January is found in", January_order$NAME_2[1], 
            "with a value of", January_order$January[1]))

August <- NDVIdf[,c(1,10)]
August_order <- August[order(August$August, decreasing = T), ]
print(paste("The max NDVI in August is found in", August_order$NAME_2[1], 
            "with a value of", August$August[1]))

AnnualMean <- NDVIdf [,c(1,15)]
AnnualMean_order <- AnnualMean[order(AnnualMean$Annual_Mean, decreasing = T), ]
print(paste("The max NDVI over a whole year is found in", AnnualMean_order
            $NAME_2[1], "with an average value of", AnnualMean_order$Annual_Mean[1]))

############ end of script ####################

