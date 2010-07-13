k=1;
xm=1;
ym=2;


t2=(-xm:1/100:xm);
x3=t2;
y3=t2.*t2+k*t2.*t2.*t2.*t2;
 
plot(x3,y3,'linewidth',1.5)
axis([-.70 .70 0 0.75])
axis off
hold on


for i=0:20;

a=0.01-i/20;
x=a;
y=a*a+k*a*a*a*a;
m1=2*a+4*k*a*a*a;
m2=-1/m1;
x2=a-2*m1*(ym-y)/(1-m1*m1);

t10=(0:1:200);
t5=t10./100;
m5=-2*m1/(1-m1*m1);
m6=1/m5;
x5=x+t5;
y5=y+m6.*t5;
x10=-x5;
plot(x5,y5,x10,y5)



end

rdot=sprintf('%c',183)
text(-.01,0.26,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

q=[0 0];
r=[0 2];
line(q,r)

hold off