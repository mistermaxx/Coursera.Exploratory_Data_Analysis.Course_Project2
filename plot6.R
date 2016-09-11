# |*****************************************************************************
# | Dwayne Macadangdang 9/10/2016
# | Coursera: Exploratory Data Analysis
# | Week 4 Programming Assignment: Plot 6

plot6 <- function()
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
  nei.baltimore.vehicle.data$city <- "Baltimore City"
  
  nei.los_angeles.vehicle.data <- nei.vehicle.data[nei.vehicle.data$fips=="06037",]
  nei.los_angeles.vehicle.data$city <- "Los Angeles County"
  
  nei.combined.data <- rbind(nei.baltimore.vehicle.data, nei.los_angeles.vehicle.data)
  
  ggplot.combined <- ggplot(nei.combined.data, aes(x = factor(year), y = Emissions, fill = city)) +
    geom_bar(aes(fill = year),stat = "identity") +
    facet_grid(scales = "free", space = "free", . ~ city) +
    guides(fill = FALSE) + theme_bw() +
    labs(x = "year", y = expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
    labs(title = expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))
  
  print(ggplot.combined)
  
  dev.copy(png, file = "plot6.png")
  dev.off()
  
}