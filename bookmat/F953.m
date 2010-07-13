x=(-2:1/200:2);
y=x.*x;
plot(x,y,'linewidth',1.5)
axis off
hold on

x=(-2:1/200:2);
y=0.5.*x.*x;
plot(x,y,'linewidth',1.5)

x=(-2:1/200:2);
y=0.25.*x.*x;
plot(x,y,'linewidth',1.5)

q=[0 0];
r=[0 5];
line(q,r,'linewidth',1.5)

q=[-2.1 2.1];
r=[0 0];
line(q,r,'linewidth',1.5)

text(-1.7,-0.2,'u=0','fontsize',20)

text(0.5,-0.2,'u=100','fontsize',20)
text(-0.2,4.8,'t','fontsize',20)


text(0.1,4.2,'u=50','fontsize',20)


text(2.2,0,'x','fontsize',20)

hold off










