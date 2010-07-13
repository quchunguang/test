q=[0 10];
r=[0 0];
line(q,r)

axis([0 10 -1 5])
axis off
hold on

q=[5 5];
r=[-1 5];
line(q,r,'linewidth',1.5)

n=1;
m=1;
x=0:.1:10;
y=sqrt((x-5).*(x-5)+n*n+2*m*m);
plot(x,y,'linewidth',1.5);



n=2;
m=1;
x=0:.1:10;
y=sqrt((x-5).*(x-5)+n*n+2*m*m);
plot(x,y,'linewidth',1.5);

n=1;
m=2;
x=0:.1:10;
y=sqrt((x-5).*(x-5)+n*n+2*m*m);
plot(x,y,'linewidth',1.5);

n=2;
m=2;
x=0:.1:10;
y=sqrt((x-5).*(x-5)+n*n+2*m*m);
plot(x,y,'linewidth',1.5);

text(9.8,-.5,'k','fontsize',20)
text(4.5,4.8,'w','fontname','symbol','fontweight','bold','fontsize',20)
text(4,1.5,'w','fontname','symbol','fontweight','bold','fontsize',20)
text(4.1,1.4,'  c','fontsize',15)


text(6,1.8,'n=1','fontsize',20)
text(6,1.45,'m=1','fontsize',20)



rdot=sprintf('%c',183)
text(4.9,1.73,rdot,'fontname','symbol','fontweight','bold','fontsize',20)



hold off