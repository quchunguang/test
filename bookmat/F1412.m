q=[0 11];
r=[0 0];
line(q,r)

axis off
hold on

q=[0 7];
r=[7 7];
line(q,r,'linewidth',1.5)

q=[1.9 1.9];
r=[0 7];
line(q,r,'linestyle','--')

q=[5 5];
r=[0 7];
line(q,r,'linestyle','--')

q=[0 0];
r=[0 10];
line(q,r)

x=0:.02:11;
y=200.*x.*x./(100+x.*x.*x.*x)+3.*exp(-x.*x./2);
plot(x,y,'linewidth',1.5);

text(11,-.5,'k','fontsize',20)
text(-.9,10,'  w','fontname','symbol','fontweight','bold','fontsize',20)
text(-.9,10,'d  /dk','fontsize',20)
text(-.9,7,'x/t','fontsize',20)

text(1.7,-.5,'k','fontsize',20)
text(4.8,-.5,'k','fontsize',20)
text(1.7,-.7,'   0','fontsize',15)
text(4.8,-.7,'   0','fontsize',15)

rdot=sprintf('%c',183)
text(4.9,7,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(1.8,7,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

hold off