setwd("E:/Dropbox/Dropbox/Data Science Courses/Data Science Specialization/04 - Exploratory Data Analysis/exdata%2Fdata%2FNEI_data")

data <- readRDS("summarySCC_PM25.rds")

baltimore = data[data$fips  == '24510',]

png('plot2.png', width = 480, height = 480)

barplot(
  baltimore$Emissions,
  names.arg = baltimore$year,
  xlab = "Year",
  ylab = "PM2.5 Emissions (Tons)",
  main = "Total PM2.5 Emissions From All Baltimore Sources"
)
dev.off()
