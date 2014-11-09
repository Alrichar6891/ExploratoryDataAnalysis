source("readFile.R")

#read the file and put it into dataframe. The readFile function is in readFile.R file
df_hh_power_consumption <- readFile("./household_power_consumption.txt")

png( filename = "plot4.png", width = 480, height = 480, units = "px")  ## Copy my plot to a PNG file


par(mfrow = c(2, 2))#, mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(
  df_hh_power_consumption,{
    #1
    plot(
      DateTime,Global_active_power, 
      type="l", main = "", xlab="", ylab="Global Active Power")
    #2
    plot(
      DateTime,Voltage, 
      type="l", main = "", xlab="datetime", ylab="Voltage")
    #3
    plot(
    DateTime,Sub_metering_1, 
    type="l", main = "", xlab="", ylab="Energy sub metering")
    
    with(
      df_hh_power_consumption,
      lines(
        DateTime,Sub_metering_2,  col="red")
    )
    
    with(
      df_hh_power_consumption,
      lines(
        DateTime,Sub_metering_3,  col="blue")
    )
    
    legend("topright", lty=1, col = c("black","blue", "red"), 
           legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
    
    #4
    plot(
      DateTime,Global_reactive_power, 
      type="l", main = "", xlab="datetime" )
  }
)

dev.off()