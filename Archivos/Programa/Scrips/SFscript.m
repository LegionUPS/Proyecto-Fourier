%% Serie de Fourier
clc  %Limpia la pantalla.
clear all %Limpia el workspace.
fx=input('Ingrese la f(x)= ','s'); % La función f(x) como texto
L=double(input('Ingrese el periodo= ')); %El periodo
syms x n %Define las variables
fx=str2sym(fx) %Transforta el texto ingresado como función a una función simbolica.
%% Funciones par o impar
y(x)=fx;
if y(-x) == y(x) % Analiza si la función es par para la resolución de los                 
    disp('par')  % coeficientes
    a0=1/L*int(fx,-L,L) % Coeficiente ao
    an=1/L*int(fx*cos((n*pi*x)/L),-L,L) % Coeficiente an
    bn=0 % Coeficiente bn
    
elseif y(-x) == -y(x) % Analiza si la función es impar
    disp('impar')
    a0=0
    an=0
    bn=1/L*int(fx*sin((n*pi*x)/L),-L,L)
    
else % Analiza si la función no es ´par ni impar
    disp('No es par ni impar') 
    a0=1/L*int(fx,-L,L)
    an=1/L*int(fx*cos((n*pi*x)/L),-L,L)
    bn=1/L*int(fx*sin((n*pi*x)/L),-L,L)

end

%% GRAFICA
x=-L:0.01:L; % Intervalo en x
plot(x,y(x)) % Grafica y(x)
grid on
hold on
k=double(input('Ingrese el numero de componentes: ')) % Ingresa el numero de 
SF=zeros(1, length(x)); %crea un vector de ceros
for i=1:k
A0=subs(a0,n,i);  %Cambia la variable n por i
An=subs(an,n,i);
Bn=subs(bn,n,i);
SF=SF+An*cos((i*pi*x)/L)+Bn*sin((i*pi*x)/L); %Crea una sumatoria, F(x)
X=A0/2+SF; %Serie de Fourier
end
plot(x,X) %Grafica la Serie de Fourier