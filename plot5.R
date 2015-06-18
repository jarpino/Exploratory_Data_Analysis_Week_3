## Exploritory Data Analysis Week 3 Project

## Plot 5

## Read in the data and source classification codes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## unique(NEI$Pollutant) shows only one type, PM25-PRI

## unique(NEI$year) shows only only the years we are interested
## in are in the data, don't need to filter out data

## this there are three sectors that have to do with coal
summary(SCC$EI.Sector)

## subset data to those sectors
vehicleSource <- SCC[grep("Vehicles", SCC$EI.Sector), ]

## subset data to be from Coal sources
bmoreData <- NEI[NEI$SCC %in% vehicleSource$SCC, ]

bmoreData <- subset(bmoreData, fips == "24510")

## use aggregate function to totall emissions by year and type
emissionsByYear <- aggregate(Emissions ~ year, bmoreData, sum, na.rm=TRUE)

library(ggplot2)

## create png
png("plot5.png", width = 960, height=480)

## plot data and trend line for data
qplot(year, Emissions, data = emissionsByYear) + geom_smooth(method = "lm")

##close file
dev.off()
