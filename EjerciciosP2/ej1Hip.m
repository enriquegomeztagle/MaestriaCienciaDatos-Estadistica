% Datos
media_poblacional = 16;
media_muestral = 16.017;
sigma = 0.15;
n = 50;
alpha = 0.05;

% Estadístico Z
z = (media_muestral - media_poblacional) / (sigma / sqrt(n));

% Valor-p para prueba bilateral
p_value = 2 * (1 - normcdf(abs(z), 0, 1));

% Resultado
fprintf('Estadístico Z: %.4f\n', z);
fprintf('Valor-p: %.4f\n', p_value);

% Conclusión
if p_value < alpha
    fprintf('Se rechaza la hipótesis nula. La evidencia sugiere que la media es diferente de 16 onzas.\n');
else
    fprintf('No se rechaza la hipótesis nula. No hay suficiente evidencia para decir que la media es diferente de 16 onzas.\n');
end
