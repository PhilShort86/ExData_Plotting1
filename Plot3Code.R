##Assignement 1 exploratory data analysis
##Plot 3

rm(list=ls())
#reading data 
data<-read.table('~/desktop/data-science/exploratory-data-analysis/household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the data related to two days
sub_Set<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))

# Changing the class of Date variable from character to Date:
sub_Set$Date <- as.Date(sub_Set$Date, format = "%d/%m/%Y")


# Combining the Date and Time variable and creating a new column in dataset named "DateTime"
sub_Set$DateTime <- as.POSIXct(paste(sub_Set$Date, sub_Set$Time))

# Creating the plot3

png("plot3.png", width = 480, height = 480)
plot(sub_Set$DateTime, sub_Set$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sub_Set$DateTime, sub_Set$Sub_metering_2, type="l", col="red")
lines(sub_Set$DateTime, sub_Set$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

#end
dev.off()