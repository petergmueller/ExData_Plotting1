plot2 <- function() {
  ## import the data (supposing it's located in the working dir)
  import <- read.csv("household_power_consumption.txt", sep = ";")

  ## filter the date
  power <- subset(import, Date=="1/2/2007" | Date=="2/2/2007")

  ## replace ? by NA
  power[power == '?'] <- NA 

  ## change column format to numeric
  power[,3] <- as.numeric(as.character(power[,3]))
  
  ## combine Date Time in a new column 
  power$DateTime <- strptime(paste(power$Date, power$Time, sep=' '), format="%d/%m/%Y %R:%S")

  ## png device
  png(file = "plot2.png",  width = 480, height = 480, units = "px")

  ## setting the panel size and the background color
  par(mfrow = c(1,1), bg="white")
  
  ## setting the language to english - otherwise x-axis labels are in another language
  Sys.setlocale("LC_TIME", "English")

  ## plot line global active power vs date/time
  plot(power$DateTime, power$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
  
  ## device off
  dev.off()
}



