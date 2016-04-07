##Assignement 1 exploratory data analysis
##Plot 1

rm(list=ls())
#reading data 
data<-read.table('~/desktop/data-science/exploratory-data-analysis/household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the data related to two days
 sub_Set<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))

 # Changing the class of Date variable from character to Date: 
 sub_Set$Date <- as.Date(sub_Set$Date, format = "%d/%m/%Y")

 # Creating the png  plot1:
png("plot1.png", width = 480, height = 480)
hist(sub_Set$Global_active_power, main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")

dev.off()
#end