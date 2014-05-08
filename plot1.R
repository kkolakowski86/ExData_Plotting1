data <- read.csv(pipe('egrep \'^Date|^[1-2]/2/2007\' household_power_consumption.txt'), header=T, sep=';')
png("plot1.png", width=480,height=480)

hist(
    data$Global_active_power, 
    xlab="Global Active Power (killowatts)",
    ylab="Frequency", 
    main="Global Active Power", 
    col="red"
)

dev.off()