##The lubridate package for handling dates is used in this script, so first there is going to 
##be a check to see if the package is installed. Once the check/installation is done, the 
##package is loaded.
if(!"lubridate" %in% rownames(installed.packages())) install.packages("lubridate")
library(lubridate)

##This script assumes the dataset is downloaded from the url provided on the project page 
##at Coursera,unzipped, and the text file is placed in the working directory
power_consump3 <- read.csv("household_power_consumption.txt", sep=";", dec=".", na.strings="?"
                           ,colClasses=c(rep("character",2), rep("numeric",7)))

##change Date variable to Date class
power_consump3$Date <- as.Date(strptime(power_consump3$Date, format="%d/%m/%Y"))

##subset dataset by two dates of interest
powersub3 <- subset(power_consump3, Date=="2007-02-01" | Date=="2007-02-02")

##create Date+Time variable, append to data frame
DateTime <- ymd_hms(paste(powersub3$Date, powersub3$Time))
powersub3 <- cbind(powersub3, DateTime)

##create empty png file
png(file="plot3.png", height=480, width=480)

##create plot of first sub metering variable, then add lines and legend by additional functions
with(powersub3, plot(Sub_metering_1 ~ DateTime, type="l", xlab="", ylab="Energy sub metering"))
with(powersub3, lines(Sub_metering_2 ~ DateTime, col="red"))
with(powersub3, lines(Sub_metering_3 ~ DateTime, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"), pch="_", pt.cex=2, pt.lwd=1)

##reset graphics device
dev.off()




