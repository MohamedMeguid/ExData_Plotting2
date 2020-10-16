
# Load Libraries ----------------------------------------------------------

library("dplyr")
library("ggplot2")


# Read Data ---------------------------------------------------------------

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")


# Filter SCC & Merge ------------------------------------------------------

SCC_coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]["SCC"]
NEI_coal <- merge(NEI, SCC_coal, by = "SCC")

NEI_coal_total_emissions <- tapply(NEI_coal$Emissions, NEI_coal$year, sum)


# Drawing Plot 4 ----------------------------------------------------------

png("plot4.png")

barplot(NEI_coal_total_emissions, xlab = "Year", ylab = "Total Emissions")

dev.off()