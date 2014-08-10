
housePower <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

housePower$Date <- as.Date(housePower$Date, format="%d/%m/%Y")
housePower$DateTime <- strptime(paste(housePower$Date,housePower$Time,sep=":"), format = "%d/%m/%Y:%H:%M:%S")

hp_sub <- housePower[housePower$DateTime > "2007-02-01" & housePower$DateTime < "2007-02-03",]

png(filename = "plot2.png")

with(hp_sub, plot(DateTime, Global_active_power
                  , ylab="Global Active Power (kilowatts)"
                  , xlab=""
                  , type="n"))
lines(hp_sub$DateTime, hp_sub$Global_active_power)


dev.off()

