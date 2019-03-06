clearvars
close all

f=@(x) 1./(1+25*x.^2);

a=-1;
b=1;
x=a:0.2:b;
y=f(x);
xOrig=a:0.01:b;
yOrig=f(xOrig);
xp=a:0.1:b;
yp=f(xp);

degree=[3,5,7,10];

figure()
for i=1:size(degree,2)
    subplot(3,2,i);
    plot(x,y,'o','Marker','o','LineWidth',2,'MarkerFaceColor','red',...
        'LineWidth',2,'MarkerEdgeColor','black');
    hold on
    plot(xOrig,yOrig,'-r')
    p = polyfit(x,y,degree(i));
    yy = polyval(p,xOrig);
    plot(xOrig,yy,'--b')
    if (degree(i) < 10)
        title(['Degree ',num2str(degree(i)),' approximation']);
    else
        title(['Degree ',num2str(degree(i)),' interpolation']);
    end
    axis([-1,1,-0.2,1])
    hold off
end

% Polygonal
subplot(3,2,5)
plot(xp,yp,'o','Marker','o','LineWidth',2,'MarkerFaceColor','red',...
            'LineWidth',2,'MarkerEdgeColor','black');
hold on
plot(xOrig,yOrig,'-r')
yyp = interp1(xp,yp,xOrig);
plot(xOrig,yyp,'--b')
title('1D polygonal approximation')
hold off

% Spline
subplot(3,2,6)
plot(xp,yp,'o','Marker','o','LineWidth',2,'MarkerFaceColor','red',...
            'LineWidth',2,'MarkerEdgeColor','black');
hold on
plot(xOrig,yOrig,'-r')
yys = spline(xp,yp,xOrig);
plot(xOrig,yys,'--b')
title('1D spline approximation')
hold off

    
    
    