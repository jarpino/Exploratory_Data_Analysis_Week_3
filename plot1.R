## Exploritory Data Analysis Week 3 Project

## Plot 1

## Read in the data and source classification codes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## unique(NEI$Pollutant) shows only one type, PM25-PRI

## unique(NEI$year) shows only only the years we are interested
## in are in the data, don't need to filter out data

## use aggregate function to totall emissions by year
emissionsByYear <- aggregate(Emissions ~ year, NEI, sum)

## create png
png("plot1.png", width = 480, height=480)

## plot data
plot(emissionsByYear)

## plot regression line for data
fit <- glm(emissionsByYear$Emissions ~ emissionsByYear$year)
co <- coef(fit)
abline(fit, col="blue", lwd=2)

##close file
dev.off()
