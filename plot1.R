#import dataset 
df<-read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?", colClasses=c("character","character","numeric","numeric", "numeric","numeric","numeric","numeric","numeric"))

df$Date<-as.Date(df$Date,'%d/%m/%Y')
df$Time<-strptime(df$Time,'%H:%M:%S')

#subset dataset
df <- df[((df$Date>=as.Date('2007-02-01')) & (df$Date<=as.Date('2007-02-02'))), ]


#png device enabled
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")
par(mfrow=c(1,1))
#draw plot
hist(df[,3], ylab='Frequency',xlab='Global Active Power (kilowatts)',col='red',main='Global Active Power')
#png device disabled
dev.off()
