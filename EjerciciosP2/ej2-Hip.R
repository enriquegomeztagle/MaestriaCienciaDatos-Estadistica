# Datos
tiempos <- c(30, 28, 14, 39, 23, 12, 24, 22, 2, 23, 28, 31)

# Prueba t unilateral (media > 15)
t_test <- t.test(tiempos, mu = 15, alternative = "greater")

# Mostrar resultados
print(t_test)

# También puedes imprimir de forma más detallada si quieres algo personalizado:
cat("Estadístico t:", round(t_test$statistic, 4), "\n")
cat("Grados de libertad:", t_test$parameter, "\n")
cat("Valor-p:", round(t_test$p.value, 4), "\n")
cat("Media muestral:", mean(tiempos), "\n")
cat("Intervalo de confianza (95%):", round(t_test$conf.int[1], 4), "a ∞\n")
