clc
close
clear
tic

xp = -5;
xk = 5;
yp = -5;
yk = 5;

func = @(x,y) x.^2 + y.^2;
[x,y] = meshgrid([xp:1:xk],[yp:1:yk]);
z = @(x,y)  x.^2 + y.^2;
subplot(2,1,1);
mesh(x,y,z(x,y)); %surf, surfl, plot3

colormap(hot) ; %zmiana koloru
subplot(2,1,2);

contour(x,y,z(x,y));
title('Metoda Wspó³czynników')

%% obliczanie wartosci funkcji celu
%f = x.^2 + y.^2;
syms x;
syms y;
syms a;
syms pocz;
pocz = [0.1; 1]

%pomoc gradient 

% obliczanie pochodnej po y 
py = diff(func,y);
% obliczanie pochodnej po x 
px = diff(func,x);
syms temp;
syms temp1;
temp = 0;
temp1 = 0;
gradient = [px;py];
norma = []
alfa = []
krok = 1;
i = 1;

funkcja_gradientu = matlabFunction(gradient)
pocz(1,i)
wartosci_gradientu = funkcja_gradientu(pocz(1,i),pocz(2,i))

while(abs(funkcja_gradientu(pocz(1,i),pocz(2,i))) > 0.001)
%obliczanie normy euklidesowej 
dlugosc_gradientu = size(gradient);

%for j = 1:dlugosc_gradientu(2)-1
    temp = temp + gradient(1,1)^2
    temp1 = temp1 + gradient(2,1)^2
%end 
%temp = sqrt(temp)
%temp1 = sqrt(temp1)

norma = [norma [sqrt(temp); sqrt(temp1)]]
alfa = [alfa [krok/norma(1,i); krok/norma(2,i)]]

pocz
alfa
gradient

rozwiazaniex = pocz(1,i) - alfa(1,i) * gradient(1,1) %% musze pod to podstawiæ x 
rozwiazaniey = pocz(2,i) - alfa(2,i) * gradient(2,1) 

funkcjax = matlabFunction(rozwiazaniex);
funkcjay = matlabFunction(rozwiazaniey); %% konwersja z wektora na

pocz =[pocz [funkcjax(pocz(1,i)); funkcjay(pocz(2,i))]]

%dla nowych punktów obliczanie gradientu do sprawdzenia warunku

funkcja_gradientu = matlabFunction(gradient)

% obliczanie pochodnej po y 
px = diff(rozwiazaniex,x);
% obliczanie pochodnej po x 
py = diff(rozwiazaniey,y);

gradient = [px;py];


i = i+1

end

% https://www.youtube.com/watch?v=sXUf5kx2Gi8&t=200s
