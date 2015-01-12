# AD-Scripting, Astrid Bos & David Scholte-Albers
# 12 January 2014
# Exercise 6

# Function to download and unzip data
download_data <- function(URL){
        download.file(url=URL, destfile='data/URL.zip', method='auto')
        unzip('data/URL.zip', exdir="data")
}