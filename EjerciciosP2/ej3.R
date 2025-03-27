# ---------------------------------------------------------
# Este código resuelve un problema de probabilidad usando 
# la distribución chi-cuadrado. 
# Se busca calcular la probabilidad de que la varianza muestral
# de una muestra aleatoria de tamaño n=10, tomada de una población 
# normal con varianza σ² = 16, sea mayor a 30.
# ---------------------------------------------------------

# Parámetros conocidos
n <- 10                # Tamaño de la muestra
sigma2 <- 4^2          # Varianza poblacional (σ²)
s2_obs <- 30           # Varianza muestral observada

# Estadístico de prueba basado en distribución chi-cuadrado
chi_stat <- (n - 1) * s2_obs / sigma2

# Cálculo de la probabilidad usando cola superior de la chi-cuadrado
p_value <- pchisq(chi_stat, df = n - 1, lower.tail = FALSE)

# Impresión elegante del resultado
cat("La probabilidad de que la varianza muestral sea mayor a 30 es:",
    round(p_value, 4), "\n")
