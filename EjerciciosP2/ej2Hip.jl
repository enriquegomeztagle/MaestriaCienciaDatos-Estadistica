import Pkg
Pkg.add("Distributions")
Pkg.add("HypothesisTests")

using Statistics, HypothesisTests

# Datos
datos = [30, 24, 28, 22, 14, 2, 39, 23, 23, 28, 12, 31]
mu_hipotetica = 15
alpha = 0.05

# Prueba t bilateral
test = OneSampleTTest(datos, mu_hipotetica)

# Obtener estadístico t
t_stat = test.t

# Valor-p unilateral (cola derecha)
p_value = 1 - cdf(TDist(length(datos) - 1), t_stat)

# Resultados
println("Estadístico t: ", round(t_stat, digits=4))
println("Valor-p (unilateral): ", round(p_value, digits=4))

# Conclusión
if p_value < alpha
    println("Se rechaza la hipótesis nula. La media es significativamente mayor a 15 minutos.")
else
    println("No se rechaza la hipótesis nula. No hay suficiente evidencia para decir que la media es mayor a 15 minutos.")
end
