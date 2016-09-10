# |*****************************************************************************
# | Dwayne Macadangdang 9/9/2016
# | Coursera: Exploratory Data Analysis
# | Week 4 Programming Assignment: Plot 1

plot1 <- function()
{
  setwd("/Users/mistermaxx/Documents/work/personal/Coursera/Exp_Data_Anal/Week_4")
  
  # read in data from file
  nei.file.data <- readRDS("summarySCC_PM25.rds")
  #scc.file.data <- readRDS("Source_Classification_Code.rds")
  
  # aggregate total pm2.5 emissions from all sources, years 1999, 2002, 2005 2008
  aggregate.data <- aggregate(Emissions ~ year, nei.file.data, sum)
  
  # graph the emission data, save file
  barplot((aggregate.data$Emissions)/10^6, names.arg = aggregate.data$year, xlab = "Year",
    ylab = "PM2.5 Emissions (10^6 Tons)", main = "Total PM2.5 Emissions From All US Sources")
  
  dev.copy(png, file = "plot1.png")
  dev.off()
  
}