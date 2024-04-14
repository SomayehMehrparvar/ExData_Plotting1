#Read the data set
data <- read.table("desktop/household_power_consumption.txt", sep = ";", header = TRUE)

# Convert the 'Date' column to Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data between 01/02/2007 and 02/02/2007
subset_data <- data[data$Date >= as.Date("2007-02-01") & data$Date < as.Date("2007-02-03"), ]

# Convert 'Global_active_power' to numeric
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

# Adjust the margins
par(mar = c(4, 5, 2, 2))

# Plot and save in PNG
png("plot1.png", width = 480, height = 480)
with(subset_data,plot(Global_active_power, ylab = "Global Active Power",
                      xlab = "",type = "l", xaxt = "n"))

custom_labels <- c("Th", "Fri", "Sat")  
custom_positions <- seq(1, nrow(subset_data), length.out = 3)
axis(side = 1, at = custom_positions, labels = custom_labels)

dev.off()
