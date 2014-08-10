
housePower <- read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";")

housePower$Date <- as.Date(housePower$Date, format="%d/%m/%Y")

hp_sub <- housePower[housePower$Date == "2007-02-01" | housePower$Date == "2007-02-02",]

png(filename = "plot1.png")

with(hp_sub, hist(Global_active_power
                  , col = "red"
                  , main="Global Active Power"
                  , xlab="Global Active Power (kilowatts)"))


dev.off()

