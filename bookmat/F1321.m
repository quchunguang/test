q=[-2 5];
r=[0 0];
line(q,r)

axis off
hold on


q=[0 0];
r=[0 4];
line(q,r,'linestyle','--')

q=[-1.5 3];
r=[4 4];
line(q,r,'linestyle','--')

q=[-1.5 2];
r=[2.5 6];
line(q,r,'linestyle','--')

x=-1.5:.02:3;
y=4+x-0.5.*x.*x+x.*x.*x./6;
plot(x,y,'linewidth',1.5);

x=-1.5:.02:3;
y=4+x-0.5.*x.*x;
plot(x,y,'linestyle','--');

rprime=sprintf('%c',162)

text(3.1,4,'f(x  )','fontsize',20)
text(3.1,3.9,'      0','fontsize',15)

text(3.1,7,'f(x)','fontsize',20)

text(0,6.5,'f(x  )+  xf (x  )','fontsize',20)
text(0,6.4,'      0                 0','fontsize',15)
text(1.27,6.5,rprime,'fontname','symbol','fontweight','bold','fontsize',20)
text(0,6.5,'         D','fontname','symbol','fontweight','bold','fontsize',20)

text(-1,5,'D','fontname','symbol','fontweight','bold','fontsize',20)
text(-1,5,'  x=x-x','fontsize',20)
text(-1,4.9,'               0','fontsize',15)

text(0.5,2.1,'                                            2','fontsize',15)
text(0.5,2,'f(x  )+  xf (x  )+  (  x)  f (x  )','fontsize',20)
text(0.5,1.9,'      0                 0                           0','fontsize',15)
text(1.75,2,rprime,'fontname','symbol','fontweight','bold','fontsize',20)
text(3.52,2,rprime,'fontname','symbol','fontweight','bold','fontsize',20)
text(3.57,2,rprime,'fontname','symbol','fontweight','bold','fontsize',20)
text(0.5,2,'         D               D','fontname','symbol','fontweight','bold','fontsize',20)
text(2.5,2.1,' 1','fontsize',15)
text(2.5,2.1,' _','fontsize',15)
text(2.5,1.8,' 2','fontsize',15)

text(-.05,-0.3,'x','fontsize',20)
text(-.05,-0.4,'   0','fontsize',15)



rdot=sprintf('%c',183)
text(-0.04,4,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

hold off