setwd("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/04 - Exploratory Data Analysis/exdata%2Fdata%2FNEI_data")

data <- readRDS("summarySCC_PM25.rds")
data <- aggregate(Emissions ~ year, data, sum)

png('plot1.png', width = 480, height = 480)

barplot(
  (data$Emissions)/10^6,
  names.arg = data$year,
  xlab = "Year",
  ylab = "PM2.5 Emissions (10^6 Tons)",
  main = "Total PM2.5 Emissions From All US Sources"
)
dev.off()
