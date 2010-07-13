q=[0 2];
r=[0 0];
line(q,r)

axis([0 2 -4 2])
axis off
hold on

q=[0 0];
r=[-4 2];
line(q,r)

r=2;
x=0:.01:2;
x1=x.*x;
y=-1+r.*x1-x1.*x1;
plot(x,y,'linewidth',1.5);

r=2.8;
x=0:.01:2;
x1=x.*x;
y=-1+r.*x1-x1.*x1;
plot(x,y,'linewidth',1.5);

r=1.2;
x=0:.01:2;
x1=x.*x;
y=-1+r.*x1-x1.*x1;
plot(x,y,'linewidth',1.5);

text(2,-.2,'k','fontsize',20)
text(-.2,2,'s','fontsize',20,'fontname','symbol','fontweight','bold')

text(.98,.3,'k','fontsize',20)
text(.98,.2,'   c','fontsize',15)

text(1.45,-2,'R=R','fontsize',20)
text(1.45,-2.1,'          c','fontsize',15)

text(1.75,-1,'R>R','fontsize',20)
text(1.75,-1.1,'          c','fontsize',15)

text(1.05,-2,'R<R','fontsize',20)
text(1.05,-2.1,'          c','fontsize',15)

text(0.2,2,'growth rate','fontsize',20)

rdot=sprintf('%c',183)
text(1,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

hold off