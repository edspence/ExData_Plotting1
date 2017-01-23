## Read the data from the zip file
my_table <- read.table("./household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

## We only need the dates 2007-02-01 and 2007-02-02. Dates are in the format dd/mm/yyyy
data <- my_table[(my_table$Date=="1/2/2007" | my_table$Date=="2/2/2007" ), ]

## Format the Date and Time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)

## Join the date and the time to create a single date object
data$DateTime <- as.POSIXct(dateTime)

## Create Plot3 with three variables
with(data, { 
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Energy sub metering", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime, col='Red')
  lines(Sub_metering_3~DateTime, col='Blue')
})

## Annotate the plot with the legend
legend("topright",col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
## Export the plot as a PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()