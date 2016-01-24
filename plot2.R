#read the file
data <-  read.csv(file = "household_power_consumption.txt",header = TRUE,sep = ";",na.strings = "?",stringsAsFactors = FALSE)

data$Date<- as.Date(as.character(data$Date),"%d/%m/%Y")

#subset period 
DATE1 <- as.Date("2007-02-01")
DATE2 <- as.Date("2007-02-02")

#extracting the relevant period data(2007-02-01 to 2007-02-02)
sdata<- subset(data,Date>=DATE1 & Date<=DATE2 )
sdata$Date <-as.character(sdata$Date) 

sdata$dateANDtime <- strftime(paste(sdata$Date,sdata$Time),"%Y-%m-%d %H:%M:%S")
sdata$dateANDtime <- as.POSIXlt(sdata$dateANDtime)

#formating the "FACTOR" COLUMNS INTO numeric values
for (i in 3:9)
{
  sdata[,i] <- as.numeric(sdata[,i])
}

#plot functions below
png(filename = "plot2.png", width=480, height=480)
plot(sdata$dateANDtime, sdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off() 

