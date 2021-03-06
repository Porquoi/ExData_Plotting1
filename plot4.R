#Import data set into R, using the first line as header, and delimeter as ';'
#We import the data as a string to save on import times

shpc <- read.csv("/Users/Riemannian/Dropbox/zMOOCs/exploratory_data_analysis/course_project_1/household_power_consumption.txt", sep=";", header=T, colClasses="character", na.strings="?")

shpc$Date2 <- as.Date(shpc$Date, format="%d/%m/%Y") #to format the character date we add a new
#column to the data set in a way that gives the proper order the data is provided to us

sfeb_dates <- subset(shpc, format(Date2, "%Y-%m-%d") == "2007-02-01" | format(Date2, "%Y-%m-%d") == "2007-02-02") #we then subset the data set such that the the dates are those we are concerned with, 2/1/2007 & 2/2/2007

sfeb_dates$Global_active_power <- as.numeric(sfeb_dates$Global_active_power) #we convert the variable we interested in from a character class to a numeric class in order to plot our histogram

inter_DateTime <- paste(sfeb_dates$Date2, sfeb_dates$Time, "EDT", sep=" ") #an intermediate construct trying to paste together the properly formatted date and the time

sfeb_dates$DateTime <- as.POSIXct(strptime(inter_DateTime, "%Y-%m-%d %H:%M:%S")) #convert that string to a posix object

png(filename="/Users/Riemannian/Dropbox/zMOOCs/exploratory_data_analysis/ExData_Plotting1/plot4.png", height=480, width=480) #we open up the PNG device we plan to plot to

par(mfrow=c(2,2)) # this option outputs the plots in a 2x2 matrix
plot(sfeb_dates$Global_active_power ~ sfeb_dates$DateTime, xlab="", ylab="Global Active Power", type="l") #plot first the global_active_power field, against the date field we have created
plot(sfeb_dates$Voltage ~ sfeb_dates$DateTime, xlab="datetime", ylab="Voltage", type="l")
#then plot the voltage filed, against the same date field, filling to the right

plot(sfeb_dates[, 7] ~ sfeb_dates$DateTime, type="l", col="black", ylim=y_range, ylab="Energy sub metering", xlab="") #next we embark on our very complicated third plot, involving authorizing the drawing vice to not update with a new plot

par(new=T) # we do that by invoking the following command

plot(sfeb_dates[, 8] ~ sfeb_dates$DateTime, type="l", col="red", ylim=y_range, axes=F, ylab="", xlab="") #we plot the red time series with the y limit 

par(new=T) #we continue to draw to the same plot

plot(sfeb_dates[, 9] ~ sfeb_dates$DateTime, type="l", col="blue", ylim=y_range, axes=F, ylab="", xlab="") #we plot the red time series on the same plot, up to the same #y-range

legend("topright", names(sfeb_dates)[7:9], col=c("black", "red", "blue"), pt.lwd=0.5, cex=0.15, lty=1, pt.cex=0.5, xjust=1) #much fiddling had to be done with the legend because it mysteriously kept printing over the data

plot(sfeb_dates$Global_reactive_power ~ sfeb_dates$DateTime, xlab="datetime", ylab="Global_reactive_power", type="l") #finally we plot the global_reactive_power field against our date field in the right most corner


dev.off() #we turn off the device in order to output our image



  
 