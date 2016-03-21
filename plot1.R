install.packages("pryr")
library(pryr)
install.packages("devtools")
devtools::install_github("hadley/lineprof")

### Download and read in data
filename <- "epc.zip"
if(!file.exists(filename)){
    download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                  destfile = filename,
                  method="curl")
}
epc <- read.csv(unz(filename, "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors = FALSE,na.strings = "?")
object_size(epc)  ## 166M RAM is used
epc_sub <- subset(epc, unclass(as.Date(epc$Date, format = "%d/%m/%Y"))>=unclass(as.Date("2007-02-01"))&unclass(as.Date(epc$Date, format = "%d/%m/%Y"))<=unclass(as.Date("2007-02-02")))

png(filename="plot1.png", width=480, height = 480)
hist(epc_sub$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
title(main="Global Active Power")
dev.off()
