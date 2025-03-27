# EJERCICIO 1 - Distribución uniforme [0,1]

# Paso 1: Parámetros de la distribución uniforme
a <- 0
b <- 1
mu <- (a + b) / 2
var <- ((b - a)^2) / 12

# Paso 2: Tamaño de la muestra
n <- 75

# Media y desviación estándar de la media muestral
mu_muestra <- mu
sigma_muestra <- sqrt(var / n)

# Paso 3: Límites de la probabilidad
x1 <- 0.45
x2 <- 0.55

# Convertimos a valores Z
z1 <- (x1 - mu_muestra) / sigma_muestra
z2 <- (x2 - mu_muestra) / sigma_muestra

# Paso 4: Probabilidad usando la normal estándar
p <- pnorm(z2) - pnorm(z1)

# Imprimir resultados
cat("----- EJERCICIO 1 (Distribución uniforme) -----\n")
cat(sprintf("Media poblacional (μ): %.4f\n", mu))
cat(sprintf("Varianza poblacional: %.4f\n", var))
cat(sprintf("Desviación estándar de la media muestral: %.4f\n", sigma_muestra))
cat(sprintf("Z1 = %.2f, Z2 = %.2f\n", z1, z2))
cat(sprintf("P(%.2f <= X̄ <= %.2f) ≈ %.4f\n", x1, x2, p))