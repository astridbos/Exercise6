# AD-Scripting, Astrid Bos & David Scholte-Albers
# 12 January 2014
# Exercise 6

# Function to find the municipality with the highest NDVI
# Inputs are month_number (Jan = 1, Feb = 2, etc) and month

find_max_January <- function(data){
        January <- data[,c(1,3)]
        January_order <- January[order(January$January, decreasing = T), ]
        print(paste("The max NDVI in January is found in", January_order$NAME_2[1], 
                    "with a value of", January_order$January[1]))
}

find_max_August <- function(data){
        August <- data[,c(1,10)]
        August_order <- August[order(August$August, decreasing = T), ]
        print(paste("The max NDVI in August is found in", August_order$NAME_2[1], 
                    "with a value of", August$August[1]))
}

find_max_AnnualMean <- function(data){
        AnnualMean <- data [,c(1,15)]
        AnnualMean_order <- AnnualMean[order(AnnualMean$Annual_Mean, decreasing = T), ]
        print(paste("The max NDVI over a whole year is found in", AnnualMean_order $NAME_2[1],
                    "with an average value of", AnnualMean_order$Annual_Mean[1]))
}


find_max_prov_January <- function(){
        January <- Prov_data[,c(1,2)]
        January_order <- January[order(January$January, decreasing = T), ]
        print(paste("The max NDVI in January is found in", January_order$NAME_1[1], 
                    "with a value of", January_order$January[1]))
}

find_max_prov_August <- function(){
        August <- Prov_data[,c(1,9)]
        August_order <- August[order(August$August, decreasing = T), ]
        print(paste("The max NDVI in August is found in", August_order$NAME_1[1], 
                    "with a value of", August$August[1]))
}

find_max_prov_AnnualMean <- function(){
        AnnualMean <- Prov_data [,c(1,14)]
        AnnualMean_order <- AnnualMean[order(AnnualMean$Annual_Mean, decreasing = T), ]
        print(paste("The max NDVI over a whole year is found in", AnnualMean_order $NAME_1[1],
                    "with an average value of", AnnualMean_order$Annual_Mean[1]))
}