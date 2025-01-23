import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from collections import Counter
from fractions import Fraction

# Datos
datos = [2, 5, 4, 6, 9, 8, 8, 8, 9, 3, 2]

# Media
media = np.mean(datos)

# Mediana
mediana = np.median(datos)

# Moda
conteo = Counter(datos)
moda = max(conteo, key=conteo.get)
frecuencia_moda = conteo[moda]

# Varianza y desviación estándar poblacional
varianza_poblacional = np.var(datos, ddof=0)
desviacion_std_poblacional = np.std(datos, ddof=0)

# Ordenar datos
datos_ordenados = sorted(datos)
n = len(datos)

# Calcular posiciones de los cuartiles
q1_pos = (n + 1) * 0.25
q3_pos = (n + 1) * 0.75

# Función para calcular cuartiles con interpolación
def calcular_cuartil(pos, datos_ordenados):
    if pos.is_integer():
        return datos_ordenados[int(pos) - 1]
    else:
        inferior = datos_ordenados[int(pos) - 1]
        superior = datos_ordenados[int(pos)]
        return inferior + (pos - int(pos)) * (superior - inferior)

# Cuartiles y rango intercuartil
q1 = calcular_cuartil(q1_pos, datos_ordenados)
q3 = calcular_cuartil(q3_pos, datos_ordenados)
rango_intercuartil = q3 - q1

# Rango
rango = max(datos) - min(datos)

# Percentiles (25, 50, 75)
percentiles = np.percentile(datos, [25, 50, 75], method="nearest")

# Tabla de frecuencia
frecuencias = [datos.count(x) for x in np.unique(datos)]
frecuencia_absoluta_acumulada = np.cumsum(frecuencias)
frecuencia_relativa = [Fraction(freq, n).limit_denominator() for freq in frecuencias]
frecuencia_relativa_acumulada = [sum(frecuencia_relativa[:i + 1]) for i in range(len(frecuencia_relativa))]
frecuencia_porcentaje = [float(freq) * 100 for freq in frecuencia_relativa]
frecuencia_acumulada_porcentaje = np.cumsum(frecuencia_porcentaje)

tabla_frecuencia = pd.DataFrame({
    "Número": np.unique(datos),
    "Frecuencia Absoluta": frecuencias,
    "Frecuencia Absoluta Acumulada": frecuencia_absoluta_acumulada,
    "Frecuencia Relativa": frecuencia_relativa,
    "Frecuencia Relativa Acumulada": frecuencia_relativa_acumulada,
    "Frecuencia en Porcentaje": frecuencia_porcentaje,
    "Frecuencia Acumulada en Porcentaje": frecuencia_acumulada_porcentaje
})

# Resultados
print(f"Media: {media}")
print(f"Mediana: {mediana}")
print(f"Moda: {moda} (Frecuencia: {frecuencia_moda})")
print(f"Varianza poblacional: {varianza_poblacional}")
print(f"Desviación estándar poblacional: {desviacion_std_poblacional}")
print(f"Rango: {rango}")
print(f"Q1 (Percentil 25%): {q1}")
print(f"Q3 (Percentil 75%): {q3}")
print(f"Rango intercuartil (IQR): {rango_intercuartil}")
print(f"Percentiles (25%, 50%, 75%): {percentiles}")

print("\nTabla de frecuencia:")
print(tabla_frecuencia)

# Histograma
plt.hist(datos, bins=range(min(datos), max(datos) + 2), alpha=0.75, edgecolor="black")
plt.title("Histograma")
plt.xlabel("Valores")
plt.ylabel("Frecuencia")
plt.grid(axis="y", linestyle="--", alpha=0.7)
plt.show()
