import Pkg
Pkg.add("Distributions")
Pkg.add("HypothesisTests")
using Statistics, Distributions

# Datos
media_poblacional = 16
media_muestral = 16.017
sigma = 0.15
n = 50
alpha = 0.05

# Estadístico Z
z = (media_muestral - media_poblacional) / (sigma / sqrt(n))

# Valor-p para prueba bilateral
p_value = 2 * (1 - cdf(Normal(0, 1), abs(z)))

# Resultado
println("Estadístico Z: ", round(z, digits=4))
println("Valor-p: ", round(p_value, digits=4))

# Conclusión
if p_value < alpha
    println("Se rechaza la hipótesis nula. La evidencia sugiere que la media es diferente de 16 onzas.")
else
    println("No se rechaza la hipótesis nula. No hay suficiente evidencia para decir que la media es diferente de 16 onzas.")
end
