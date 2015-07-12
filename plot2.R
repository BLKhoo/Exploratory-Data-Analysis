
# Ensure the director is at the Exploratory Data Analysis

f <- ".\\exdata_data_household_power_consumption\\household_power_consumption.txt"
data.all <- read.csv(f,sep=";",na.strings="?")

#Convert the date
data.all$Date <- as.Date(data.all$Date,format="%d/%m/%Y")

#include the time as additional variable datetime
data.all$datetime <- as.POSIXct(paste(data.all$Date,data.all$Time))

#Subset the data
data <- subset(data.all, (Date >="2007-02-01" & Date <= "2007-02-02"))

#Plot 2 - x : datetime y: Global_active_power ,  line type: l
par(mfrow=c(1,1))
plot(data$Global_active_power ~ data$datetime, 
      ylab = "Global Active Power (kilowatts)", xlab="",type ="l")

rm(data.all)
# write to file with format png
dev.copy(png,file="plot2.png",height = 480, width = 480)
dev.off()

