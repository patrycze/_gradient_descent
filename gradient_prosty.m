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
%f = func(4,4)
syms x
syms y
syms a
i = 2;
syms pocz;
pocz = [-3; 3]
% punkt pocz¹tkowy
%d1 = [1, 0; 0, 1]
%while func(pocz(1,i), pocz(2,i)) <= func(pocz(1,i-1), pocz(2,i-1))
%d1 = [1;0];
%d2 = [0;1];
%%% minimalizajca w kierunku d z wykladu
krok = 1
% obliczanie pochodnej po y 
py = diff(func,y)
% obliczanie pochodnej po x 
px = diff(func,x)
syms temp;
syms temp1;
gradient = [px;py]

%obliczanie normy euklidesowej 
dlugosc_gradientu = size(gradient);
dlugosc_gradientu(2)
gradient(1,1)^2
temp = 0
temp1 = 0
for i = 1:dlugosc_gradientu-1
    temp = temp + gradient(1,i)^2;
    temp1 = temp1 + gradient(2,i)^2;
end 
temp = sqrt(temp);
temp1 = sqrt(temp1);
norma = [temp;temp1];
alfa(1,1) = krok/norma(1,1);
alfa(2,1) = krok/norma(2,1);

pocz
alfa
gradient

raoko = pocz(1) - alfa(1,1) * gradient(1,1) %% musze pod to podstawiæ x 
raoko2 = pocz(2) - alfa(2,1) * gradient(2,1)

% https://www.youtube.com/watch?v=sXUf5kx2Gi8&t=200s

%f(x,y) = x.^2 + y.^2;
%% obliczanie pochodnej po y 
%py = diff(f,y);
%% obliczanie pochodnej po x 
%px = diff(f,x);
%% wyznaczam kierunek poszukiwañ
%e = -[px,py];

%falfa = func(pocz1(1), pocz1(2));
%% obliczanie pochodnej z funkcji i podzieliæ przez 2 pochodna 

%minf = diff(falfa,a)/diff(a);
%funkcja = matlabFunction(minf); %% konwersja z wektora na 
%x0 = 1;
%alfa = fzero(funkcja,x0);
% ponowanie podstawienie pod pocz1
%pocz1 = pocz(:,i) + alfa * d1(:,i-1);
%pocz = [pocz, pocz1]
%d1 = [d1 pocz1]
%i=i+1;

    %sprawdz czy osi¹gnieto minimum
 %   if(pocz(1,i-1)-pocz(1,i) > e)
        
  %  end
    
%end
%% sprawdz czy osiagnieto minimum