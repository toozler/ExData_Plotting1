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

#plot 3
png(file = "plot3.png", width = 480, height = 480)
plot(hora, per$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(hora , per$Sub_metering_1, col="black")
lines(hora , per$Sub_metering_2, col="red")
lines(hora , per$Sub_metering_3, col="purple")
legend("topright", lwd=1, cex=.75, col = c("black", "red", "purple"), legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
dev.off()





