#load libraries
library(ggplot2)
library(dplyr)

# unzip zip file to specified folder
unzip(zipfile = "C:/Users/saura/OneDrive/Desktop/Project/exdata_data_NEI_data.zip",exdir = "C:/Users/saura/OneDrive/Desktop/Project/datafiles")

#Read Source Classification Code Table
NEI <- readRDS("C:/Users/saura/OneDrive/Desktop/Project/datafiles/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/saura/OneDrive/Desktop/Project/datafiles/Source_Classification_Code.rds")

#Generating plot for 2.5 total emission year on year
TotalEmission <- aggregate(Emissions ~ year,NEI,sum)
png(filename = "plot1.png",width=480,height = 480,units = "px",pointsize = 12,bg="white")
x1 <- barplot(height = TotalEmission$Emissions/1000,names.arg = TotalEmission$year,xlab = "Years",ylab = "Total PM 2.5 Emission in tons",ylim = c(0,8000),col=c("#009999", "#D6604D","#FDDBC7","#2166AC"))
text(x=x1, y=2000, labels=round(TotalEmission$Emission/1000,2), xpd=TRUE, srt=90)
dev.off()