% Datos
datos = [30, 24, 28, 22, 14, 2, 39, 23, 23, 28, 12, 31];
mu_hipotetica = 15;
alpha = 0.05;

% Tamaño de la muestra y grados de libertad
n = length(datos);
df = n - 1;

% Estadísticos
media_muestral = mean(datos);
desviacion = std(datos); % por defecto, usa n-1
t_stat = (media_muestral - mu_hipotetica) / (desviacion / sqrt(n));

% Valor-p unilateral (cola derecha)
p_value = 1 - tcdf(t_stat, df);

% Resultados
fprintf('Estadístico t: %.4f\n', t_stat);
fprintf('Valor-p (unilateral): %.4f\n', p_value);

% Conclusión
if p_value < alpha
    fprintf('Se rechaza la hipótesis nula. La media es significativamente mayor a 15 minutos.\n');
else
    fprintf('No se rechaza la hipótesis nula. No hay suficiente evidencia para decir que la media es mayor a 15 minutos.\n');
end
