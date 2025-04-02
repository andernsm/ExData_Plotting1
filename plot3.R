# plot3.R

# Leer los datos
file <- "ExData_Plotting1/household_power_consumption.txt"

data <- read.table(file, header = TRUE, sep = ";", na.strings = "?",
                   stringsAsFactors = FALSE)

# Convertir fechas
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filtrar solo las fechas requeridas
data_filtered <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Crear variable datetime unificando Date y Time
datetime <- strptime(paste(data_filtered$Date, data_filtered$Time),
                     format = "%Y-%m-%d %H:%M:%S")

# Convertir submeterings a numérico
sub1 <- as.numeric(data_filtered$Sub_metering_1)
sub2 <- as.numeric(data_filtered$Sub_metering_2)
sub3 <- as.numeric(data_filtered$Sub_metering_3)

# Crear gráfico
png("ExData_Plotting1/plot3.png", width = 480, height = 480)
plot(datetime, sub1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(datetime, sub2, col = "red")
lines(datetime, sub3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)
dev.off()
