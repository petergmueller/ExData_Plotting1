plot4 <- function() {
  ## import the data (supposing it's located in the working dir)
  import <- read.csv("household_power_consumption.txt", sep = ";")

  ## filter the date
  power <- subset(import, Date=="1/2/2007" | Date=="2/2/2007")

  ## replace ? by NA
  power[power == '?'] <- NA 

  ## change column format to numeric
  power[,3] <- as.numeric(as.character(power[,3]))
  power[,4] <- as.numeric(as.character(power[,4]))
  power[,5] <- as.numeric(as.character(power[,5]))
  power[,7] <- as.numeric(as.character(power[,7]))
  power[,8] <- as.numeric(as.character(power[,8]))
  power[,9] <- as.numeric(as.character(power[,9]))
  
  ## combine Date Time in a new column 
  power$DateTime <- strptime(paste(power$Date, power$Time, sep=' '), format="%d/%m/%Y %R:%S")

  ## png device
  png(file = "plot4.png",  width = 480, height = 480, units = "px")
  
  ## setting the panel size and the background color
  par(mfrow = c(2,2), bg="white")
  
  ## setting the language to english - otherwise x-axis labels are in another language
  Sys.setlocale("LC_TIME", "English")
  
  ## plot upper left
  plot(power$DateTime, power$Global_active_power, ylab="Global Active Power", xlab="", type="l")
  
  ## plot upper right
  plot(power$DateTime, power$Voltage, ylab="Voltage", xlab="datetime", type="l")
  
  ## plot lower left
  plot(power$DateTime, power$Sub_metering_1, col = "black", type="l", ylim=range(c(power$Sub_metering_1,power$Sub_metering_2,power$Sub_metering_3)), xlab = "", ylab = "Energy sub metering")
  par(new = TRUE)
  plot(power$DateTime, power$Sub_metering_2, col = "red", type="l", ylim=range(c(power$Sub_metering_1,power$Sub_metering_2,power$Sub_metering_3)), axes = FALSE, xlab = "", ylab = "")
  par(new = TRUE)
  plot(power$DateTime, power$Sub_metering_3, col = "blue", type="l", ylim=range(c(power$Sub_metering_1,power$Sub_metering_2,power$Sub_metering_3)), axes = FALSE, xlab = "", ylab = "")
  legend("topright", pch = NA, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
  
  ## plot lower rigth
  plot(power$DateTime, power$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
  
  ## close dev
  dev.off()
}



