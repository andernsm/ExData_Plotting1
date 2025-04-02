# plot1.R

# Cargar librería necesaria
library(data.table)

# Leer datos completos
file <- "ExData_Plotting1/household_power_consumption.txt"
data <- fread(file, na.strings = "?", sep = ";")

# Convertir fecha y filtrar por fechas específicas
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02")), ]

# Convertir columnas relevantes a numérico
data$Global_active_power <- as.numeric(data$Global_active_power)

# Crear gráfico
png("ExData_Plotting1/plot1.png", width = 480, height = 480)
hist(data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
