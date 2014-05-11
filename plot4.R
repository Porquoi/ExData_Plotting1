#Import data set into R, using the first line as header, and delimeter as ';'
#We import the data as a string to save on import times

hpc <- read.csv("/Users/Riemannian/Dropbox/zMOOCs/exploratory_data_analysis/course_project_1/household_power_consumption.txt", sep=";", header=T, colClasses="character", na.strings="?")

hpc$Date2 <- as.Date(hpc$Date, format="%d/%m/%Y") #to format the character date we add a new
#column to the data set in a way that gives the proper order the data is provided to us

sfeb_dates <- subset(hpc, format(Date2, "%Y-%m-%d") == "2007-02-01" | format(Date2, "%Y-%m-%d") == "2007-02-02") #we then subset the data set such that the the dates are those we are concerned with, 2/1/2007 & 2/2/2007

sfeb_dates$Global_active_power <- as.numeric(feb_dates$Global_active_power) #we convert the variable we interested in from a character class to a numeric class in order to plot our histogram

png(filename="/Users/Riemannian/Dropbox/zMOOCs/exploratory_data_analysis/ExData_Plotting1/plot1.png", height=480, width=480) #we open up the PNG device we plan to plot to

par(mfrow=c(2,2))
plot(sfeb_dates$Global_active_power ~ sfeb_dates$DateTime, xlab="", ylab="Global Active Power", type="l")
plot(sfeb_dates$Voltage ~ sfeb_dates$DateTime, xlab="datetime", ylab="Voltage", type="l")


plot(sfeb_dates[, 7] ~ sfeb_dates$DateTime, type="l", col="black", ylim=y_range, ylab="Energy sub metering", xlab="")

par(new=T)

plot(sfeb_dates[, 8] ~ sfeb_dates$DateTime, type="l", col="red", ylim=y_range, axes=F, ylab="", xlab="")

par(new=T)

plot(sfeb_dates[, 9] ~ sfeb_dates$DateTime, type="l", col="blue", ylim=y_range, axes=F, ylab="", xlab="")

legend("topright", names(sfeb_dates)[7:9], col=c("black", "red", "blue"), pt.lwd=0.5, cex=0.15, lty=1, pt.cex=0.5, xjust=1)

plot(sfeb_dates$Global_reactive_power ~ sfeb_dates$DateTime, xlab="datetime", ylab="Global_reactive_power", type="l")


dev.off() #we turn off the device in order to output our image



  
 