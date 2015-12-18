setwd("C:/Users/Shengyu Chen/Dropbox/Academics/Coursera/Data Science Specialization/Exploratory Data Analysis/Course Project 1")
dir()
library(data.table)
power=data.table(read.table("power.txt",header=T,sep=";",stringsAsFactors = FALSE))
power$Date=as.Date(power$Date,format = "%d/%m/%Y")
work=power[power$Date=="2007-02-01"|power$Date=="2007-02-02",]
work$datetime=as.POSIXct(strptime(paste(work$Date,work$Time),"%Y-%m-%d %H:%M:%S"))

#plot4
par(mfrow=c(2,2))
with(work,plot(Global_active_power~datetime,type="l",ylab="Global Active Power",
               xlab="",cex.axis=0.75,cex.lab=0.75))
with(work,plot(Voltage~datetime,type="l",ylab="Voltage",cex.lab=0.75,cex.axis=0.75))
with(work,plot(Sub_metering_1~datetime,type="l",cex.lab=0.75,cex.axis=0.75,ylab="Energy Sub Metering"))
lines(Sub_metering_2~datetime,col="red",type="l",data=work)
lines(Sub_metering_3~datetime,col="blue",type="l",data=work)
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),
       cex=0.65,bty = "n")
with(work,plot(Global_reactive_power~datetime,type="l",cex.lab=0.65,cex.axis=.65))

png("plot4.png",width= 480, height = 480)
par(mfrow=c(2,2))
with(work,plot(Global_active_power~datetime,type="l",ylab="Global Active Power",
               xlab="",cex.axis=0.75,cex.lab=0.75))
with(work,plot(Voltage~datetime,type="l",ylab="Voltage",cex.lab=0.75,cex.axis=0.75))
with(work,plot(Sub_metering_1~datetime,type="l",cex.lab=0.75,cex.axis=0.75,ylab="Energy Sub Metering"))
lines(Sub_metering_2~datetime,col="red",type="l",data=work)
lines(Sub_metering_3~datetime,col="blue",type="l",data=work)
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),
       cex=0.65,bty = "n")
with(work,plot(Global_reactive_power~datetime,type="l",cex.lab=0.65,cex.axis=.65))
dev.off()
