
#Use dplyr because I found it easier to clean and reshape the data
library(dplyr)

# change to english locale (on Windows)
Sys.setlocale("LC_TIME", "English")

#read the file, if the dataframe doesn't aleady exists. So we read it only once
readFile <- function (pathFile) {
if (!exists("df_hh_power_consumption", mode="list")) { 
df_hh_power_consumption <- read.table(pathFile, header=TRUE, sep = ";", dec=".",
           na.strings="?", stringsAsFactors = FALSE, 
           colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

df_hh_power_consumption <- tbl_df(df_hh_power_consumption)

df_hh_power_consumption <- df_hh_power_consumption %>%
      filter(Date=="1/2/2007"|Date=="2/2/2007") %>%
      mutate(DateTime = as.POSIXct(strptime(paste(Date, Time),format = "%d/%m/%Y %H:%M:%S")))
}
else
{
df_hh_power_consumption
}}

