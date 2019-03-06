%% Interpolation
clearvars 
close all

x=[0,1,2,3];
y=[1,3,5,2];

p = polyfit(x,y,3) % p = p(1) x^3 + p(2) x^2 + p(3) x + p(4)

xx=0:0.1:3; % points to plot the polynomial
yy=polyval(p,xx);


figure()
plot(xx,yy,'-b','LineWidth',1)
hold on;
plot(x,y,'o','MarkerFaceColor','green','MarkerSize',8,...
    'MarkerEdgeColor','black','LineWidth',2)
hold off


%% Degree 3 approximation
a=-1;
b=1;
% Define an Inline Function
f=@(x) 1./(1+25*x.^2);
% Approximation points
x=a:0.2:b;
y=f(x);
% More points to represent the original function
xOrig=a:0.01:b;
yOrig=f(xOrig);
figure()
plot(xOrig,yOrig,'-') %original function
hold on;
plot(x,y,'o','MarkerFaceColor','green','MarkerSize',8,...
    'MarkerEdgeColor','black','LineWidth',2) %Approximation points

%Polyfit degree 3 function
p=polyfit(x,y,3);
yy=polyval(p,xOrig);
plot(xOrig,yy,'--b');
title('Degree 3 approximation')
hold off

%% Degree 3 approximation
a=-1;
b=1;
% Define an Inline Function
f=@(x) 1./(1+25*x.^2);
% Approximation points
x=a:0.2:b;
y=f(x);
% More points to represent the original function
xOrig=a:0.01:b;
yOrig=f(xOrig);
figure()
plot(xOrig,yOrig,'-') %original function
hold on;
plot(x,y,'o','MarkerFaceColor','green','MarkerSize',8,...
    'MarkerEdgeColor','black','LineWidth',2) %Approximation points

%Polyfit degree 7 function
p=polyfit(x,y,7)
yy=polyval(p,xOrig);
plot(xOrig,yy,'--b');
title('Degree 7 approximation')
hold off

%% 1D Polygonal approximation
a=-1;
b=1;
% Define an Inline Function
f=@(x) 1./(1+25*x.^2);
% Approximation points
xp=a:0.1:b;
yp=f(xp);
% More points to represent the original function
xOrig=a:0.01:b;
yOrig=f(xOrig);
figure()
plot(xOrig,yOrig,'--m') %original function
hold on;
plot(xp,yp,'o','MarkerFaceColor','green','MarkerSize',8,...
    'MarkerEdgeColor','black','LineWidth',2) %Approximation points
yy=interp1(xp,yp,xOrig);
plot(xOrig,yy,'-b')
title('1D polygonal approximation')
hold off

%% 1D Spline approximation
a=-1;
b=1;
% Define an Inline Function
f=@(x) 1./(1+25*x.^2);
% Approximation points
xp=a:0.1:b;
yp=f(xp);
% More points to represent the original function
xOrig=a:0.01:b;
yOrig=f(xOrig);
figure()
plot(xOrig,yOrig,'--m') %original function
hold on;
plot(xp,yp,'o','MarkerFaceColor','green','MarkerSize',8,...
    'MarkerEdgeColor','black','LineWidth',2) %Approximation points
yy=spline(xp,yp,xOrig);
plot(xOrig,yy,'-b')
title('1D spline approximation')
hold off

