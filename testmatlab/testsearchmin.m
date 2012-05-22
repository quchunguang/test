%% 多元函数的极小值点
%% 从三维等位线图初步观察测试函数
x=-3:0.1:3;y=-2:0.1:4; 
[X,Y]=meshgrid(x,y);
F=100*(Y-X.^2).^2+(1-X).^2;
contour3(X,Y,F,300),
xlabel('x'),ylabel('y'),axis([-3,3,-2,4,0,inf]),view([161,22])
hold on,plot3(1,1,0,'.r','MarkerSize',20),hold off
%% 采用内联函数表示测试函数如下
ff=inline('100*(x(2)-x(1)^2)^2+(1-x(1))^2','x');
%% 用单纯形法求极小值点
x0=[-1.2,1];[sx,sfval,sexit,soutput]=fminsearch(ff,x0)
%% 用拟牛顿法求极小值点
[ux,sfval,uexit,uoutput,grid,hess]=fminunc(ff,x0)