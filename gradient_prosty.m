function [i,pocz, rozwiazanie] = gradient_prosty(funcj, xp, xk, yp, yk, px,py)

func = str2func(['@(x,y)',funcj]);

tic

%xp = -2;
%xk = 2;
%yp = -1;
%yk = 3;

func = @(x,y) x.*((e.^(-a1.*x)-e.^(-a2.*x))-(e.^(-x)-(e.^(-10*x))))

%func = @(x,y) 2.*x.^2 + y.^2 + x - y;
%func = @(x,y) x.^2 + y.^2;
%func = @(x,y) 100*(y-x.^2).^2+(1-x).^2
%func = @(x,y) -cos(x).*cos(y).*(exp(-((x-pi).^2+(y-pi).^2)))
z = func;              
[x,y] = meshgrid([xp:0.1:xk],[yp:0.1:yk]);
%z = @(x,y)  2.*x.^2 + y.^2 + x - y;
%z = @(x,y) x.^2 + y.^2
%z = @(x,y) 100*(y-x.^2).^2+(1-x).^2
%z = @(x,y) -cos(x).*cos(y).*(exp(-((x-pi).^2+(y-pi).^2)))
%subplot(2,1,1);
%mesh(x,y,z(x,y)); %surf, surfl, plot3

%colormap(hot) ; %zmiana koloru
%subplot(2,1,2);

%contour(x,y,z(x,y));
%title('Metoda Wspó³czynników')

%% obliczanie wartosci funkcji celu


syms a;
%syms pocz;

pocz = [px; py]

%pomoc gradient 
wektortestowy = []
% obliczanie pochodnej po y 
syms temp;
syms temp1;
temp = 0;
temp1 = 0;
norma = []
alfa = []
krok = 0.7;
i = 1;
func(pocz(1,i),pocz(2,i))
%py = diff(func,y);
% obliczanie pochodnej po x 
%px = diff(func,x);
syms x;
syms y;
gradient = []
%gradient = [px;py];
%obliczanie normy euklidesowej 
%gradient = matlabFunction(gradient);
%abs(gradF(func,pocz(1,i),pocz(2,i)))
%while(abs(gradF(func,pocz(1,i),pocz(2,i))) > 0.001)
while(krok > 0.001)
[X, Y] = gradF(func,pocz(1,i),pocz(2,i));
nablaT = [X,Y];
nabla = [X,Y].';

alfa = [krok/sqrt(nablaT*nabla)];

rozwiazanie = pocz(:,i) - (alfa * nabla);
func(rozwiazanie(1),rozwiazanie(2));

  
if(func(rozwiazanie(1),rozwiazanie(2))>func(pocz(1,i),pocz(2,i)))
        
  x = pocz(1,i)+krok;
  y = pocz(2,i);
  wektortestowy = [wektortestowy; func(x,y), pocz(1,i)+krok, pocz(2,i)];
  
  x = pocz(1,i);
  y = pocz(2,i) + krok;
  %f3 = func(x,y);
  wektortestowy = [wektortestowy; func(x,y), pocz(1,i), pocz(2,i)+krok];
  
  x = pocz(1,i)-krok;
  y = pocz(2,i);
  %f4= func(x, y);
  wektortestowy = [wektortestowy; func(x,y), pocz(1,i)-krok, pocz(2,i)];
  
  x = pocz(1,i);
  y = pocz(2,i)-krok;
  %f5 = func(x, y);
  wektortestowy = [wektortestowy; func(x,y), pocz(1,i), pocz(2,i)-krok];
  
  % NIBY NA SKOS %%%%na poludniowy zachod%%%%%%%%%%%%%%%%%%%%%
  
  x = pocz(1,i)+krok;
  y = pocz(2,i)-krok;
  %f6 = func(x, y);
  wektortestowy = [wektortestowy; func(x,y), pocz(1,i)+krok, pocz(2,i)-krok];
  
  %%%%%%skos na polnocny zachod%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  
  x = pocz(1,i)+krok;
  y = pocz(2,i)+krok;
  %f7 = func(x, y);
  wektortestowy = [wektortestowy; func(x,y), pocz(1,i)+krok, pocz(2,i)+krok];
  
  x = pocz(1,i)-krok;
  y = pocz(2,i)-krok;
  %f8 = func(x, y);
  wektortestowy = [wektortestowy; func(x,y), pocz(1,i)-krok, pocz(2,i)-krok];
  
  %%%%%%%%%%%%%%po³nocny wschod %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  x = pocz(1,i)-krok;
  y = pocz(2,i)+krok;
  %f9 = func(x, y);
  wektortestowy = [wektortestowy; func(x,y), pocz(1,i)-krok, pocz(2,i)+krok];

  
  %%%% dla ostatniej funkcji dodatni 2 razy krok

  
  x = pocz(1,i)+20*krok;
  y = pocz(2,i);
  %f9 = func(x, y);
  wektortestowy = [wektortestowy; func(x,y), pocz(1,i)+20*krok, pocz(2,i)];


 
  minn = min(wektortestowy(2:end,1)); % wartosc najmniejsza z 1 kolumny macierzy
  func(pocz(1,i),pocz(2,i))
  
  %if(minn < func(pocz(1,i),pocz(2,i)))
     
  if(minn == wektortestowy(2,1))
      if (~strcmp(num2str(wektortestowy(2,[2 3])),num2str(wektortestowy(1,[2 3]))))
      pocz(1,i) = pocz(1,i)+krok;
      pocz(2,i) = pocz(2,i);
      %f1=f2;
      wektortestowy = wektortestowy(2,:); % czyszczenie macierzy i przypisanie miejca i-1
      end
      
  elseif(minn == wektortestowy(3,1))
      if (~strcmp(num2str(wektortestowy(3,[2 3])),num2str(wektortestowy(1,[2 3]))))
      pocz(1,i) = pocz(1,i);
      pocz(2,i) = pocz(2,i)+krok;
      wektortestowy = wektortestowy(3,:);
      end
      
      
  elseif(minn == wektortestowy(4,1))
      if (~strcmp(num2str(wektortestowy(4,[2 3])),num2str(wektortestowy(1,[2 3]))))
      pocz(1,i) = pocz(1,i)-krok;
      pocz(2,i) = pocz(2,i);
      %f1=f4;
      wektortestowy = wektortestowy(4,:);
      end
  elseif(minn == wektortestowy(5,1))
      if (~strcmp(num2str(wektortestowy(5,[2 3])),num2str(wektortestowy(1,[2 3]))))
      pocz(1,i) = pocz(1,i);
      pocz(2,i) = pocz(2,i) - krok;
      %f1=f5;
      wektortestowy = wektortestowy(5,:);
      end
  elseif(minn == wektortestowy(6,1))
      if (~strcmp(num2str(wektortestowy(6,[2 3])),num2str(wektortestowy(1,[2 3]))))
      %pocz(1,i) = pocz(1,i)+krok;
      %pocz(2,i) = pocz(2,i)-krok;
      %f1=f5;
      wektortestowy = wektortestowy(6,:); 
      end
     elseif(minn == wektortestowy(7,1))
      if (~strcmp(num2str(wektortestowy(7,[2 3])),num2str(wektortestowy(1,[2 3]))))
      pocz(1,i) = pocz(1,i)+ krok;
      pocz(2,i) = pocz(2,i)+krok;
      wektortestowy = wektortestowy(7,:); 
      end
       elseif(minn == wektortestowy(8,1))
      if (~strcmp(num2str(wektortestowy(8,[2 3])),num2str(wektortestowy(1,[2 3]))))
      pocz(1,i) = pocz(1,i)- krok;
      pocz(2,i) = pocz(2,i)-krok;
      wektortestowy = wektortestowy(8,:); 
      end
     elseif(minn == wektortestowy(9,1))
      if (~strcmp(num2str(wektortestowy(9,[2 3])),num2str(wektortestowy(1,[2 3]))))
      pocz(1,i) = pocz(1,i)- krok;
      pocz(2,i) = pocz(2,i)+krok;
      wektortestowy = wektortestowy(9,:); 
      end
     elseif(minn == wektortestowy(10,1))
      if (~strcmp(num2str(wektortestowy(10,[2 3])),num2str(wektortestowy(1,[2 3]))))
      pocz(1,i) = pocz(1,i)+20*krok;
      pocz(2,i) = pocz(2,i);
      wektortestowy = wektortestowy(10,:); 
      end
  end
    pocz =[pocz [wektortestowy(2);wektortestowy(3)]]; 
    i = i+1;
    krok = krok/2
    continue
end

if(func(pocz(1,i),pocz(2,i)) == 0)
   pocz = [pocz [pocz(1,i)+20*krok;pocz(1,i)+20*krok]];
   i = i+1;
else
    pocz =[pocz rozwiazanie];
    i = i+1;
end

end
%pocz = rozwiazanie
rozwiazanie = func(pocz(1,i), pocz(2,i))


end
%rozwiazane = func(rozwiazanie(1),rozwiazanie(2));

% for i=1:length(pocz)-1
%     line([pocz(1,i),pocz(1,i+1)],[pocz(2,i),pocz(2,i+1)])
% end
%  