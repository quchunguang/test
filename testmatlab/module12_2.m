format long;

%% 数值方法绘制3-D数据图
[x1,x2]=meshgrid(0:100:10000);
P1=3390-0.1*x1-0.03*x2;
P2=3990-0.04*x1-0.1*x2;
R=P1.*x1+P2.*x2;
C=400000+1950*x1+2250*x2;
P=R-C;
mesh(x1,x2,P)

%% 解析方法绘制数据图
syms x1 x2
P1=3390-0.1*x1-0.03*x2;

P2=3990-0.04*x1-0.1*x2;
R=P1.*x1+P2.*x2;
C=400000+1950*x1+2250*x2;
P=R-C;
%ezmesh(P,[0,10000],[0,10000])
%ezsurf(P,[0,10000],[0,10000])
ezcontourf(P,[0,10000],[0,10000])

%% 解析方法通过导数求解
Px1=diff(P,'x1')
Px2=diff(P,'x2')
ret = solve(Px1,Px2);
x1 = eval(ret.x1)
x2 = eval(ret.x2)
maxval=eval(P)

%% 数值方法求解极值
v=[0 0];
[x, fval] = fminsearch(@minnerP,v)