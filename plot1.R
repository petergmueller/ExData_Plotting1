plot1 <- function() {
  ## import the data (supposing it's located in the working dir)
  import <- read.csv("household_power_consumption.txt", sep = ";")

  ## filter the date
  power <- subset(import, Date=="1/2/2007" | Date=="2/2/2007")

  ## replace ? by NA
  power[power == '?'] <- NA 

  ## change column format to numeric
  power[,3] <- as.numeric(as.character(power[,3]))

  ## setting the panel size and the background color
  par(mfrow = c(1,1), bg="white")

  ## draw the histogram
  hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

  ## copy to pdf device and close the device
  dev.copy(png, file = "plot1.png",  width = 480, height = 480, units = "px")
  dev.off()
}



