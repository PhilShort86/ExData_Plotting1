##Assignement 1 exploratory data analysis
##Plot 2

rm(list=ls())
#reading data 
data<-read.table('~/desktop/data-science/exploratory-data-analysis/household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the data related to two days
sub_Set<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))

# Changing the class of Date variable from character to Date:
sub_Set$Date <- as.Date(sub_Set$Date, format = "%d/%m/%Y")


# Combining the Date and Time variable and creating a new column in dataset named "DateTime"
sub_Set$DateTime <- as.POSIXct(paste(sub_Set$Date, sub_Set$Time))

# Creating the plot2

png("plot2.png", width = 480, height = 480)
plot(sub_Set$DateTime, sub_Set$Global_active_power, type = "l", ylab= "Global Active Power(kilowatts)", xlab="")

#end
dev.off()