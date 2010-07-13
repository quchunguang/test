q=[-11 1];
r=[-1 -1];
line(q,r)

axis off
hold on


q=[-3.2 -3.2];
r=[-1 -10];
line(q,r,'linestyle','--')



x=-11:.02:-.5;
y=-200.*x.*x./(100+x.*x.*x.*x)+3.*exp(-x.*x./2);
plot(x,y,'linewidth',1.5);

text(-8,1,'F (  )','fontsize',20)
text(-8,1,'    x','fontname','symbol','fontweight','bold','fontsize',20)

text(-3.4,-.3,'x','fontname','symbol','fontweight','bold','fontsize',20)
text(-3.4,-.4,'  c','fontsize',20)

text(1,-1,'x','fontname','symbol','fontweight','bold','fontsize',20)

rprime=sprintf('%c',162)
text(-7.5,1.1,rprime,'fontname','symbol','fontweight','bold','fontsize',20)


rdot=sprintf('%c',183)
text(-3.3,-10,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

hold off