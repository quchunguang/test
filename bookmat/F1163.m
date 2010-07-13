x=(0:1/100:30);
y=10*(1+tanh(0.1*(x-10)))+1;
plot(x,y,'linewidth',1.5)
axis([0 34 -5 24])
axis off
hold on

x=(10:1/100:30);
y=10*(1+tanh(0.3*(x-25)))+1;
plot(x,y,'--','linewidth',1.5)

a=3;
b=10*(1+tanh(0.1*(a-10)))+1;
q=[a 22.5];
r=[b b];
line(q,r,'linewidth',2.0)

q=[a a];
r=[0 b];
line(q,r,'linewidth',1.0)

q=[22.5 22.5];
r=[0 b];
line(q,r,'linewidth',1.0)

right=sprintf('%c',174);
rdot=sprintf('%c',183)
text(a-.5,b,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(22,b,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(21,b+.1,right,'fontname','symbol','fontweight','bold','fontsize',15)

a=9;
b=10*(1+tanh(0.1*(a-10)))+1;
q=[a 24.5];
r=[b b];
line(q,r,'linewidth',1.0)
text(a-.5,b,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(24,b,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(23,b+.1,right,'fontname','symbol','fontweight','bold','fontsize',15)


a=15;
b=10*(1+tanh(0.1*(a-10)))+1;
q=[a 26.5];
r=[b b];
line(q,r,'linewidth',1.0)
text(a-.5,b,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(26,b,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(25,b+.1,right,'fontname','symbol','fontweight','bold','fontsize',15)


a=21;
b=10*(1+tanh(0.1*(a-10)))+1;
q=[a 28.5];
r=[b b];
line(q,r,'linewidth',1.0)
text(a-.5,b,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(28,b,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(27,b+.1,right,'fontname','symbol','fontweight','bold','fontsize',15)


q=[0 30];
r=[0 0];
line(q,r,'linewidth',1.0)

text(3,-2,'x','fontsize',20)
text(3,-2.5,'   0','fontsize',15)

text(20,-2,'x  +c(    )t','fontsize',20)
text(20,-2.5,'   0          0','fontsize',15)
text(20,-2,'         r','fontname','symbol','fontweight','bold','fontsize',20)

text(26,9,'r','fontname','symbol','fontweight','bold','fontsize',20)
text(26,9,'  (x,t)','fontsize',20)

text(6,14,'r','fontname','symbol','fontweight','bold','fontsize',20)
text(6,14,'  (x,0)','fontsize',20)

text(32,0,'x','fontsize',20)

hold off










