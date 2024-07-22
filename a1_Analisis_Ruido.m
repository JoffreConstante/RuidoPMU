%*********************************************************************
% Script para obtener el ruido (SNR) de las mediciones de la PMU 1 
%*********************************************************************

%% Importación de datos
clear
clc
FPS=25; % Colocar el FPS (Frame per Second) de los datos de la PMU a elegir

datos = readtable('1_Datos_PMU_1.xlsx'); % Elegir los datos de una PMU
datos.tiempo=datos.tiempo-round(datos.tiempo(1));

% Transformación de V y f a por unidad
datos.VA=datos.VA./220;
datos.VB=datos.VB./220;
datos.VC=datos.VC./220;
datos.f=datos.f./50;

%% 1) Detección de datos atipicos
clc
ancho_ventana=250; % Equivalente a 10 segundos


input=datos.VA;
[output,cant_outliers] = fun_quitar_outliers (input,ancho_ventana);
cant_outliers
datos.VA=output;

input=datos.VB;
[output,cant_outliers] = fun_quitar_outliers (input,ancho_ventana);
cant_outliers
datos.VB=output;

input=datos.VC;
[output,cant_outliers] = fun_quitar_outliers (input,ancho_ventana);
cant_outliers
datos.VC=output;

input=datos.f;
[output,cant_outliers] = fun_quitar_outliers (input,ancho_ventana);
cant_outliers
datos.f=output;

clear ancho_ventana cant_outliers input output


%% 2) Filtrado de señales

clc
close all

% Elegir los datos a analizar
%-----------------------
desde=10*25;
hasta=desde+250;

% Elegir la señal de entrada
%-----------------------
input=datos.VA(desde:hasta);

% Elegir la técnica de filtrado y sus parámetros
%-----------------------
% Si la señal tiene un escalon, elegir Savitzky-Golay, caso contrario,
% media móvil. Colocar como comentario la técnica que no se desea ejecutar.

plot(input)
xlabel('Datos')
ylabel('Señal Elegida (V, f, I, P, o Q)')

% Esto es Savitzky-Golay
%x_filtrada=smoothdata(input,'sgolay',5,'Degree',3);

% Esto es Media móvil
x_filtrada=smoothdata(input,'movmean',5);

% Gráfica de señal filtrada
hold on
plot(x_filtrada)
hold off

% Calculo del ruido
ruido=input-x_filtrada;

% Gráfica del ruido
figure
plot(ruido)
xlabel('Datos')
ylabel('Magnitud del Ruido')

media_ruido=mean(ruido)

% El parametro de la técnica de filtrado se debe elegir de manera que la
% media del ruido sea relativamente muy cercana a cero y que en la gráfica
% del ruido la media sea cero a lo largo del tiempo.
% Toda esta sección es un proceso iterativo.

% SNR calculado
SNR_calculado=snr(input,ruido) % Este valor se lo debe ir almacenando para al final calcular los valores medio y máximo.


clear ans desde hasta input x_filtrada ruido media_ruido



%% Función para remover outliers
function [output,cant_outliers] = fun_quitar_outliers (input,ventana_movil)

    TF = isoutlier(input,'movmedian',ventana_movil,'ThresholdFactor',5);
    %length(find(TF==1))
    
    TF1=zeros(length(TF),1);
    for i=1:length(TF)
        if i==1
            if (TF(i)==1) && (TF(i+1)==0)
                TF1(i)=1;
            end
        end
        if i==length(TF)
            if (TF(i)==1) && (TF(i-1)==0)
                TF1(i)=1;
            end
        end
        if (i>1) && (i<length(TF))
            if (TF(i)==1) && (TF(i-1)==0) && (TF(i+1)==0)
                TF1(i)=1;
            end
        end
    end
    TF=logical(TF1);
    cant_outliers=length(find(TF==1));
    %find(TF==1)./FPS;
    clear i TF1
    
    [output] = filloutliers(input,'linear','OutlierLocations',TF);

end

