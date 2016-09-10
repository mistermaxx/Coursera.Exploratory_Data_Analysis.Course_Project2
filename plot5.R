# |*****************************************************************************
# | Dwayne Macadangdang 9/10/2016
# | Coursera: Exploratory Data Analysis
# | Week 4 Programming Assignment: Plot 5

plot5 <- function()
{
  setwd("/Users/mistermaxx/Documents/work/personal/Coursera/Exp_Data_Anal/Week_4")
  library(ggplot2)
  
  # read in data from file
  nei.file.data <- readRDS("summarySCC_PM25.rds")
  scc.file.data <- readRDS("Source_Classification_Code.rds")
  
  vehicle.data <- grepl("vehicle", scc.file.data$SCC.Level.Two, ignore.case = TRUE)
  scc.vehicle.data <- scc.file.data[vehicle.data, ]$SCC
  nei.vehicle.data <- nei.file.data[nei.file.data$SCC %in% scc.vehicle.data, ]
  
  nei.baltimore.vehicle.data <- nei.vehicle.data[nei.vehicle.data$fips == 24510, ]
  
  ggplot.baltimore <- ggplot(nei.baltimore.vehicle.data, aes(factor(year), Emissions)) +
    geom_bar(stat = "identity", fill = "grey", width=0.75) +
    theme_bw() +  guides(fill = FALSE) +
    labs(x = "year", y = expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
    labs(title = expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
  
  print(ggplot.baltimore)
  
  dev.copy(png, file = "plot5.png")
  dev.off()
  
}