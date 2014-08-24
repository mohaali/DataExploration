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
