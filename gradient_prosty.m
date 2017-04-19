clc
close
clear
tic

xp = -5;
xk = 5;
yp = -5;
yk = 5;
e = 0.001
func = @(x,y) x.^2 + y.^2
[x,y] = meshgrid([xp:1:xk],[yp:1:yk]);
z = @(x,y)  x.^2 + y.^2
subplot(2,1,1)
mesh(x,y,z(x,y)) %surf, surfl, plot3

colormap(hot)  %zmiana koloru
subplot(2,1,2)

contour(x,y,z(x,y))
title('Metoda Wspó³czynników')

%% obliczanie wartosci funkcji celu
f = func(4,4)
wsp = 0.9 % wspó³czynnik redukcji kroku
syms x
syms y
syms a
i = 2;
pocz = [-3;3];
pocz = [pocz, pocz]
% punkt pocz¹tkowy
d1 = [1, 0; 0, 1]
while(px ~= 0 & py ~= 0)
if func(pocz(1,i), pocz(2,i)) <= func(pocz(1,i-1), pocz(2,i-1))
%d1 = [1;0];
%d2 = [0;1];
%%% minimalizajca w kierunku d z wykladu

 pocz1 = pocz(:,i) + a * d1(:,i-1) %% musze to podstawiæ pod funkcje

%f(x,y) = x.^2 + y.^2;
%% obliczanie pochodnej po y 
py = diff(f,y);
%% obliczanie pochodnej po x 
px = diff(f,x);
%% wyznaczam kierunek poszukiwañ
e = -[px,py];

falfa = func(pocz1(1), pocz1(2));
%% obliczanie pochodnej z funkcji i podzieliæ przez 2 pochodna 

minf = diff(falfa,a)/diff(a);
funkcja = matlabFunction(minf); %% konwersja z wektora na 
x0 = 1;
alfa = fzero(funkcja,x0);
% ponowanie podstawienie pod pocz1
pocz1 = pocz(:,i) + alfa * d1(:,i-1);
pocz = [pocz, pocz1]
d1 = [d1 pocz1]
i=i+1;
else
    %sprawdz czy osi¹gnieto minimum)
    if(pocz(1,i-1)-pocz(1,i) > e)
        
    end
    
end
%% sprawdz czy osiagnieto minimum