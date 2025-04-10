# Datos
media_poblacional <- 16
media_muestral <- 16.017
sigma <- 0.15
n <- 50
alpha <- 0.05

# Estadístico Z
z <- (media_muestral - media_poblacional) / (sigma / sqrt(n))

# Valor-p para prueba bilateral
p_value <- 2 * (1 - pnorm(abs(z)))

# Resultado
cat("Estadístico Z:", round(z, 4), "\n")
cat("Valor-p:", round(p_value, 4), "\n")

# Conclusión
if (p_value < alpha) {
  cat("Se rechaza la hipótesis nula. La evidencia sugiere que la media es diferente de 16 onzas.\n")
} else {
  cat("No se rechaza la hipótesis nula. No hay suficiente evidencia para decir que la media es diferente de 16 onzas.\n")
}
