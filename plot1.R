source("readFile.R")


#read the file and put it into dataframe. The readFile function is in readFile.R file
df_hh_power_consumption <- readFile("./household_power_consumption.txt")

df_hh_power_consumption <- df_hh_power_consumption %>%
  group_by(Global_active_power) %>%
  mutate(Frequency = n())



png( filename = "plot1.png", width = 480, height = 480, units = "px")  ## Copy my plot to a PNG file
with(df_hh_power_consumption, hist(Global_active_power, freq=Frequency, col="red", breaks=12, 
                                   main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off() 