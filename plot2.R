# plot2.R

# Leer los datos
file <- "ExData_Plotting1/household_power_consumption.txt"

data <- read.table(file, header = TRUE, sep = ";", na.strings = "?",
                   stringsAsFactors = FALSE)

# Convertir fechas
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filtrar solo las fechas requeridas
data_filtered <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Crear variable datetime unificando Date y Time
datetime <- strptime(paste(data_filtered$Date, data_filtered$Time), format = "%Y-%m-%d %H:%M:%S")

# Convertir Global_active_power a numérico
gap <- as.numeric(data_filtered$Global_active_power)

# Crear gráfico
png("ExData_Plotting1/plot2.png", width = 480, height = 480)
plot(datetime, gap, type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
