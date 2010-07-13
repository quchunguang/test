x=(0:1/200:3);
y=tanh(x);
plot(x,y,'linewidth',1.5)
axis([0 3.5 -1 1.5])
axis off
hold on

x=(0:1/200:3);
y=-0.50*x;
plot(x,y,'linestyle','--')

x=(0:1/200:3);
y=x;
plot(x,y,'linestyle','--')

x=(0:1/200:3);
y=2.0*x;
plot(x,y,'linestyle','--')

x=(0:1/200:3);
y=0.50*x;
plot(x,y,'linestyle','--')

q=[0 0];
r=[-1 1.25];
line(q,r,'linewidth',1.5)

q=[0 3];
r=[1 1];
line(q,r,'linestyle','--')

q=[0 3];
r=[0 0];
line(q,r,'linewidth',1.5)

text(-.1,1,'1')

rdot=sprintf('%c',183)
text(1.89,0.96,rdot,'fontname','symbol','fontweight','bold','fontsize',15)

rsq=sprintf('%c',214);
text(3.05,0,rsq,'fontname','symbol','fontweight','bold')
text(3.1,0,'s L')
text(3.1,0.1,'_')

text(2.5,0.8,'z=tanh  s L')
text(2.77,0.8,rsq,'fontname','symbol','fontweight','bold')
text(2.82,0.9,'_')

text(0.2,1.2,'-1<hL<0')
text(1.3,1.2,'hL=-1')
text(2.2,1.3,'hL<-1')
text(1.1,-0.5,'h>0 (physical)')

hold off










