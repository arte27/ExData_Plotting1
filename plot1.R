
#read the file
data <-  read.csv(file = "household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)
data$Date<- as.Date(as.character(data$Date),"%d/%m/%Y")

#subset period 
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

#extracting the relevant period data(2007-02-01 to 2007-02-02)
sdata<- subset(data,Date>=DATE1 & Date<=DATE2 )

#formating the "FACTOR" COLUMNS INTO numeric values
for (i in 3:9)
{
  sdata[,i] <- as.numeric(sdata[,i])
}


#Plot1
#plot functions below

png(filename = "plot1.png", width = 480, height = 480)
hist(sdata$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
