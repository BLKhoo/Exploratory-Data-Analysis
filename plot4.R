
# Ensure the director is at the Exploratory Data Analysis

f <- ".\\exdata_data_household_power_consumption\\household_power_consumption.txt"
data.all <- read.csv(f,sep=";",na.strings="?")

#Convert the date
data.all$Date <- as.Date(data.all$Date,format="%d/%m/%Y")

#include the time as additional variable datetime
data.all$datetime <- as.POSIXct(paste(data.all$Date,data.all$Time))


#Subset the data
data <- subset(data.all, (Date >="2007-02-01" & Date <= "2007-02-02"))

#Plot 4 - multiple row/col  charts  2 x 2
  par(mfrow = c(2,2))
  plot(data$Global_active_power ~ data$datetime, type="l", 
                ylab="Global Active Power",xlab="")
  
  plot(data$Voltage ~ data$datetime, type ="l",
       ylab="Voltage", xlab="datetime")
  
  plot( data$Sub_metering_1 ~ data$datetime, type="l",
      ylab="Energy sub metering",xlab="")
  lines(data$Sub_metering_2 ~ data$datetime,col="red")
  lines(data$Sub_metering_3 ~ data$datetime,col="blue")
  
  legend("topright",
       col=c("black","red","blue"),lty=1,lwd=2,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
              )
  plot(data$Global_reactive_power ~ data$datetime, type ="l", 
      ylab="Global Reactive Power", xlab="datetime")


rm(data.all)

# write to file with format png
dev.copy(png,file="plot4.png",height = 480, width = 480)
dev.off()

