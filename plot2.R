data <- read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')

Sys.setlocale("LC_TIME", "en_GB.UTF-8") # for english day names

png("plot2.png", width=480,height=480)

fullDate <- paste(data$Date, data$Time, sep=" ") #concat date + time
posixDate = strptime(fullDate, format = "%d/%m/%Y %H:%M:%S") #determine date format
plot(
    posixDate, 
    data$Global_active_power, 
    type='l', 
    ylab="Global Active Power (kilowatts)", 
    xlab=""
)

dev.off()