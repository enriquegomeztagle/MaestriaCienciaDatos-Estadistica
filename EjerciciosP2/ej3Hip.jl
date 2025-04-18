import Pkg
Pkg.add("Distributions")
Pkg.add("HypothesisTests")

using Distributions

# Datos
x = 369
n = 575
p0 = 0.60
alpha = 0.04

# Proporción muestral
p_hat = x / n

# Estadístico Z
z = (p_hat - p0) / sqrt(p0 * (1 - p0) / n)

# Valor-p (prueba unilateral derecha)
p_value = 1 - cdf(Normal(0, 1), z)

# Resultados
println("Proporción muestral: ", round(p_hat, digits=4))
println("Estadístico Z: ", round(z, digits=4))
println("Valor-p: ", round(p_value, digits=4))

# Conclusión
if p_value < alpha
    println("Se rechaza H₀: hay evidencia suficiente para concluir que más del 60% se tropiezan.")
else
    println("No se rechaza H₀: no hay evidencia suficiente para concluir que más del 60% se tropiezan.")
end

using Statistics

# Parámetros
z = 2.576  # para 99% de confianza
p_hat = x / n
E = 0.03

# Tamaño de muestra necesario
n_requerido = (z^2 * p_hat * (1 - p_hat)) / (E^2)
println("Se necesitan al menos ", ceil(n_requerido), " personas para una precisión de ±0.03 con 99% de confianza.")
