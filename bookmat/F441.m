 n=2

x1=0:0.01:0.99;
y=sin(n.*pi.*x1).*cos(n.*pi.*0.0);
y2=sin(n.*pi.*x1).*cos(n.*pi.*0.0625);
y3=sin(n.*pi.*x1).*cos(n.*pi.*0.125);
y4=sin(n.*pi.*x1).*cos(n.*pi.*0.1875);
y5=sin(n.*pi.*x1).*cos(n.*pi.*0.25);
y6=sin(n.*pi.*x1).*cos(n.*pi.*0.3125);
y7=sin(n.*pi.*x1).*cos(n.*pi.*0.375);
y8=sin(n.*pi.*x1).*cos(n.*pi.*0.4325);
y9=sin(n.*pi.*x1).*cos(n.*pi.*0.50);
subplot(1,2,1), plot(x1,y,x1,y2,x1,y3,x1,y4,x1,y5,x1,y6,x1,y7,x1,y8,x1,y9,'linewidth',1.5)
text(.4,1.1,'n=2','fontsize',20)
text(.45,-1.2,'x/L')

x=0:0.01:0.99;
t=0:0.02:1.99;
[X,T]=meshgrid(x,t);
U=sin(n.*pi.*X).*cos(n.*pi.*T);
subplot(1,2,2), mesh(x,t,U)
view(-7,67.5)
text(0.05,2,1,'n=2')
text(.45,-.3,-1,'x/L')
text(-.3,.9,-1,'ct/L')

