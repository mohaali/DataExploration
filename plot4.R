setwd("C:\\DataScience")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Plot4
rowsFoundWithCoal <- grep("*coal*", SCC$Short.Name, ignore.case=T)
SourcesNeeded <- SCC[rowsFoundWithCoal,]
coalDataSubset <- subset(NEI,NEI$SCC %in% SourcesNeeded$SCC)

qplot(year, Emissions, data=coalDataSubset)
dev.copy(png, file="plot4.png") 
dev.off() 