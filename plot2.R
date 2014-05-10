#import dataset 
df<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?", colClasses=c("character","character","numeric","numeric", "numeric","numeric","numeric","numeric","numeric"))

df$Date<-as.Date(df$Date,'%d/%m/%Y')

#subset dataset
df <- df[((df$Date>=as.Date('2007-02-01')) & (df$Date<=as.Date('2007-02-02'))), ]
date_time <- as.POSIXlt(paste(df$Date, df$Time, sep = " "), format="%Y-%m-%d %H:%M:%S")

#png device enabled
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
par(mfrow=c(1,1))
#draw plot
plot(date_time, df[,3], type="l", xlab="", ylab='Global Active Power (kilowatts)')
#png device disabled
dev.off()