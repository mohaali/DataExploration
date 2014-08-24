setwd("C:\\DataScience")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


rowsFoundWithMotorSources <- grep("vehicle", SCC$Short.Name, ignore.case=T)
plot5SourcesNeeded <- SCC[rowsFoundWithMotorSources,]
motorSourcesDataSubset <- subset(NEI,NEI$SCC %in% plot5SourcesNeeded$SCC)
plot5SubsettedData <- subset(motorSourcesDataSubset, fips=="24510")

qplot(year, Emissions, data=plot5SubsettedData)
dev.copy(png, file="plot5.png") 
dev.off() 