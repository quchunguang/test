q=[0 2];
r=[0 0];
line(q,r)

axis([0 2 0 6])
axis off
hold on

q=[0 2];
r=[2.5 2.5];
line(q,r,'linewidth',1.5)

q=[0 0];
r=[0 6];
line(q,r)

q=[1 1];
r=[0 2];
line(q,r,'linestyle','--')

q=[0 1];
r=[2 2];
line(q,r,'linestyle','--')

x=0.01:.01:2;
x1=x.*x;
y=x1+(1./x1);
plot(x,y,'linewidth',1.5);

text(2,-.2,'k','fontsize',20)
text(-.2,6,'R','fontsize',20)
text(.9,-.2,'k  =1','fontsize',20)
text(.9,-.3,'   c','fontsize',15)
text(-.3,2,'R  =2','fontsize',20)
text(-.3,1.9,'    c','fontsize',15)
text(-.3,2.5,'R>R','fontsize',20)
text(-.3,2.4,'          c','fontsize',15)

text(1.8,4.5,'s=0','fontname','symbol','fontweight','bold','fontsize',20)
text(.9,3.25,'s>0','fontname','symbol','fontweight','bold','fontsize',20)
text(1.7,3.5,'      s<0','fontname','symbol','fontweight','bold','fontsize',20)

text(0.7,4.5,'exponential','fontsize',20)
text(0.7,4,'    growth','fontsize',20)

text(1.8,3,'exp','fontsize',20)
text(1.7,2.7,' decay','fontsize',20)

rdot=sprintf('%c',183)
text(0.975,2,rdot,'fontname','symbol','fontweight','bold','fontsize',20)



hold off