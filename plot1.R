dataset_url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "exdata_data_household_power_consumption.zip")
directory<-getwd()
unzip("exdata_data_household_power_consumption.zip", exdir = directory)
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
data[data=="?"] <- NA
na.omit(data)
data[,1] <- as.Date(data[,1], "%d/%m/%Y")
data1<-data[which(data[,1]=="2007-02-01"),]
data2<-data[which(data[,1]=="2007-02-02"),]
data<-rbind(data1, data2)
data[,3]<-as.numeric(levels(data[,3])[data[,3]])
hist(data[,3], col=2, main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png,'plot1.png')
dev.off()




