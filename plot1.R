##This script assumes the dataset is downloaded from the url provided on the project page
##at Coursera,unzipped, and the text file is placed in the working directory
power_consump1 <- read.csv("household_power_consumption.txt", sep=";", dec=".", na.strings="?"
                           ,colClasses=c(rep("character",2), rep("numeric",7)))

##subset dataset by two dates of interest
powersub1 <- subset(power_consump1, Date=="1/2/2007" | Date=="2/2/2007")

##set graphics device to png, create file in which to place histogram
png(file="plot1.png", height=480, width=480)

##generate histogram
hist(powersub1$Global_active_power, col="red", main="Global Active Power"
    ,xlab="Global Active Power (kilowatts)")

##reset graphics device
dev.off()

##show plot in RStudio 'plots' screen device
hist(powersub1$Global_active_power, col="red", main="Global Active Power"
     ,xlab="Global Active Power (kilowatts)")
