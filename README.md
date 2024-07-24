1) Este proyecto se asocia al artículo cientifico "Noise Amplitude in Ambient PMU Data and its Impact on Load Models Identification"

2) Todo el análisis se ha realizado en MATLAB.

3) Los archivos de excel son 13 y contienen los datos de las 13 PMU utilizadas en el artículo cientifico.
   
5) El archivo de MATLAB "a1_Analisis_Ruido" contiene la programación para cuantificar el ruido de las PMU. El proceso es iterativo y se debe ir seleccionando los datos que se quieren ocupar, la técnica de filtrado y sus correspondientes parámetros.

6) Los 13 archivos que empiezan con la letra "b", por ejemplo, "b1_resultados_PMU_1", contienen los resultados del ruido calculado para los datos de las 13 PMU.
   Para cada variable de los resultados, la columna "dV_pu" significa la variación de tensión en PU (por unidad) de la señal utilizada para calcular el ruido.
   "e_dV_pu" significa un redondeo de "dV_pu".
   "df_pu" significa la variación de frecuencia en PU de la señal utilizada para calcular el ruido.
   "e_df_pu" significa un redondeo de "df_pu".
   Se utiliza una lógica similar para la corriente (I), potencia activa (P) y potencia reactiva (Q).
   "SNR_dB" es la relación señal ruido (SNR) en decibelios.
