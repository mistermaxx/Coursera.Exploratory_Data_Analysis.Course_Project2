# |*****************************************************************************
# | Dwayne Macadangdang 9/9/2016
# | Coursera: Exploratory Data Analysis
# | Week 4 Programming Assignment: Plot 2

plot2 <- function()
{
  setwd("/Users/mistermaxx/Documents/work/personal/Coursera/Exp_Data_Anal/Week_4")
  
  # read in data from file
  nei.file.data <- readRDS("summarySCC_PM25.rds")
  
  # subset and aggregate total pm2.5 emissions for baltimore
  nei.baltimore.data <- nei.file.data[nei.file.data$fips == "24510",]
  aggregate.baltimore.data <- aggregate(Emissions ~ year, nei.baltimore.data, sum)
  
  # graph the emission data, save file
  barplot(aggregate.baltimore.data$Emissions, names.arg = aggregate.baltimore.data$year, xlab = "Year", ylab = "PM2.5 Emissions (Tons)", main = "Total PM2.5 Emissions For Baltimore, All Sources")

  dev.copy(png, file = "plot2.png")
  dev.off()
  
}