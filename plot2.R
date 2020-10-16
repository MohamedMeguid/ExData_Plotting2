
# Read Data ---------------------------------------------------------------

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")


# Select Baltimore City ---------------------------------------------------

NEI_B <- NEI[NEI$fips == "24510", ]


# Calculate Total Emissions -----------------------------------------------

B_emissions <- tapply(NEI_B$Emissions, NEI_B$year, sum)

# Drawing Plot 2 ----------------------------------------------------------

png(filename = "plot2.png")

barplot(B_emissions, xlab = "Year", ylab = "Total Emissions (Baltimore City, Maryland)")

dev.off()
