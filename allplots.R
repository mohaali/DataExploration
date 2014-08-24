setwd("C:\\DataScience")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Plot1
# Aggregate data by year 
aggregatedData <- tapply(NEI$Emissions, NEI$year, "sum")
xnames <- names(aggregatedData)
barplot(aggregatedData,xaxt="n", xlab="Years", ylab="Total Emissions USA")
axis(1, at=1:length(xnames), labels=xnames)

dev.copy(png, file="plot1.png") 
dev.off() 


#Plot2
## subset data
plot2SubsettedData <- subset(NEI, fips=="24510")
plot2AggregatedData <- tapply(plot2SubsettedData$Emissions, plot2SubsettedData$year, "sum")
plot2AggregatedDataNames <- names(plot2AggregatedData)
barplot(plot2AggregatedData,xaxt="n", xlab="Years", ylab="Total Emissions Baltimore City")
axis(1, at=1:length(plot2AggregatedDataNames), labels=plot2AggregatedDataNames)

dev.copy(png, file="plot2.png") 
dev.off() 

##Plot3
##Subset data
library(ggplot2)
plot3SubsettedData <- subset(NEI, fips=="24510")
plot3aggregatedData <- aggregate(plot3SubsettedData$Emissions, list(plot3SubsettedData$type,plot3SubsettedData$year), sum)
names(plot3aggregatedData) <- c("Type", "Year", "Emissions")

png(file="plot3.png",width=600,height=480)
qplot(Year, Emissions, data = plot3aggregatedData, facets=.~Type)
dev.off() 


## Plot4
rowsFoundWithCoal <- grep("*coal*", SCC$Short.Name, ignore.case=T)
SourcesNeeded <- SCC[rowsFoundWithCoal,]
coalDataSubset <- subset(NEI,NEI$SCC %in% SourcesNeeded$SCC)

qplot(year, Emissions, data=coalDataSubset)
dev.copy(png, file="plot4.png") 
dev.off() 



##plot 5
rowsFoundWithMotorSources <- grep("vehicle", SCC$Short.Name, ignore.case=T)
plot5SourcesNeeded <- SCC[rowsFoundWithMotorSources,]
motorSourcesDataSubset <- subset(NEI,NEI$SCC %in% plot5SourcesNeeded$SCC)
plot5SubsettedData <- subset(motorSourcesDataSubset, fips=="24510")

qplot(year, Emissions, data=plot5SubsettedData)
dev.copy(png, file="plot5.png") 
dev.off() 


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



