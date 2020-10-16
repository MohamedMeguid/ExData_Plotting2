
# Load Libraries ----------------------------------------------------------

library("dplyr")
library("ggplot2")


# Read Data ---------------------------------------------------------------

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")


# Select Baltimore City ---------------------------------------------------

NEI_B <- NEI[NEI$fips == "24510", ]


# Filter SCC & Merge ------------------------------------------------------

SCC_motor <- SCC[grepl("vehicle", SCC$EI.Sector, ignore.case = TRUE), ]["SCC"]
NEI_motor <- merge(NEI_B, SCC_motor, by = "SCC")

NEI_motor_total_emissions <- tapply(NEI_motor$Emissions, NEI_motor$year, sum)


# Drawing Plot 5 ----------------------------------------------------------

png("plot5.png")

barplot(NEI_motor_total_emissions, xlab = "Year", ylab = "Total Emissions")

dev.off()