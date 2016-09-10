# |*****************************************************************************
# | Dwayne Macadangdang 9/10/2016
# | Coursera: Exploratory Data Analysis
# | Week 4 Programming Assignment: Plot 4

plot4 <- function()
{
  setwd("/Users/mistermaxx/Documents/work/personal/Coursera/Exp_Data_Anal/Week_4")
  library(ggplot2)
  
  # read in data from file
  nei.file.data <- readRDS("summarySCC_PM25.rds")
  scc.file.data <- readRDS("Source_Classification_Code.rds")
  
  combustion.data <- grepl("comb", scc.file.data$SCC.Level.One, ignore.case = TRUE)
  coal.data <- grepl("coal", scc.file.data$SCC.Level.Four, ignore.case = TRUE) 
  combined.data <- (combustion.data & coal.data)
  scc.combustion.data <- scc.file.data[combined.data,]$SCC
  nei.combustion.data <- nei.file.data[nei.file.data$SCC %in% scc.combustion.data,]
  
  ggplot.combustion <- ggplot(nei.combustion.data, aes(factor(year), Emissions/10^5)) +
    geom_bar(stat = "identity", fill = "grey", width = 0.75) +
    theme_bw() +  guides(fill = FALSE) +
    labs(x = "year", y = expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
    labs(title = expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
  
  print(ggplot.combustion)
  
  dev.copy(png, file = "plot4.png")
  dev.off()
  
}