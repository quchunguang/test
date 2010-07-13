q=[0 10];
r=[0 0];
line(q,r)

axis([0 9 -5 5])
axis off
hold on

q=[0 0];
r=[-5 5];
line(q,r)

q=[1.57 1.57];
r=[-5 5];
line(q,r,'linestyle','--')

q=[4.715 4.715];
r=[-5 5];
line(q,r,'linestyle','--')

q=[7.86 7.86];
r=[-5 5];
line(q,r,'linestyle','--')

q=[4 4];
r=[0 -5];
line(q,r,'linestyle','--')

x=0:.01:1.57;
y=tan(x);
plot(x,y,'linewidth',1.5);

x=1.58:.01:4.71;
y=tan(x);
plot(x,y,'linewidth',1.5);

x=4.72:.01:7.85;
y=tan(x);
plot(x,y,'linewidth',1.5);

x=0:.01:3.99;
y=-x./sqrt(16-x.*x);
plot(x,y,'linewidth',1.5);

text(2,-5.5,'       L(         )','fontsize',20)
text(2,-5.5,'b=w','fontname','symbol','fontweight','bold','fontsize',20)
text(2,-5.3,'                            1/2','fontsize',15)
text(2,-5.4,'              __ _ __ ','fontsize',15)
text(2,-5.8,'          c    c','fontsize',20)
text(2,-5.75,'                        2         2','fontsize',10)
text(2,-6.05,'                        1         2','fontsize',10)
text(2,-5.4,'          1    1','fontsize',20)

text(9.1,0,'b','fontname','symbol','fontweight','bold','fontsize',20)
text(1.5,0.5,'p/2','fontname','symbol','fontweight','bold','fontsize',20)
text(3.1,0.5,'p','fontname','symbol','fontweight','bold','fontsize',20)
text(4.5,0.5,'3p/2','fontname','symbol','fontweight','bold','fontsize',20)

rdot=sprintf('%c',183)
text(2.4,-.8,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

hold off