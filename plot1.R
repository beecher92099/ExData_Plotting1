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
  
  png(filename = "plot1.png", width=480, height=480)
  
  hist(hpc$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
  
  dev.off()
  
}