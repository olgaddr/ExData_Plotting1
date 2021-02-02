temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep = ";", header = TRUE, na.strings = "?")
unlink(temp)

#data=read.table(file.choose(),sep = ";", header = TRUE, na.strings = "?")

data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data$datetime <- as.POSIXct(paste(data$Date, data$Time))
Sys.setlocale("LC_TIME", "C")
plot(data$datetime,data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, file="plot2.png")
dev.off()
