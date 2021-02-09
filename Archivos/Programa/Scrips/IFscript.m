%% Integrales de Fourier
clc
clear all
fx=input('Ingrese la f(x)= ','s'); %Función f(x)
L=double(input('Ingrese el periodo= ')); %Periodo
%fx='exp(-abs(x))'; % Datos de ejemplo
%L=double(1);
syms x n w
fx=str2sym(fx)
%% Funciones par o impar y Coeficientes de Fourier
y(x)=fx;
if y(-x) == y(x)
    disp('par')
    aw=1/pi*int(fx*cos(w*x),-L,L) 
    bw=0
    
elseif y(-x) == -y(x)
    disp('impar')
    aw=0
    bw=2/pi*int(fx*sin(w*x),-L,L)
else
    disp('No es par ni impar')
    aw=1/pi*int(fx*cos(w*x),-L,L)
    bw=1/pi*int(fx*sin(w*x),-L,L)

end

%% GRAFICA
x=-L:0.1:L; %Intervalo
plot(x,y(x), 'r') %Grafica de f(x)
grid on
hold on
If=int(aw*cos(w*x)+bw*sin(w*x),w,0,inf) %Integral de Fourier
plot(x,If, '-ob') %Grafica de la integral de Fourier