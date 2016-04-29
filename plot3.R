make_plots <- function() {
  setwd("C:/Users/beecher/Documents/Coursera/Exploratory_Project1")
  
  ## read in data file
  hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
  
  ## subset data for just 2007-02-01 and 2007-02-02
  hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
  
  ## convert to Date and Time formats
  
  ## first prepend the year to Time
  hpc$Time <- paste(hpc$Date,hpc$Time)
  
  ## convert to POSIXlt
  hpc$Time <-strptime(hpc$Time, format="%d/%m/%Y %H:%M:%S")
  
  ## convert to Date
  hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")
  
  ## now do the plot
  
  png(filename = "plot3.png", width=480, height=480)
  
  ## plot first variable
  
  plot(hpc$Time, hpc$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering", col = "black")
  
  ## plot second variable
  
  lines(hpc$Time, hpc$Sub_metering_2, col = "red")
  
  ## plot third variable
  
  lines(hpc$Time, hpc$Sub_metering_3, col = "blue")
  
  ## add legend
  
  legend("topright", col = c("black", "red", "blue"), lty = c(1,1,1), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
  
}