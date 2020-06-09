power <- read.table("household_power_consumption.txt", skip = 1, sep = ";")
names(power) <- c("Date", "Time", "Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3")

sub_power <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]


##
datetime <- strptime(paste(sub_power$Date, sub_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()