q=[-2 2];
r=[0 0];
line(q,r)

axis off
hold on
b=1.5;

q=[-1.414 1.414];
r=[b b];
line(q,r)

q=[0 0];
r=[b-0.5 b+0.5];
line(q,r)

q=[1 1];
r=[0 b-0.25];
line(q,r,'linestyle','--')

q=[-1 -1];
r=[0 b-0.25];
line(q,r,'linestyle','--')

q=[1.414 1.414];
r=[0 b];
line(q,r,'linestyle','--')

q=[-1.414 -1.414];
r=[0 b];
line(q,r,'linestyle','--')



x=-1.65:.01:1.65;
x1=x.*x;
y=b-0.5.*x1+0.25.*x1.*x1;
plot(x,y,'linewidth',1.5);

h=0;
x=-1.414:.004:1.414;
x1=x.*x;
y=sqrt(h+0.5.*x1-0.25.*x1.*x1);
y2=-y;
plot(x,y,x,y2,'linewidth',1.5);

x2=1.6;
x3=x2.*x2;
h=-0.5.*x3+0.25.*x3.*x3;
x=-x2:.01:x2;
x1=x.*x;
y=sqrt(h+0.5.*x1-0.25.*x1.*x1);
y2=-y;
plot(x,y,x,y2,'linewidth',1.5);

q=[-1.6 1.6];
r=[b+h b+h];
line(q,r)

x4=0.6;
x5=x4.*x4;
h=-0.5.*x5+0.25.*x5.*x5;
x=x4:.01:1.3;
x1=x.*x;
y=sqrt(h+0.5.*x1-0.25.*x1.*x1);
y2=-y;
plot(x,y,x,y2,'linewidth',1.5);
q=[0.6 1.275];
r=[b+h b+h];
line(q,r)
q=[-1.275 -0.6];
r=[b+h b+h];
line(q,r)

x4=-0.6;
x5=x4.*x4;
h=-0.5.*x5+0.25.*x5.*x5;
x=-1.3:.01:x4;
x1=x.*x;
y=sqrt(h+0.5.*x1-0.25.*x1.*x1);
y2=-y;
plot(x,y,x,y2,'linewidth',1.5);

text(-1.5,b+0.5,'potential','fontsize',15)
text(0.1,b+0.5,'V=0.5  r +0.25  r    ','fontsize',15)
text(0.1,b+0.5,'          d            g','fontname','symbol','fontweight','bold','fontsize',15)
text(0.1,b+0.6,'                2               4','fontsize',12)
text(0.1,b+0.25,'      (d<0, g>0)','fontname','symbol','fontweight','bold','fontsize',15)

text(1.45,-0.1,'r','fontsize',15)
text(1.45,-0.15,'  max','fontsize',12)


rdot=sprintf('%c',183)
text(0.96,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(-1.04,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(-0.04,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)


hold off