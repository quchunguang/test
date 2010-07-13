q=[-1 127];
r=[0 0];
line(q,r)

axis off
hold on

x=0:.01:125.68;
y1=sin(1.1.*x)-sin(x);
plot(x,y1,'linewidth',1.5);

x=0:.1:125.68;
y2=2.*sin(0.05.*x);
plot(x,y2,'linestyle','--');

x=0:.1:125.68;
y2=-2.*sin(0.05.*x);
plot(x,y2,'linestyle','--');


text(-5,2.2,'phase','fontsize',15)
text(-5,1.8,'velocity','fontsize',15)
text(-5,1.4,'=   /k','fontsize',15)
text(-5,1.4,'   w','fontname','symbol','fontweight','bold','fontsize',15)


text(115,2.2,'group','fontsize',15)
text(115,1.8,'velocity','fontsize',15)
text(115,1.4,'= d  /dk','fontsize',15)
text(115,1.4,'     w','fontname','symbol','fontweight','bold','fontsize',15)

right=sprintf('%c',174);
text(102,1.9,right,'fontname','symbol','fontweight','bold','fontsize',15)
text(36.5,1.5,right,'fontname','symbol','fontweight','bold','fontsize',15)

hold off