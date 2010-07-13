x=(-2:1/200:2);
y=exp(-x.*x);
plot(x,y,'linewidth',1.5)
axis off
hold on

x=(-1:1/800:1);
y=4*exp(-20.*x.*x);
plot(x,y,'linewidth',1.5)

q=[0 0];
r=[0 4.2];
line(q,r,'linestyle','--')


q=[-2.1 2.1];
r=[0 0];
line(q,r,'linewidth',1.5)

text(0.3,3.5,'kt=1/10','fontsize',20)
text(1,0.75,'kt=2','fontsize',20)
text(-1.8,4.5,'p','fontname','symbol','fontweight','bold','fontsize',20)
text(-2,4.5,'(4  kt)     exp[-(x-x)  /4kt]','fontsize',20)
text(-1.55,4.6,'   -1/2                      2','fontsize',15)
text(-.6,4.75,'    _','fontsize',20)

text(2.2,0,'x','fontsize',20)
text(-.2,-.2,'x=x','fontsize',20)
text(0.05,0.01,'_','fontsize',20)







hold off










