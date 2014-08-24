setwd("C:\\DataScience")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##Plot3
##Subset data
library(ggplot2)
plot3SubsettedData <- subset(NEI, fips=="24510")
plot3aggregatedData <- aggregate(plot3SubsettedData$Emissions, list(plot3SubsettedData$type,plot3SubsettedData$year), sum)
names(plot3aggregatedData) <- c("Type", "Year", "Emissions")

png(file="plot3",width=480,height=480)
qplot(Year, Emissions, data = plot3aggregatedData, facets=.~Type)
dev.off() 
