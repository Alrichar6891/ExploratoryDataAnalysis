source("readFile.R")


#read the file and put it into dataframe. The readFile function is in readFile.R file
df_hh_power_consumption <- readFile("./household_power_consumption.txt")

png( filename = "plot2.png", width = 480, height = 480, units = "px")  ## Copy my plot to a PNG file

with(df_hh_power_consumption,plot(DateTime,Global_active_power, 
type="l", main = "", xlab="", ylab="Global Active Power (kilowatts)"))
     
dev.off()
