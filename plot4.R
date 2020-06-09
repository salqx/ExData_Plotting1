power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(power) <- c("Date", "Time", "Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3")

sub_power <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]

##
GAP <- as.numeric(sub_power$Global_active_power)
GRP <- as.numeric(sub_power$Global_reactive_power)
voltage <- as.numeric(sub_power$Voltage)
datetime <- strptime(paste(sub_power$Date, sub_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_meter1 <- as.numeric(sub_power$Sub_metering_1)
sub_meter2 <- as.numeric(sub_power$Sub_metering_2)
sub_meter3 <- as.numeric(sub_power$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#plot 1
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#plot 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#plot 3
plot(datetime, sub_meter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, sub_meter2, type="l", col="red")
lines(datetime, sub_meter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# plot 4
plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
