download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="power.zip", method="curl")
unzip("power.zip")
now <- timestamp()

library(data.table)

dat <- fread("household_power_consumption.txt", header=TRUE, na.strings="?", colClasses="num")
per <- dat[Date=="1/2/2007" | Date=="2/2/2007"]

hora <- paste(per$Date,per$Time)
hora <- strptime(hora, format = "%d/%m/%Y %H:%M:%S")
par(mfrow = c(1,1))
par(mar = c(4,4,2,2))

#plot 2
png(file = "plot2.png", width = 480, height = 480)
plot(hora, per$Global_active_power, type="n", ylab="Global Active Power", xlab="")
lines(hora , per$Global_active_power)
dev.off()