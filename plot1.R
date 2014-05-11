#Import data set into R, using the first line as header, and delimeter as ';'
#We import the data as a string to save on import times

hpc <- read.csv("/Users/Riemannian/Dropbox/zMOOCs/exploratory_data_analysis/course_project_1/household_power_consumption.txt", sep=";", header=T, colClasses="character", na.strings="?")

hpc$Date2 <- as.Date(hpc$Date, format="%d/%m/%Y") #to format the character date we add a new
#column to the data set in a way that gives the proper order the data is provided to us

feb_dates <- subset(hpc, format(Date2, "%Y-%m-%d") == "2007-02-01" | format(Date2, "%Y-%m-%d") == "2007-02-02") #we then subset the data set such that the the dates are those we are concerned with, 2/1/2007 & 2/2/2007

feb_dates$Global_active_power <- as.numeric(feb_dates$Global_active_power) #we convert the variable we interested in from a character class to a numeric class in order to plot our histogram

png(filename="/Users/Riemannian/Dropbox/zMOOCs/exploratory_data_analysis/ExData_Plotting1/plot1.png", height=480, width=480) #we open up the PNG device we plan to plot to

hist(feb_dates$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") #we finally plot the histogram of interest, with a title of "Global Active Power" and an x-axis label of "Global Active Power (kilowatts)"

dev.off() #we turn off the device in order to output our image
