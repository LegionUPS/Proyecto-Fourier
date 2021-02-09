%% Integral de Fourier a trozos
clc
clear all
fx=input('Ingrese el primer extremo de la f(x)= ','s'); %Primera Función f(x)
fx1=input('Ingrese el segundo extremo de la f(x)= ','s'); %Segunda Función f(x)
L=double(input('Ingrese el periodo= ')); %Periodo
% fx='0'; %Datos de ejemplo
% fx1='1';
% L=double(2);
L1=double(0); %Extremos de cada Intevalo
L2=double(inf);
L3=double(-inf);
syms x n x1 x2 xi w
fx=str2sym(fx);
fx1=str2sym(fx1);
y(x)=fx
y1(x)=fx1
%% Coeficientes 
aw=int(fx*cos(w*x),L3,L1)+int(fx1*cos(w*x),L1,L)+int(fx*cos(w*x),L,L2)
bw=int(fx*sin(w*x),L3,L1)+int(fx1*sin(w*x),L1,L)+int(fx*sin(w*x),L,L2)

%% GRAFICA <>
x=-L:0.01:2*L; %Intervalos
xi=-L:0.01:L1;
x1=L1:0.01:L;
x2=L:0.01:2*L;
plot(xi, y(xi), 'r', x1, y1(x1), 'r', x2, y(x2), 'r'); % Grafica de f(x)
grid on
hold on
IF=1/pi*int(aw*cos(w*x)+bw*sin(w*x),w,0,inf);% Integral de Fourier
plot(x,IF, '-ob') %Grafica de la Integral de Fourier