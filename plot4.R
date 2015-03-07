##The lubridate package for handling dates is used in this script, so first there is going to 
##be a check to see if the package is installed. Once the check/installation is done, the 
##package is loaded.
if(!"lubridate" %in% rownames(installed.packages())) install.packages("lubridate")
library(lubridate)

##This script assumes the dataset is downloaded from the url provided on the project page 
##at Coursera,unzipped, and the text file is placed in the working directory
power_consump4 <- read.csv("household_power_consumption.txt", sep=";", dec=".", na.strings="?"
                           ,colClasses=c(rep("character",2), rep("numeric",7)))

##change Date variable to Date class
power_consump4$Date <- as.Date(strptime(power_consump4$Date, format="%d/%m/%Y"))

##subset dataset by two dates of interest
powersub4 <- subset(power_consump4, Date=="2007-02-01" | Date=="2007-02-02")

##create Date+Time variable, append to data frame
DateTime <- ymd_hms(paste(powersub4$Date, powersub4$Time))
powersub4 <- cbind(powersub4, DateTime)

##create empty png file, create a 2x2 plot matrix
png(file="plot4.png", height=480, width=480)
par(mfrow=c(2,2))

##generate top left plot, a line plot of global active power
with(powersub4, plot(Global_active_power ~ DateTime, type="l", 
     ylab="Global Active Power", xlab=""))

##generate top right plot, a line plot of voltage
with(powersub4, plot(Voltage ~ DateTime, type="l", ylab="Voltage", xlab="datetime"))

##generate bottom left plot, a line plot of three sub metering variables
with(powersub4, plot(Sub_metering_1 ~ DateTime, type="l", xlab="", ylab="Energy sub metering"))
with(powersub4, lines(Sub_metering_2 ~ DateTime, col="red"))
with(powersub4, lines(Sub_metering_3 ~ DateTime, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), pch="_", pt.cex=2, pt.lwd=1, bty="n")

##generate bottom right plot, a line plot of Global reactive power
with(powersub4, plot(Global_reactive_power ~ DateTime, type="l", ylab="Global_reactive_power", 
                     xlab="datetime"))

##reset graphics device
dev.off()

