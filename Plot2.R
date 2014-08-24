setwd("C:\\DataScience")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Plot2
## subset data
plot2SubsettedData <- subset(NEI, fips=="24510")
plot2AggregatedData <- tapply(plot2SubsettedData$Emissions, plot2SubsettedData$year, "sum")
plot2AggregatedDataNames <- names(plot2AggregatedData)
barplot(plot2AggregatedData,xaxt="n", xlab="Years", ylab="Total Emissions Baltimore City")
axis(1, at=1:length(plot2AggregatedDataNames), labels=plot2AggregatedDataNames)

dev.copy(png, file="plot2.png") 
dev.off() 