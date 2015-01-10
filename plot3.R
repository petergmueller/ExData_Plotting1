plot3 <- function() {
  ## import the data (supposing it's located in the working dir)
  import <- read.csv("household_power_consumption.txt", sep = ";")

  ## filter the date
  power <- subset(import, Date=="1/2/2007" | Date=="2/2/2007")

  ## replace ? by NA
  power[power == '?'] <- NA 

  ## change column format to numeric
  power[,7] <- as.numeric(as.character(power[,7]))
  power[,8] <- as.numeric(as.character(power[,8]))
  power[,9] <- as.numeric(as.character(power[,9]))
  
  ## combine Date Time in a new column 
  power$DateTime <- strptime(paste(power$Date, power$Time, sep=' '), format="%d/%m/%Y %R:%S")

    ## png device
  png(file = "plot3.png",  width = 480, height = 480, units = "px")
  
  ## setting the panel size and the background color
  par(mfrow = c(1,1), bg="white")
  
  ## setting the language to english - otherwise x-axis labels are in another language
  Sys.setlocale("LC_TIME", "English")

  ## plot lines sub_metering_1-3 vs date/time
  plot(power$DateTime, power$Sub_metering_1, col = "black", type="l", ylim=range(c(power$Sub_metering_1,power$Sub_metering_2,power$Sub_metering_3)), xlab = "", ylab = "Energy sub metering")
  par(new = TRUE)
  plot(power$DateTime, power$Sub_metering_2, col = "red", type="l", ylim=range(c(power$Sub_metering_1,power$Sub_metering_2,power$Sub_metering_3)), axes = FALSE, xlab = "", ylab = "")
  par(new = TRUE)
  plot(power$DateTime, power$Sub_metering_3, col = "blue", type="l", ylim=range(c(power$Sub_metering_1,power$Sub_metering_2,power$Sub_metering_3)), axes = FALSE, xlab = "", ylab = "")
  
  ## place the legend to the top rigth corner
  legend("topright", pch = NA, lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## close dev
  dev.off()
}



