temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp, "household_power_consumption.txt"),sep = ";", header = TRUE, na.strings = "?")
unlink(temp)

#data=read.table(file.choose(),sep = ";", header = TRUE, na.strings = "?")

data$Date <- as.Date(data$Date,format="%d/%m/%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")
data$datetime <- as.POSIXct(paste(data$Date, data$Time))
Sys.setlocale("LC_TIME", "C")
plot(data$datetime,data$Sub_metering_1,type="l", ylab="Energy sub metering",xlab="")
lines(data$datetime,data$Sub_metering_2, col="red")
lines(data$datetime,data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.8)
dev.copy(png, file="plot3.png")
dev.off()
