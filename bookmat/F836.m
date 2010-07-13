x=(0:1/100:0.2);
y=-0.8*x;
plot(x,y,'linewidth',1.5)
hold on

x=(.2:1/100:1.0);
y=-0.2*(1-x);
plot(x,y,'linewidth',1.5)

x=(0:1/100:0.5);
y=-0.5*x;
plot(x,y,'linewidth',1.5)

x=(.5:1/100:1.0);
y=-0.5*(1-x);
plot(x,y,'linewidth',1.5)

text(.7,-.16,'G(x,0.5)','fontsize',20)
text(0,-.18,'G(x,0.2)','fontsize',20)

text(0.15,0.01,'0.2','fontsize',20)
text(0.45,0.01,'0.5','fontsize',20)
text(0,0.01,'0','fontsize',20)
text(1,0.01,'1','fontsize',20)

q=[0 1];
r=[-0.1 -0.1];
line(q,r,'linestyle','--')

q=[0.2 0.2];
r=[-0.16 0];
line(q,r,'linestyle','--')

q=[0.5 0.5];
r=[-0.25 0];
line(q,r,'linestyle','--')

rdot=sprintf('%c',183)
text(0.19,-0.1,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(0.49,-0.1,rdot,'fontname','symbol','fontweight','bold','fontsize',20)


hold off
