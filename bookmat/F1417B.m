q=[-3 3];
r=[-2 -2];
line(q,r)

axis off
hold on

q=[0 0];
r=[-2 0];
line(q,r)

q=[0 0];
r=[2 4];
line(q,r)

x=-3:.02:3;
y=4.*sech(1.5.*x).*sech(1.5.*x);
plot(x,y,'linewidth',1.5);


text(-3,4,'f       > f','fontsize',20)
text(-3,3.95,'  max        min','fontsize',15)

text(-3,3,'c=6f    +2(f     -f    )','fontsize',20)
text(-3,2.95,'         min         max    min','fontsize',15)

text(1.5,-2.5,'  =x-ct','fontsize',20)
text(1.5,-2.5,'x','fontname','symbol','fontweight','bold','fontsize',20)


text(-.2,1,'f','fontsize',20)
text(-.2,0.95,'  max','fontsize',15)

text(-3,-1,'f','fontsize',20)
text(-3,-1.05,'  min','fontsize',15)


hold off