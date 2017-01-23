## Setup the workspace and download files

#newDir <- "C:/Users/SpencerGreen/Desktop/Coursera/Data Science/Mod 4 Exploratory Data Analysis/Week 1"
#setwd(newDir)

## Read the data from the zip file
## We only need the dates 2007-02-01 and 2007-02-02. Dates are in the format dd/mm/yyyy

#my_table <- read.table("./household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
#data <- my_table[(my_table$Date=="1/2/2007" | my_table$Date=="2/2/2007" ), ]

## Create Plot 1
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red", cex.sub=0.8)

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
## Export the plot as a PNG file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()