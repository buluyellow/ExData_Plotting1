data = read.table("household_power_consumption.txt",header = T,sep = ";",na.strings = "?",skipNul = T,stringsAsFactors = F)
data = subset(data,Date == "1/2/2007"| Date == "2/2/2007")
attach(data)
time = paste(Date,Time)
time = strptime(time,"%d/%m/%Y %H:%M:%S")


png("plot2.png") 
plot(time,Global_active_power,type = "l",ylab = "Global Active Power(kilowatts)")
dev.off()
