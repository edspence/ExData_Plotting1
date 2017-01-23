## Read the data from the zip file
my_table <- read.table("./household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")

## We only need the dates 2007-02-01 and 2007-02-02. Dates are in the format dd/mm/yyyy
data <- my_table[(my_table$Date=="1/2/2007" | my_table$Date=="2/2/2007" ), ]

## Format the Date and Time
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dateTime <- paste(data$Date, data$Time)

## Join the date and the time to create a single date object
data$DateTime <- as.POSIXct(dateTime)

## Create Plot4
## mfrow creates a 2x2 grid for the four graphs
## mar sets the margins
## oma sets the outer margin
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, {
  plot(Global_active_power~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  plot(Voltage~DateTime, type="l", 
       ylab="Voltage (volt)", xlab="", cex=0.8)
  plot(Sub_metering_1~DateTime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="", cex=0.8)
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5)
  plot(Global_reactive_power~DateTime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="", cex=0.8)
})

## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels
## Export the plot as a PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()