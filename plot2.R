#Import data set into R, using the first line as header, and delimeter as ';'
#We import the data as a string to save on import times

shpc <- read.csv("/Users/Riemannian/Dropbox/zMOOCs/exploratory_data_analysis/course_project_1/household_power_consumption.txt", sep=";", header=T, colClasses="character", na.strings="?")

shpc$Date2 <- as.Date(shpc$Date, format="%d/%m/%Y") #to format the character date we add a new
#column to the data set in a way that gives the proper order the data is provided to us

sfeb_dates <- subset(shpc, format(Date2, "%Y-%m-%d") == "2007-02-01" | format(Date2, "%Y-%m-%d") == "2007-02-02") #we then subset the data set such that the the dates are those we are concerned with, 2/1/2007 & 2/2/2007

sfeb_dates$Global_active_power <- as.numeric(sfeb_dates$Global_active_power) #we convert the variable we interested in from a character class to a numeric class in order to plot our histogram

inter_DateTime <- paste(sfeb_dates$Date2, sfeb_dates$Time, "EDT", sep=" ") #an intermediate construct trying to paste together the properly formatted date and the time

sfeb_dates$DateTime <- as.POSIXct(strptime(inter_DateTime, "%Y-%m-%d %H:%M:%S")) #convert that string to a posix object

png(filename="/Users/Riemannian/Dropbox/zMOOCs/exploratory_data_analysis/ExData_Plotting1/plot2.png", height=480, width=480) #we open up the PNG device we plan to plot to)

plot(sfeb_dates$Global_active_power ~ sfeb_dates$DateTime, type="l", xlab="", ylab="Global Active Power(kilowatts)") #plot the global_active_power against our date field

dev.off() #turn off the png device


