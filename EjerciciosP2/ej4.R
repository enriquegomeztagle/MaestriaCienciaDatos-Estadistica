# ----------------------------------------
# 📚 Análisis de una muestra: IC para μ y σ²
# ----------------------------------------

# 1. Datos
datos <- c(1500, 1750, 1630, 1480, 1420, 1890, 1350, 1740,
           1680, 1520, 1580, 1840, 1340, 1460, 1550, 1600)

# 2. Estadísticos básicos
n <- length(datos)                  # Tamaño de muestra
media <- mean(datos)               # Media muestral
desviacion <- sd(datos)            # Desviación estándar muestral
varianza <- var(datos)             # Varianza muestral
gl <- n - 1                        # Grados de libertad
error_estandar <- desviacion / sqrt(n)

# ---------------------------
# 🔹 Intervalo de confianza para la media (μ)
# ---------------------------

# IC al 98%
alfa98 <- 1 - 0.98
t_98 <- qt(1 - alfa98 / 2, df = gl)
IC_98_media <- c(media - t_98 * error_estandar, media + t_98 * error_estandar)

# IC al 95%
alfa95 <- 1 - 0.95
t_95 <- qt(1 - alfa95 / 2, df = gl)
IC_95_media <- c(media - t_95 * error_estandar, media + t_95 * error_estandar)

# ---------------------------
# 🔹 Intervalo de confianza para la varianza (σ²)
# ---------------------------

# IC al 98%
chi_inf_98 <- qchisq(alfa98 / 2, df = gl)
chi_sup_98 <- qchisq(1 - alfa98 / 2, df = gl)
IC_98_varianza <- c(gl * varianza / chi_sup_98, gl * varianza / chi_inf_98)

# IC al 95%
chi_inf_95 <- qchisq(alfa95 / 2, df = gl)
chi_sup_95 <- qchisq(1 - alfa95 / 2, df = gl)
IC_95_varianza <- c(gl * varianza / chi_sup_95, gl * varianza / chi_inf_95)

# ---------------------------
# 🔹 Resultados
# ---------------------------

cat("Media:", round(media, 2), "\n")
cat("Desviación estándar:", round(desviacion, 2), "\n")
cat("Varianza:", round(varianza, 2), "\n\n")

cat("IC al 98% para la media:", round(IC_98_media, 2), "\n")
cat("IC al 95% para la media:", round(IC_95_media, 2), "\n\n")

cat("IC al 98% para la varianza:", round(IC_98_varianza, 2), "\n")
cat("IC al 95% para la varianza:", round(IC_95_varianza, 2), "\n")
