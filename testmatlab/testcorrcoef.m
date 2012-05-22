x=[13.2 13 14.9 8.2 7.9 25.3 16.0 16.3 7.5];
y=[23   24  21  20  21  39   30   32   9];
[R,P]=corrcoef(x,y)

A=[1 2 3 4 5 6 7;
2 3.3 4.4 5.5 6.6 7.7 8.8;
0 1 2 3 4 5 6];
[R,P]=corrcoef(A')

X=randn(10000,5);
M=mean(X)
D=std(X)
R=corrcoef(X)

x=0:10;y=sin(x);
xi=0:0.25:10;
%yi=interp1(x,y,xi);
%yi=interp1(x,y,xi,'spline');
yi=interp1(x,y,xi,'pchip');
plot(x,y,'o');
hold on
plot(xi,yi);
hold off
pause;

h=6:2:18;
t=[18,20,22,25,30,28,24;15,19,24,28,34,32,30]';
XI=6.5:2:17.5;
YI=interp1(h,t,XI,'spline')
pause;

x=0:2.5:10;
h=[0:30:60]';
T=[95 14 0 0 0;88 48 32 12 6;67 64 54 48 41];
xi=0:10;
hi=[0:20:60]';
TI=interp2(x,h,T,xi,hi)
[XI,HI] = meshgrid(xi,hi);
surf(XI,HI,TI);