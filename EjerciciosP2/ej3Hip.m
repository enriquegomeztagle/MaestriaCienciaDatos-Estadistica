% Datos
x = 369;
n = 575;
p0 = 0.60;
alpha = 0.04;

% Proporción muestral
p_hat = x / n;

% Estadístico Z
z = (p_hat - p0) / sqrt(p0 * (1 - p0) / n);

% Valor-p (prueba unilateral derecha)
p_value = 1 - normcdf(z, 0, 1);

% Resultados
fprintf('Proporción muestral: %.4f\n', p_hat);
fprintf('Estadístico Z: %.4f\n', z);
fprintf('Valor-p: %.4f\n', p_value);

% Conclusión
if p_value < alpha
    fprintf('Se rechaza H₀: hay evidencia suficiente para concluir que más del 60%% se tropiezan.\n');
else
    fprintf('No se rechaza H₀: no hay evidencia suficiente para concluir que más del 60%% se tropiezan.\n');
end

% Parámetros
z = 2.576;  % Valor Z para un nivel de confianza del 99%
x = 369;
n = 575;
p_hat = x / n;
E = 0.03;  % Margen de error

% Cálculo del tamaño de muestra necesario
n_requerido = (z^2 * p_hat * (1 - p_hat)) / (E^2);

% Resultado
fprintf('Se necesitan al menos %.0f personas para una precisión de ±%.2f con 99%% de confianza.\n', ceil(n_requerido), E);
