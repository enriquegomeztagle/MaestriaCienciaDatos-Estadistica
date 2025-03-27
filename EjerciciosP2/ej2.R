# EJERCICIO 2 - Dos muestras con poblaciones y funciones de masa

# Valores y probabilidades para X1
x1_values <- c(2, 3, 7)
p1 <- c(1/3, 1/3, 1/3)

# Valores y probabilidades para X2
x2_values <- c(1, 3)
p2 <- c(2/3, 1/3)

# Tamaños de muestra
n1 <- 125
n2 <- 100

# Media y varianza de X1
mean_x1 <- sum(x1_values * p1)
var_x1 <- sum((x1_values - mean_x1)^2 * p1)

# Media y varianza de X2
mean_x2 <- sum(x2_values * p2)
var_x2 <- sum((x2_values - mean_x2)^2 * p2)

# Media y desviación estándar de la diferencia de medias
mean_diff <- mean_x1 - mean_x2
var_diff <- var_x1 / n1 + var_x2 / n2
sd_diff <- sqrt(var_diff)
# Probabilidad de que X̄1 - X̄2 > 1.84
z <- (1.84 - mean_diff) / sd_diff
prob <- 1 - pnorm(z)

# Resultados
cat("----- EJERCICIO 2 (Dos muestras con poblaciones y funciones de masa) -----\n")
cat(sprintf("Media X1: %.4f\n", mean_x1))
cat(sprintf("Varianza X1: %.4f\n", var_x1))
cat(sprintf("Media X2: %.4f\n", mean_x2))
cat(sprintf("Varianza X2: %.4f\n", var_x2))
cat(sprintf("Media de la diferencia: %.4f\n", mean_diff))
cat(sprintf("Desviación estándar de la diferencia: %.4f\n", sd_diff))
cat(sprintf("Z: %.4f\n", z))
cat(sprintf("Probabilidad de que X̄1 - X̄2 > 1.84: %.4f\n", prob))
