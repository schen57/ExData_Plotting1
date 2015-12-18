setwd("C:/Users/Shengyu Chen/Dropbox/Academics/Coursera/Data Science Specialization/Exploratory Data Analysis/Course Project 1")
dir()
library(data.table)
power=data.table(read.table("power.txt",header=T,sep=";",stringsAsFactors = FALSE))
power$Date=as.Date(power$Date,format = "%d/%m/%Y")
work=power[power$Date=="2007-02-01"|power$Date=="2007-02-02",]
work$datetime=as.POSIXct(strptime(paste(work$Date,work$Time),"%Y-%m-%d %H:%M:%S"))

#Plot 1
png("plot1.png",width = 480, height = 480)
with(work,hist(as.numeric(Global_active_power),breaks=15,col="red",main="Global Active Power"
               ,xlab="Global Active Power (kilowatts)"
               ,cex.lab=0.75,cex.main=0.9,cex.axis=0.75))
dev.off()
with(work,hist(as.numeric(Global_active_power),breaks=15,col="red",main="Global Active Power"
               ,xlab="Global Active Power (kilowatts)"
               ,cex.lab=0.75,cex.main=0.9,cex.axis=0.75))
