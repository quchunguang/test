subplot(2,3,1)
q=[-1 1];
r=[0 0];
line(q,r)
axis([-1 1 -1 1])
axis off
hold on
x=-1:.01:1;
y=1+x-x;
plot(x,y,'linewidth',1.5);
text(-1,-.05,'-1','fontsize',8)
text(1,-.05,'1','fontsize',8)
text(-0.3,1.1,'P  (x)=1','fontsize',8)
text(-0.3,1.02,'  0','fontsize',8)
hold off

subplot(2,3,2)
q=[-1 1];
r=[0 0];
line(q,r)
axis([-1 1 -1 1])
axis off
hold on
x=-1:.01:1;
y=x;
plot(x,y,'linewidth',1.5);
text(-1,-.05,'-1','fontsize',8)
text(1,-.05,'1','fontsize',8)
text(-.3,1,'P  (x)=x','fontsize',8)
text(-.3,0.92,'  1','fontsize',8)
hold off

subplot(2,3,3)
q=[-1 1];
r=[0 0];
line(q,r)
axis([-1 1 -1 1])
axis off
hold on
x=-1:.01:1;
y=0.5.*(3.*x.*x-1);
plot(x,y,'linewidth',1.5);
text(-1,-.05,'-1','fontsize',8)
text(1,-.05,'1','fontsize',8)
text(-0.3,1,'P  (x)=   (3 x  -1)','fontsize',8)
text(-.3,0.92,'  2','fontsize',8)
text(-.3,1.1,'                   2','fontsize',8)
text(0,1.05,'   1','fontsize',8)
text(0,1.05,'   _','fontsize',8)
text(0,0.95,'   2','fontsize',8)
hold off


subplot(2,3,4)
q=[0 3.14];
r=[0 0];
line(q,r)
axis([0 3.14 -1 1])
axis off
hold on
x=0:.01:3.14;
y=1+x-x;
plot(x,y,'linewidth',1.5);
text(0,-.05,'0','fontsize',8)
text(3,-.05,'p','fontname','symbol','fontweight','bold','fontsize',8)
text(0.5,1.1,'P  (cos  )=1','fontsize',8)
text(0.5,1.02,'  0','fontsize',8)
text(0.5,1.1,'           f','fontname','symbol','fontweight','bold','fontsize',8)
hold off

subplot(2,3,5)
q=[0 3.14];
r=[0 0];
line(q,r)
axis([0 3.14 -1 1])
axis off
hold on
x=0:.01:3.14;
y=cos(x);
plot(x,y,'linewidth',1.5);
text(0,-.05,'0','fontsize',8)
text(3,-.05,'p','fontname','symbol','fontweight','bold','fontsize',8)
text(0.5,1,'P  (cos  )=cos','fontsize',8)
text(0.5,0.92,'  1','fontsize',8)
text(0.5,1.0,'           f        f','fontname','symbol','fontweight','bold','fontsize',8)
hold off

subplot(2,3,6)
q=[0 3.14];
r=[0 0];
line(q,r)
axis([0 3.14 -1 1])
axis off
hold on
x=0:.01:3.14;
y=0.25.*(3.*cos(2.*x)+1);
plot(x,y,'linewidth',1.5);
text(0,-.05,'0','fontsize',8)
text(3,-.05,'p','fontname','symbol','fontweight','bold','fontsize',8)
text(0.5,1,'P  (cos  )=   (3 cos 2  +1)','fontsize',8)
text(0.5,0.92,'  2','fontsize',8)
text(0.5,1.0,'           f                  f','fontname','symbol','fontweight','bold','fontsize',8)
text(1.4,1.05,'  1','fontsize',8)
text(1.4,1.05,'  _','fontsize',8)
text(1.4,0.95,'  4','fontsize',8)

hold off
