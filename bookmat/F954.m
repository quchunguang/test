

x1=-4.99:0.10:4.99;
y0=50.*(1+erf(x1./(2.*sqrt(0.001))));
y=50.*(1+erf(x1./(2.*sqrt(4))));
y2=50.*(1+erf(x1./(2.*sqrt(8))));
y3=50.*(1+erf(x1./(2.*sqrt(12))));
y4=50.*(1+erf(x1./(2.*sqrt(16))));
subplot(1,2,1), plot(x1,y0,x1,y,x1,y2,x1,y3,x1,y4,'linewidth',1.5)
text(-2,80,'t=0','fontsize',20)
text(1,90,'t=4','fontsize',20)
text(2,60,'t=16','fontsize',20)


x=-4.99:0.10:4.99;
t=0.01:0.16:15.99;
[X,T]=meshgrid(x,t);
U=50.*(1+erf(X./(2.*sqrt(T))));
subplot(1,2,2), meshc(x,t,U)
view(-15,25)


