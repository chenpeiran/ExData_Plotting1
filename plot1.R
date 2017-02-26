# change working directory
setwd("/Users/amanda/git-repo/ExData_Plotting1")
# load data
all.data <- read.table("data/household_power_consumption.txt", sep = ';', na.strings = "?", header = TRUE)
all.data$datetime <- strptime(paste(all.data$Date,all.data$Time), "%d/%m/%Y %H:%M:%S")
all.data$Date <- as.Date(all.data$Date, format = "%d/%m/%Y")
# filter data based on date 2007-02-01 and 2007-02-02
dt <- all.data[all.data$Date == as.Date("2007-02-01") | all.data$Date == as.Date("2007-02-02"),]

# set graphic device
png(filename = "plot1.png", width = 480, height = 480)

# plot
hist(dt$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Powner (kilowatts)")

# switch off device
dev.off()
