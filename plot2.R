#Solution for Plot 2
# Steven Atienza
# 2019
###########################################
#Copy the Data on the Current Working Directory

#Load the Data into the variable "data" | Indicate that ; is a separate |
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")


#Convert the Variable date to Date Class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
data <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Attach the data then Plot It
data$datetime <- as.POSIXct(data$datetime)
attach(data)
plot(Global_active_power ~ datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

# Save file as PNG file format| set the height and width to 480
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
detach(data)