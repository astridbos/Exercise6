# AD-Scripting, Astrid Bos & David Scholte-Albers
# 12 January 2014
# Exercise 6

# Function "plot_result" to plot the results in a map, and print the results in the console
# data is data source; level is either municipality or province

# Plot all months
plot_NDVIs <-function(data){ 
        spplot(data, col.regions = colorRampPalette(c("white","darkkhaki","darkgreen"))(100))
}

# Plot NDVI January
plot_January <- function(data, level){
        spplot(data, zcol="January", col=NA, col.regions = colorRampPalette(c("white","darkkhaki","darkgreen"))(100),
               main = paste("Average NDVI per", level, "for January"))
}

# Plot NDVI August
plot_August <- function(data, level){
        spplot(NDVIs, zcol="August", col=NA, col.regions = colorRampPalette(c("white","darkkhaki","darkgreen"))(100),
               main = paste("Average NDVI per", level, "for August"))
}

# Plot NDVI Annual Mean
plot_Annual_Mean <- function(data, level){
        spplot(NDVIs, zcol="Annual_Mean", col=NA, col.regions = colorRampPalette(c("white","darkkhaki","darkgreen"))(100),
               main = paste("Average annual NDVI per", level))
        
}
