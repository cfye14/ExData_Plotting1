##The lubridate package for handling dates is used in this script, so first there is going to 
##be a check to see if the package is installed. Once the check/installation is done, the 
##package is loaded.
if(!"lubridate" %in% rownames(installed.packages())) install.packages("lubridate")
library(lubridate)

##This script assumes the dataset is downloaded from the url provided on the project page 
##at Coursera,unzipped, and the text file is placed in the working directory
power_consump2 <- read.csv("household_power_consumption.txt", sep=";", dec=".", na.strings="?"
                           ,colClasses=c(rep("character",2), rep("numeric",7)))

##change Date variable to Date class
power_consump2$Date <- as.Date(strptime(power_consump2$Date, format="%d/%m/%Y"))

##subset dataset by two dates of interest
powersub2 <- subset(power_consump2, Date=="2007-02-01" | Date=="2007-02-02")

##create Date+Time variable, append to data frame
DateTime <- paste(powersub2$Date, powersub2$Time)
DateTime <- ymd_hms(DateTime)
powersub2 <- cbind(powersub2, DateTime)

##create empty png file
png(file="plot2.png", height=480, width=480)

##plot Global_active_power against DateTime
plot(powersub2$Global_active_power ~ powersub2$DateTime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

##reset graphics
dev.off()

##show plot in RStudio 'plots' screen device
plot(powersub2$Global_active_power ~ powersub2$DateTime, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")