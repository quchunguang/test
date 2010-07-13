q=[-3 3];
r=[-2 -2];
line(q,r)

axis off
hold on

q=[0 0];
r=[-2 -1.75];
line(q,r)

q=[0 0];
r=[-1 -1.25];
line(q,r)

x=-3:.02:3;
y=-2+sech(2.*x);
plot(x,y,'linewidth',1.5);


x=-3:.02:3;
y=-4+sin(15.*x).*sech(2.*x);
plot(x,y,'linewidth',1.5);

x=-3:.02:3;
y=-4+sech(2.*x);
plot(x,y);

x=-3:.02:3;
y=-4-sech(2.*x);
plot(x,y);


q=[-3 3];
r=[-4 -4];
line(q,r)


text(-3,-1,'solitary wave','fontsize',20)
text(-3,-1.3,'for NLS','fontsize',20)
text(-3,-3,'envelope soliton','fontsize',20)
text(-3,-3.3,'from NLS','fontsize',20)


text(-.2,-1.5,'r','fontsize',20)
text(-.2,-1.55,'  max','fontsize',15)



hold off