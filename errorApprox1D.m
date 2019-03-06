% Exercise:
% Compute the mean and maximum error between the original 
% curve and their approximation according to the polynomial 
% degree for the measure points x=a:0.2:b and y=f(x). (Use 
% all plotted points, xx=a:0.01:b to compute errors).
clearvars
close all

f=@(x) 1./(1+25*x.^2);

a=-1;
b=1;
x=a:0.2:b;
y=f(x);
xOrig=a:0.01:b;
yOrig=f(xOrig);
numPoints = size(xOrig,2);

degree=[3,5,7,9];

fprintf(1,'%5s%11s%14s\n','DEG.','MEAN.ERR.','MAX.ERR.');
for i=1:size(degree,2)
    p = polyfit(x,y,degree(i));
    yy = polyval(p,xOrig);
    meanErr = sum(abs(yy-yOrig))/numPoints;
    maxErr = max(abs(yy-yOrig));
    fprintf(1,'%3d%14.5E%14.5E\n',degree(i),meanErr,maxErr);
end



    
    
    