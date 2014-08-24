setwd("C:\\DataScience")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## plot6
rowsFoundWithMotorSources <- grep("vehicle", SCC$Short.Name, ignore.case=T)
plot5SourcesNeeded <- SCC[rowsFoundWithMotorSources,]
motorSourcesDataSubset <- subset(NEI,NEI$SCC %in% plot5SourcesNeeded$SCC)
plot6SBaltimoreData <- subset(motorSourcesDataSubset, fips=="24510")
Plot6LosAngelesData <- subset(motorSourcesDataSubset, fips=="06037")

plot6SBaltimoreData <- cbind(plot6SBaltimoreData, City="Baltimore City")
Plot6LosAngelesData <- cbind(Plot6LosAngelesData, City="Los Angeles")

plot6All <- rbind(plot6SBaltimoreData,Plot6LosAngelesData)
library(ggplot2)
qplot(year, Emissions, data = plot6All, facets=.~City)

dev.copy(png, file="plot6.png") 
dev.off() 
