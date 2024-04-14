#Read the data set
data <- read.table("desktop/household_power_consumption.txt", sep = ";", header = TRUE)

# Convert the 'Date' column to Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data between 01/02/2007 and 02/02/2007
subset_data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"), ]

# Convert 'Global_active_power' to numeric
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

# Adjust the margins
par(mar = c(4, 5, 2, 2))

# Plot and save in PNG
png("plot1.png", width = 480, height = 480) 
hist(subset_data$Global_active_power,
     main = "Global Active Power",
     xlab ="Global Active Power(Killowats)", col = "purple", lwd = 2)
dev.off()

