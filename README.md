1) Este proyecto se asocia al artículo cientifico "Noise Amplitude in Ambient PMU Data and its Impact on Load Models Identification"

2) Todo el análisis se ha realizado en MATLAB.

3) Los archivos de excel son 4 y contienen los datos de 4 PMU. No se pueden presentar los datos de todas las PMU por temas de confidencialidad, ni tampoco los datos completos.

4) El archivo de MATLAB "a1_Analisis_Ruido" contiene la programación para cuantificar el ruido de las PMU. El proceso es iterativo y se debe ir seleccionando los datos que se quieren ocupar, la técnica de filtrado y sus correspondientes parámetros.

5) Los 4 archivos que empiezan con la letra "b", por ejemplo, "b1_resultados_a1", contienen los resultados del ruido calculado para los datos de las 4 PMU.
   Para cada variable de los resultados, la columna "dV_pu" significa la variación de tensión en PU de la señal utilizada para calcular el ruido.
   "e_dV_pu" significa un redondeo de "dV_pu".
   "df_pu" significa la variación de frecuencia en PU de la señal utilizada para calcular el ruido.
   "e_df_pu" significa un redondeo de "df_pu".
   "SNR_dB" es la relación señal ruido (SNR) en decibelios.
