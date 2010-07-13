q=[-0.7 1.7];
r=[0 0];
line(q,r)

axis off
hold on
b=3;

q=[-0.6 1.5];
r=[b b];
line(q,r)

q=[1 1];
r=[0 b-1];
line(q,r,'linestyle','--')

q=[0 0];
r=[0 b];
line(q,r,'linestyle','--')

q=[1.5 1.5];
r=[0 b];
line(q,r,'linestyle','--')


x=-0.6:.01:1.6;
x1=x.*x;
y=b-3.*x1+2.*x.*x1;
plot(x,y,'linewidth',1.5);

h=0;
x=-0.6:.01:1.5;
x1=x.*x;
y=sqrt(h+3.*x1-2.*x.*x1);
y2=-y;
plot(x,y,x,y2,'linewidth',1.5);

x2=1.55;
x3=x2.*x2;
h=-3.*x3+2.*x2.*x3;
x=-0.6:.01:1.55;
x1=x.*x;
y=sqrt(h+3.*x1-2.*x.*x1);
y2=-y;
plot(x,y,x,y2,'linewidth',1.5);
q=[-0.6 1.55];
r=[b+h b+h];
line(q,r)


x4=0.6;
x5=x4.*x4;
h=-3.*x5+2.*x4.*x5;
x=x4:.01:1.32;
x1=x.*x;
y=sqrt(h+3.*x1-2.*x.*x1);
y2=-y;
plot(x,y,x,y2,'linewidth',1.5);
q=[0.6 1.31];
r=[b+h b+h];
line(q,r)
q=[-0.6 -.3];
r=[b+h+.35 b+h+.35];
line(q,r)

x4=-0.3;
x5=x4.*x4;
h=-3.*x5+2.*x4.*x5;
x=-0.6:.01:x4;
x1=x.*x;
y=sqrt(h+3.*x1-2.*x.*x1);
y2=-y;
plot(x,y,x,y2,'linewidth',1.5);

text(.75,b+0.5,'potential','fontsize',15)
text(-.5,b+0.8,'V=f  -0.5f  -Af','fontsize',15)
text(-.5,b+0.9,'        3         2','fontsize',12)
text(-.5,b+0.45,'  (c  +12A>0)','fontsize',15)
text(-.5,b+0.55,'       2','fontsize',12)

text(1.55,-0.1,'f','fontsize',15)
text(1.55,-0.15,'  max','fontsize',12)
text(-0.1,-0.20,'f','fontsize',15)
text(-0.1,-0.25,'  min','fontsize',12)
text(1.8,0,'f','fontsize',15)


rdot=sprintf('%c',183)
text(0.98,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(1.46,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(-0.04,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)


hold off