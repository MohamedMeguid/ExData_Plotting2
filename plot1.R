
# Read Data ---------------------------------------------------------------

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")


# Calculate Total Emissions -----------------------------------------------

total_emmissions <- tapply(NEI$Emissions, NEI$year, sum)

# Drawing Plot 1 ----------------------------------------------------------

png(filename = "plot1.png")

barplot(total_emmissions, xlab = "Year", ylab = "Total Emissions")

dev.off()
