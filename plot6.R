
# Load Libraries ----------------------------------------------------------

library("dplyr")
library("ggplot2")


# Read Data ---------------------------------------------------------------

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")


# Filter Baltimore & LA  --------------------------------------------------

NEI_B_LA <- NEI[NEI$fips %in% c("24510", "06037"), ]

# Filter SCC & Merge ------------------------------------------------------

SCC_motor <- SCC[grepl("vehicle", SCC$EI.Sector, ignore.case = TRUE), ]["SCC"]
NEI_B_LA_motor <- merge(NEI_B_LA, SCC_motor, by = "SCC")

# Create column with city name
NEI_B_LA_motor <- NEI_B_LA_motor %>% 
  mutate(
    city = if_else(fips == "24510", "Baltimore", "Los Angeles")
  )


# Calculate Total Emissions per Year, City --------------------------------

total_emissions <- NEI_B_LA_motor %>% 
  group_by(year, city) %>% 
  summarize(total_emissions = sum(Emissions)) %>% 
  ungroup()


# Drawing Plot 6 ----------------------------------------------------------

png("plot6.png")

ggplot(total_emissions, aes(year, total_emissions, col = city)) +
  geom_point(size = 3) +
  geom_line(size = 1) 

dev.off()