x=(-2:1/200:2);
y=(1-tanh(x.*x.*x)).*exp(-x.*x);
plot(x,y,'linewidth',1.5)
axis([-2.1 5.1 -0.5 1.5])
axis off
hold on

x1=(1:1/200:5);
x=x1-3
y=(1-tanh(x.*x.*x)).*exp(-x.*x);
plot(x1,y,'linewidth',1.5)

q=[0 0];
r=[0 1];
line(q,r,'linestyle','--')


q=[3 3];
r=[0 1];
line(q,r,'linestyle','--')

q=[-2.1 5.1];
r=[0 0];
line(q,r,'linewidth',1.5)

text(-0.3,-.05,'x=0','fontsize',20)
text(2.7,-.05,'x=ct','fontsize',20)
text(2.7,-.07,'         1','fontsize',15)


text(-1,1,'t=0','fontsize',20)
text(1.8,1,'t=t','fontsize',20)
text(1.8,.98,'     1','fontsize',15)



hold off










