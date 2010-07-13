n=1
m=2
x=0:0.01:1;
y=0:0.01:1;
[X,Y]=meshgrid(x,y);
U=sin(n.*pi.*X).*sin(m.*pi.*Y);
subplot(1,2,1), meshc(x,y,U)
text(0,.9,1.1,'n=1','fontsize',20)
text(0,.9,0.90,'m=2','fontsize',20)

text(0.5,-.375,-1,'x/L','fontsize',15)
text(-.5,0.5,-1,'y/H','fontsize',15)


n=2
m=1
x=0:0.01:1;
y=0:0.01:1;
[X,Y]=meshgrid(x,y);
U=sin(n.*pi.*X).*sin(m.*pi.*Y);
subplot(1,2,2), meshc(x,y,U)
text(0,.9,1.1,'n=2','fontsize',20)
text(0,.9,0.90,'m=1','fontsize',20)
text(0.5,-.375,-1,'x/L','fontsize',15)
text(-.5,0.5,-1,'y/H','fontsize',15)

