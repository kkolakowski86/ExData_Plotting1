data <- read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')

Sys.setlocale("LC_TIME", "en_GB.UTF-8") # for english day names

png("plot3.png", width=480,height=480)

fullDate <- paste(data$Date, data$Time, sep=" ") #concat date + time
posixDate = strptime(fullDate, format = "%d/%m/%Y %H:%M:%S") #determine date format
plot(
    posixDate, 
    data$Global_active_power, 
    type='l', 
    ylab="Energy sub metering", 
    xlab=""
)

plot(
    x=posixDate, 
    y=data$Sub_metering_1,
    type='l', 
    ylab="Energy sub metering", 
    xlab=""
)

lines(posixDate, data$Sub_metering_2,type="l", col="red")
lines(posixDate, data$Sub_metering_3,type="l", col="blue")

legend(
    "topright",
    cex=1, 
    lty = 1, 
    col = c("black", "red", "blue"), 
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
)

dev.off()