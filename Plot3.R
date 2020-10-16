##Before running this code, ensure working directory is set to folder 
## containing the required data: file household_power_consumption.txt


## Load dataset
myplot_data <- read.table("./household_power_consumption.txt", sep = ";", 
                          na.strings="?", header=TRUE)

## We add a new column with POSIXct date/time = date+time
myplot_data$DateTime <- as.POSIXct(strptime(paste(myplot_data$Date, 
                                                  myplot_data$Time), 
                                            format="%d/%m/%Y %H:%M:%S"))
## Subsetting data 
myplot_data_sub <- subset(myplot_data, myplot_data$Date == "1/2/2007" | 
                              myplot_data$Date == "2/2/2007") 

## Create Plot 3 and save it to png
png(filename = "Plot3.png", width = 480, height = 480)
plot(myplot_data_sub$DateTime, myplot_data_sub$Sub_metering_1, type="l", xlab = NA, ylab = "Energy sub metering")
lines(myplot_data_sub$DateTime, myplot_data_sub$Sub_metering_2, type="l", col = "red")
lines(myplot_data_sub$DateTime, myplot_data_sub$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c(names(myplot_data_sub)[7:9]), col = c("black", "red", "blue"), lty=1, cex=0.8)
dev.off()
