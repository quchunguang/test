x=(0.5:1/200:3.5);
y=tan(x-2);
plot(x,y,'linewidth',1.5)
axis([0 12 -3 3])
axis off
hold on

x=(6:1/200:12);
y=atan(x-9);
plot(x,y,'linewidth',1.5)
axis off
hold on

q=[.43 .43];
r=[0 -3];
line(q,r,'linestyle','--')

q=[3.57 3.57];
r=[0 3];
line(q,r,'linestyle','--')

q=[9 12];
r=[1.57 1.57];
line(q,r,'linestyle','--')

q=[6 9];
r=[-1.57 -1.57];
line(q,r,'linestyle','--')

q=[2 2];
r=[-3 3];
line(q,r,'linewidth',1.5)

q=[9 9];
r=[-3 3];
line(q,r,'linewidth',1.5)

q=[0 4];
r=[0 0];
line(q,r,'linewidth',1.5)

q=[6 12];
r=[0 0];
line(q,r,'linewidth',1.5)

text(6.5,2,'tan   z','fontsize',20)
text(6.5,2.1,'       -1','fontsize',15)

text(0,2,'tan z','fontsize',20)

text(4.1,0,'z','fontsize',20)
text(12.1,0,'z','fontsize',20)

text(3,-0.25,'p/2','fontname','symbol','fontweight','bold','fontsize',20)
text(0,0.25,'-p/2','fontname','symbol','fontweight','bold','fontsize',20)
text(8,1.57,'p/2','fontname','symbol','fontweight','bold','fontsize',20)
text(9.1,-1.57,'-p/2','fontname','symbol','fontweight','bold','fontsize',20)

hold off










