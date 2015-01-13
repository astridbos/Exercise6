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
library(rgdal)
library(rgeos)
library(raster)

# Check working directory
getwd()

# Call functions
source("R/download_data.R")
source("R/find_max.R")
source("R/plot_result.R")

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
NDVIs <- extract(MODIS, places_name, fun=mean, df=T, sp=T, na.rm=T)     # Extracting, may take some time
NDVIdf <- data.frame(NDVIs)                                             # Convert spatial polygon data frame to data frame
NDVIs$Annual_Mean <- rowMeans(NDVIdf [,c(-1,-2)])
NDVIdf$Annual_Mean <- rowMeans(NDVIdf [,c(-1,-2)])

# Obtain max NDVI values (per month, per municipality)
find_max_January(NDVIs)
find_max_August(NDVIs)

# Obtain max NDVI values (annual average, per municipality)
find_max_AnnualMean(NDVIs)


# Plot NDVI results in maps
plot_NDVIs(NDVIs)                       # Plot all months, per municipality (plotting may take some time)

plot_January(NDVIs, "municipality")     # Plot NDVI January, per municipality

plot_August(NDVIs, "municipality")      # Plot NDVI August, per municipality

plot_Annual_Mean(NDVIs, "municipality") # Plot NDVI Annual Mean, per municipality

###################################################################  
############################## EXTRA ############################## 
###################################################################

# Aggregation of results, shows results per province instead of per municipality

# Max values, comparing provinces
Prov_data <- aggregate(NDVIdf[,-1:-2], NDVIdf["NAME_1"], FUN=mean, dissolve=T, na.rm=T)

# Find max values for provinces and print results

find_max_prov_January()
find_max_prov_August()
find_max_prov_AnnualMean()

############ end of script ####################

