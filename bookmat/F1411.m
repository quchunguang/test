q=[0 10];
r=[0 0];
line(q,r)

axis off
hold on

q=[1 1];
r=[-5 5];
line(q,r)

q=[9 9];
r=[-8 8];
line(q,r)

x=1:.02:9;
y=4-(0.4).*(x-1).*(x-1)+0.055.*(x-1).*(x-1).*(x-1);
plot(x,y,'linewidth',1.5);

x=1:.02:9;
y=-4+(0.4).*(x-1).*(x-1)-0.055.*(x-1).*(x-1).*(x-1);
plot(x,y,'linewidth',1.5);

x=1:.005:9;
y=4-(0.4).*(x-1).*(x-1)+0.055.*(x-1).*(x-1).*(x-1);
y1=y.*cos(1.5.*x.*x);
plot(x,y1,'linewidth',1.5);

text(9.8,-.5,'k','fontsize',20)
text(0.5,-6,'k=a','fontsize',20)
text(8.5,-8.5,'k=b','fontsize',20)

text(1.5,5,'G(k)','fontsize',20)
text(5,7,'G(k)cos[t  (k)]','fontsize',20)
text(5.1,7,'              f','fontname','symbol','fontweight','bold','fontsize',20)

hold off