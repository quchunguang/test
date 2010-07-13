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

x=(7.86:1/200:10.99);
y=tan(x);
plot(x,y,'linewidth',1.5)

x=(0:1/200:12);
y=0.3*x;
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

q=[7.854 7.854];
r=[-6 6];
line(q,r,'linestyle','--')

q=[0 12];
r=[0 0];
line(q,r,'linewidth',1.5)

text(0,6.2,'z')

text(1,-0.5,'p/2','fontname','symbol','fontweight','bold')
text(3.1,-0.5,'p','fontname','symbol','fontweight','bold')
text(4,-0.5,'3p/2','fontname','symbol','fontweight','bold')
text(6.2,-0.5,'2p','fontname','symbol','fontweight','bold')

rdot=sprintf('%c',183)
text(3.9,1.25,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
text(7.3,2.2,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
text(10.6,3.2,rdot,'fontname','symbol','fontweight','bold','fontsize',15)


rsq=sprintf('%c',214,'l');
text(12.2,0,rsq,'fontname','symbol','fontweight','bold')
text(12.8,0,'L')
text(12.43,0.4,'_')




text(3,1.7,rsq,'fontname','symbol','fontweight','bold')
text(3.6,1.7,'L')
text(3.23,2.1,'_')
text(3.44,1.5,'2','fontsize',6,'fontweight','bold')


text(6,2.7,rsq,'fontname','symbol','fontweight','bold')
text(6.6,2.7,'L')
text(6.23,3.1,'_')
text(6.44,2.5,'3','fontsize',6,'fontweight','bold')


text(9.5,3.7,rsq,'fontname','symbol','fontweight','bold')
text(10.1,3.7,'L')
text(9.73,4.1,'_')
text(9.94,3.5,'4','fontsize',6,'fontweight','bold')

hold off










