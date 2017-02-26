# change working directory
setwd("/Users/amanda/git-repo/ExData_Plotting1")
# load data
all.data <- read.table("data/household_power_consumption.txt", sep = ';', na.strings = "?", header = TRUE)
all.data$datetime <- strptime(paste(all.data$Date,all.data$Time), "%d/%m/%Y %H:%M:%S")
all.data$Date <- as.Date(all.data$Date, format = "%d/%m/%Y")

# filter data based on date 2007-02-01 and 2007-02-02
dt <- all.data[all.data$Date == as.Date("2007-02-01") | all.data$Date == as.Date("2007-02-02"),]

# set graphic device
png(filename = "plot4.png", width = 480, height = 480)

# plot
par(mfcol=c(2,2))
# 1
plot(dt$datetime,dt$Global_active_power, 
     type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

# 2
plot(dt$datetime,dt$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
points(dt$datetime,dt$Sub_metering_1, type="l")
points(dt$datetime,dt$Sub_metering_2, type="l", col="red")
points(dt$datetime,dt$Sub_metering_3, type="l", col="blue")
legend("topright",
       col = c("black","red","blue"),
       lty=c(1,1,1),
       seg.len=3,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = "n")

#3
with(dt, plot(datetime,Voltage,type="l"))

#4
with(dt, plot(datetime,Global_reactive_power,type="l"))

# switch off device
dev.off()

