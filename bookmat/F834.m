
x1=(0:1/100:.7);
y1=1.4*x1;
plot(x1,y1,'linewidth',1.5)
axis off
hold on

x1=(0.7:1/100:2.0);
y1=0.4*(2-x1);
plot(x1,y1,'linewidth',1.5)

q=[0.7 0.7];
r=[0 0.98];
line(q,r,'linestyle','--')

q=[0 2];
r=[0 0];
line(q,r,'linewidth',1.5)


text(0,-0.1,'0','fontsize',20)

text(2,-0.1,'L','fontsize',20)

text(0,0.7,'G(x,x )','fontsize',20)
text(0.21,0.68,'0','fontsize',15)

text(.7,-.1,'x','fontsize',20)
text(.75,-.12,'0','fontsize',15)


hold off