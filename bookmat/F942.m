x=(-2:1/200:2);
y=exp(-x.*x);
plot(x,y,'linewidth',1.5)
axis off
hold on

x=(-1:1/200:1);
y=exp(-10.*x.*x);
plot(x,y,'linestyle','--')

q=[0 0];
r=[0 1.3];
line(q,r,'linewidth',1.5)


q=[-2.1 2.1];
r=[0 0];
line(q,r,'linewidth',1.5)

text(0.3,0.2,'a=10','fontname','symbol','fontweight','bold','fontsize',20)
text(0.6,0.8,'a=1','fontname','symbol','fontweight','bold','fontsize',20)
text(-0.7,1.4,'(w) =        -aw','fontname','symbol','fontweight','bold','fontsize',20)
text(-.9,1.4,'G         exp(        )','fontsize',20)

text(0.7,1.44,'2','fontsize',15)

text(2.2,0,'w','fontname','symbol','fontweight','bold','fontsize',20)





hold off










