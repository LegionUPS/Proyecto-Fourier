
%% Serie de Fourier a trozos
clc
clear all
fx=input('Ingrese el primer extremo de f(x)= ','s'); %Primer extremo de la función
fx1=input('Ingrese el segundo extremo de f(x)= ','s'); %Segundo extremo de la función
L=double(input('Ingrese el periodo= ')); %Periodo
Lm=double(0);
syms x n x1 x2
fx=str2sym(fx);
fx1=str2sym(fx1);
y(x)=fx
y1(x)=fx1
%% Coeficientes
a0=1/L*(int(fx,-L,Lm)+int(fx1,Lm,L))
an=1/L*(int(fx*cos((n*pi*x)/L),-L,Lm)+int(fx1*cos((n*pi*x)/L),Lm,L))
bn=1/L*(int(fx*sin((n*pi*x)/L),-L,Lm)+int(fx1*sin((n*pi*x)/L),Lm,L))

%% GRAFICA <>
x=-L:0.01:L;     %Intervalos
x1=-L:0.01:Lm;
x2=Lm:0.01:L;
plot(x1, y(x1), 'r', x2, y1(x2), 'r'); %Grafica la Función
grid on
hold on
k=double(input('Ingrese el numero de componentes: ')) %Numero de componentes
SF=zeros(1, length(x));
for i=1:k
A0=subs(a0,n,i);
An=subs(an,n,i);
Bn=subs(bn,n,i);
SF=SF+An*cos((i*pi*x)/L)+Bn*sin((i*pi*x)/L); %Sumatoria de la función F(x)
X=A0/2+SF; % Serie de Fourier
end
plot(x,X) %Grafica la Serie de Fourier