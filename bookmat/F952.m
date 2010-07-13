x=(-2:1/200:2);
y=exp(-x.*x);
plot(x,y,'linewidth',1.5)
axis off
hold on

q=[-1 -1];
r=[0 .36];
line(q,r,'linestyle','--')

q=[1 1];
r=[0 .36];
line(q,r,'linestyle','--')

q=[0 0];
r=[0 1.2];
line(q,r,'linewidth',1.5)

q=[-2.1 2.1];
r=[0 0];
line(q,r,'linewidth',1.5)

text(-1.7,-0.1,'-x/(4kt)','fontsize',20)
text(-1,-0.06,'1/2','fontsize',15)

text(0.5,-0.1,' x/(4kt)','fontsize',20)
text(1.2,-0.06,'1/2','fontsize',15)

text(0.1,1.2,'exp(-z  )','fontsize',20)
text(0.6,1.24,'   2','fontsize',15)

text(2.2,0,'z','fontsize',20)
text(0,-.1,'0','fontsize',20)

hold off










