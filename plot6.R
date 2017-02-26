library(ggplot2)

setwd("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/04 - Exploratory Data Analysis/exdata%2Fdata%2FNEI_data")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]
baltimore <- vehicles_NEI[vehicles_NEI$fips == "24510",]
baltimore$city <- "Baltimore City"

losangeles <- vehicles_NEI[vehicles_NEI$fips == "06037",]
losangeles$city <- "Los Angeles County"
both_cities <- rbind(baltimore, losangeles)

png('plot6.png', width = 480, height = 480, bg = 'transparent')

plt <- ggplot(both_cities, aes(x = factor(year), y = Emissions, fill = city)) +
  geom_bar(aes(fill = year), stat = "identity") +
  facet_grid(scales="free", space="free", .~city) +
  theme_bw() +
  labs(x = "year", y = expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) +
  ggtitle(expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(plt)
dev.off()
