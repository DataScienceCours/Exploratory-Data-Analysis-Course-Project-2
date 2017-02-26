library(ggplot2)

setwd("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/04 - Exploratory Data Analysis/exdata%2Fdata%2FNEI_data")

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehicles_SCC <- SCC[vehicles,]$SCC
vehicles_NEI <- NEI[NEI$SCC %in% vehicles_SCC,]
baltimore <- vehicles_NEI[vehicles_NEI$fips=="24510",]

png('plot5.png', width = 480, height = 480, bg = 'transparent')

plt <- ggplot(baltimore, aes(factor(year), Emissions)) +
  geom_bar(stat = "identity", width=0.75) +
  labs(x = "Year", y = expression("Total PM"[2.5]*" Emission (10^5 Tons)")) +
  ggtitle(expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(plt)
dev.off()
