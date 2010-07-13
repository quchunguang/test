x=(0:1/200:1.57);
y=tan(x);
plot(x,y,'linewidth',1.5)
axis([0 14 -6 6])
axis off
hold on

x=(1.58:1/200:4.71);
y=tan(x);
plot(x,y,'linewidth',1.5)

x=(4.72:1/200:7.85);
y=tan(x);
plot(x,y,'linewidth',1.5)

x=(0:1/200:7.85);
y=-0.75*x;
plot(x,y,'linewidth',1.5)

q=[0 0];
r=[-6 6];
line(q,r,'linewidth',1.5)

q=[1.5708 1.5708];
r=[-6 6];
line(q,r,'linestyle','--')

q=[4.7124 4.7124];
r=[-6 6];
line(q,r,'linestyle','--')

q=[0 8.5];
r=[0 0];
line(q,r,'linewidth',1.5)

text(0,6.2,'z')

text(1,-0.5,'p/2','fontname','symbol','fontweight','bold')
text(3.1,-0.5,'p','fontname','symbol','fontweight','bold')
text(4,-0.5,'3p/2','fontname','symbol','fontweight','bold')
text(6.2,-0.5,'2p','fontname','symbol','fontweight','bold')

rdot=sprintf('%c',183)
text(2.05,-1.6,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
text(4.9,-3.73,rdot,'fontname','symbol','fontweight','bold','fontsize',15)

rsq=sprintf('%c',214,'l');
text(8.7,0,rsq,'fontname','symbol','fontweight','bold')
text(9.3,0,'L')
text(8.93,0.4,'_')

text(8,6,'tan         = ____')
text(8.5,6,rsq,'fontname','symbol','fontweight','bold')
text(9.1,6,'L')
text(8.73,6.4,'_')
text(9.9,6.3,rsq,'fontname','symbol','fontweight','bold')
text(10.5,6.3,'L')
text(10.13,6.7,'_')
text(10.0,5.5,'hL')
text(9.8,6.3,'-')

text(7,-4,'z = ____')
text(7.7,-3.7,rsq,'fontname','symbol','fontweight','bold')
text(8.3,-3.7,'L')
text(7.93,-3.3,'_')
text(7.8,-4.5,'hL')
text(7.6,-3.7,'-')

text(2,-2.5,rsq,'fontname','symbol','fontweight','bold')
text(2.6,-2.5,'L')
text(2.23,-2.1,'_')
text(2.44,-2.7,'1','fontsize',6,'fontweight','bold')


text(5,-5,rsq,'fontname','symbol','fontweight','bold')
text(5.6,-5,'L')
text(5.23,-4.6,'_')
text(5.44,-5.2,'2','fontsize',6,'fontweight','bold')



hold off










