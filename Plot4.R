#Read the data set
data <- read.table("desktop/household_power_consumption.txt", sep = ";", header = TRUE)

# Convert the 'Date' column to Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data between 01/02/2007 and 02/02/2007
subset_data <- data[data$Date >= as.Date("2007-02-01") & data$Date < as.Date("2007-02-3"), ]

# Convert 'Global_active_power' to numeric
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

#Plot
par(mfrow = c(2,2), mar = c(4, 4, 2, 1))

#Plot Global Active Power
png("plot1.png", width = 480, height = 480)
with(subset_data,plot(Global_active_power, ylab = "Global Active Power",
                      xlab = "",type = "l", xaxt = "n"))

custom_labels <- c("Th", "Fri", "Sat")  
custom_positions <- seq(1, nrow(subset_data), length.out = 3)
axis(side = 1, at = custom_positions, labels = custom_labels)


#Plot Voltage
with(subset_data,plot(Voltage, ylab = "Voltage",
                      xlab = "Datetime",type = "l", xaxt = "n"))

custom_labels <- c("Th", "Fri", "Sat")  
custom_positions <- seq(1, nrow(subset_data), length.out = 3)
axis(side = 1, at = custom_positions, labels = custom_labels)

#Plot Energy Sub Metrring
with(subset_data,plot( Sub_metering_1, ylab = "Energy Sub Metrring", xlab = "",type = "l",
                       xaxt = "n"))
with(subset_data,lines(Sub_metering_2, col = "red"))
with(subset_data,lines(Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, cex = 0.7)
custom_labels <- c("Th", "Fri", "Sat")  
custom_positions <- seq(1, nrow(subset_data), length.out = 3)
axis(side = 1, at = custom_positions, labels = custom_labels)

#Plot 
with(subset_data,plot(Global_reactive_power, ylab = "Global Reavctive Power",
                      xlab = "Datetime",type = "l", xaxt = "n"))

custom_labels <- c("Th", "Fri", "Sat")  
custom_positions <- seq(1, nrow(subset_data), length.out = 3)
axis(side = 1, at = custom_positions, labels = custom_labels)

dev.off()
