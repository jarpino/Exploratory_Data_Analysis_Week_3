## Exploritory Data Analysis Week 3 Project

## Plot 3

## Read in the data and source classification codes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## unique(NEI$Pollutant) shows only one type, PM25-PRI

## unique(NEI$year) shows only only the years we are interested
## in are in the data, don't need to filter out data

## subset data for Baltimore 

bmoreData <- subset(NEI, fips == "24510")

## use aggregate function to totall emissions by year and type
emissionsByYear <- aggregate(Emissions~year+type, data=bmoreData, sum, na.rm=TRUE)

library(ggplot2)

## create png
png("plot3.png", width = 960, height=480)

## plot data and trend line for data
qplot(year, Emissions, data = emissionsByYear, facets = .~type) + geom_smooth(method = "lm")

##close file
dev.off()
