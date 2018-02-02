clc
clear
x0=[0 3 5 7 9 11 12 13 14 15];
y0=[0 1.2 1.7 2.0 2.1 2.0 1.8 1.2 1.0 1.6];
x=0:0.1:15;
%y1=Lagrange(x0,y0,x);
y2=interp1(x0,y0,x);
y3=interp1(x0,y0,x,'spline');
pp1=csape(x0,y0);
y4=ppval(pp1,x);
pp2=csape(x0,y0,'second');
y5=ppval(pp2,x);
xianshi=[x',y2',y3',y4',y5'];

%subplot(2,2,1),plot(x0,y0,'+',x,y1),title('lagrange')
subplot(2,2,2),plot(x0,y0,'+',x,y2),title('piecewise linear')
subplot(2,2,3),plot(x0,y0,'+',x,y3),title('spline1')
subplot(2,2,4),plot(x0,y0,'+',x,y4),title('spline2')
dyx0=ppval(fnder(pp1),x0(1))%求x=0的导数
ytemp=y3(131:151);
index=find(ytemp==min(ytemp));
xymin=[x(130+index),ytemp(index)];