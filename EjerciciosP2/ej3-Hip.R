# -----------------------------
# Datos del experimento
# -----------------------------
x <- 369          # Número de personas que se tropezaron
n <- 575          # Total de personas que subieron
p0 <- 0.60        # Proporción bajo la hipótesis nula
alpha <- 0.04     # Nivel de significancia

# -----------------------------
# Inciso a y b: Prueba de hipótesis y cálculo del valor-p
# -----------------------------
phat <- x / n  # Proporción muestral

# Estadístico Z para proporciones
z <- (phat - p0) / sqrt(p0 * (1 - p0) / n)

# Valor-p para prueba unilateral (cola derecha)
p_value <- 1 - pnorm(z)

# Mostrar resultados
cat("=== INCISO A y B ===\n")
cat("Proporción muestral (phat):", round(phat, 4), "\n")
cat("Estadístico Z:", round(z, 4), "\n")
cat("Valor-p:", round(p_value, 4), "\n")

# Conclusión
if (p_value < alpha) {
  cat("Conclusión: Se rechaza H0. Hay evidencia de que más del 60% de las personas se tropiezan.\n\n")
} else {
  cat("Conclusión: No se rechaza H0. No hay suficiente evidencia para concluir que más del 60% se tropieza.\n\n")
}

# -----------------------------
# Inciso c: Tamaño de muestra requerido para un error máximo de 0.03
# con nivel de confianza del 99%
# -----------------------------
confianza <- 0.99
z_confianza <- qnorm(1 - (1 - confianza) / 2)  # z = 2.576 para 99%
error_maximo <- 0.03

# Cálculo del tamaño de muestra
n_requerido <- (z_confianza / error_maximo)^2 * phat * (1 - phat)

# Mostrar resultado
cat("=== INCISO C ===\n")
cat("Nivel de confianza:", confianza * 100, "%\n")
cat("Error máximo permitido:", error_maximo, "\n")
cat("Tamaño de muestra necesario:", ceiling(n_requerido), "personas\n")
