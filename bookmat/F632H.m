n=1
m=1
x=0:0.01:1;
y=0:0.01:1;
[X,Y]=meshgrid(x,y);
U=1+sin(n.*pi.*X).*sin(m.*pi.*Y);
mesh(x,y,U)
hold on
V=U-1;
contour(x,y,V)
axis([0 1 0 1 0 2])
text(0,.9,2.1,'n=1','fontsize',20)
text(0,.9,1.90,'m=1','fontsize',20)

text(0.5,-.375,0,'x/L','fontsize',15)
text(-.5,0.5,0,'y/H','fontsize',15)

hold off


