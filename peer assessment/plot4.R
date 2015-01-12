data = read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?",skipNul = T,stringsAsFactors = F)
data = subset(data,Date == "1/2/2007"| Date == "2/2/2007")
attach(data)
time = paste(Date,Time)
time = strptime(time,"%d/%m/%Y %H:%M:%S")

png("plot4.png") 
par(mfrow = c(2,2))

plot(time,Global_active_power,type = "l",ylab = "Global Active Power(kilowatts)")

plot(time,Voltage,type = "l",ylab = "Voltage")

plot(time,data$Sub_metering_1,type = "l",ylab = "Energy sub merting")
lines(time,data$Sub_metering_2,col = "red")
lines(time,data$Sub_metering_3,col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col = c("black","red","blue"))

plot(time,Global_reactive_power,type = "l")

dev.off()