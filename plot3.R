
# Load Libraries ----------------------------------------------------------

library("dplyr")
library("ggplot2")

# Read Data ---------------------------------------------------------------

NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

# Select Baltimore City ---------------------------------------------------

NEI_B <- NEI[NEI$fips == "24510", ]


# Calculate Total Emissions for Year, Type --------------------------------

type_year_emissions <- NEI_B %>% 
  group_by(type, year) %>% 
  summarize(total_emissions = sum(Emissions)) 



# Drawing Plot 3 ----------------------------------------------------------

png("plot3.png")

ggplot(data = type_year_emissions, aes(x = as.factor(year), y = total_emissions)) +
  geom_col() +
  labs(x = "Years", y = "Total Emissions (Baltimore City, Maryland)") +
  facet_wrap(vars(type), scales = "free_y")

dev.off()