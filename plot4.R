data <- read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')
Sys.setlocale("LC_TIME", "en_GB.UTF-8") # for english day names


png("plot4.png", width=480,height=480)

par(mfrow=c(2,2))
fullDate <- paste(data$Date, data$Time, sep=" ") #concat date + time
posixDate = strptime(fullDate, format = "%d/%m/%Y %H:%M:%S") #determine date format



with (data, {
    
    plot(
        posixDate, 
        Global_active_power, 
        type='l', 
        ylab="Global Active Power (kilowatts)", 
        xlab=""
    )
    
    plot(
        posixDate, 
        Voltage, 
        type='l', 
        ylab="Voltage", 
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
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        bty="n"
    )
    
    plot(
        posixDate, 
        Global_reactive_power, 
        type='l', 
        xlab=""
    )
})

dev.off()
