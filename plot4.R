
housePower <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

housePower$Date <- as.Date(housePower$Date, format="%d/%m/%Y")
housePower$DateTime <- strptime(paste(housePower$Date,housePower$Time,sep=":"), format = "%d/%m/%Y:%H:%M:%S")

hp_sub <- housePower[housePower$DateTime > "2007-02-01" & housePower$DateTime < "2007-02-03",]

png(filename = "plot4.png")

par(mfrow = c(2,2))

## first plot (top left)
with(hp_sub, plot(DateTime, Global_active_power
                  , ylab="Global Active Power (kilowatts)"
                  , xlab=""
                  , type="n"))
lines(hp_sub$DateTime, hp_sub$Global_active_power)

## second plot (top right)
with(hp_sub, plot(DateTime, Voltage
                  , ylab="Voltage"
                  , xlab="Date/Time"
                  , type="n"))
lines(hp_sub$DateTime, hp_sub$Voltage)

## third plot (bottom left)
with(hp_sub, plot(DateTime, Sub_metering_1,
                  , ylab="Energy Sub Metering"
                  , xlab=""
                  , type="n"))
lines(hp_sub$DateTime, hp_sub$Sub_metering_1)
lines(hp_sub$DateTime, hp_sub$Sub_metering_2, col="red")
lines(hp_sub$DateTime, hp_sub$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## fourth plot (bottom right)
with(hp_sub, plot(DateTime, Global_reactive_power
                  , ylab="Global Reactive Power"
                  , xlab="Date/Time"
                  , type="n"))
lines(hp_sub$DateTime, hp_sub$Global_reactive_power)

dev.off()

