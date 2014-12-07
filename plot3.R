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
dates<-data[,1]
times<-data[,2]
x<-paste(dates, times)
y<-strptime(x, format="%Y-%m-%d %H:%M:%S")
data[,8]<-as.numeric(levels(data[,8])[data[,8]])
data[,7]<-as.numeric(levels(data[,7])[data[,7]])
plot(y, data[,7], type="l", ylab="Energy sub metering", xlab='')
lines(y, data[,8], type="l", col=2)
lines(y, data[,9], type="l", col=4)
legend("topright", c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),col=c('black', 'red', 'blue'),lty=1)

dev.copy(png,'plot3.png')
dev.off()