

subplot(1,3,1)
x=(0:1/200:1.57);
y=tan(x);
plot(x,y,'linewidth',1.5)
axis([0 6.5 -6 6])
axis off
hold on

x=(1.58:1/200:4.71);
y=tan(x);
plot(x,y,'linewidth',1.5)

x=(0:1/200:5);
y=2*x;
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

q=[0 5];
r=[0 0];
line(q,r,'linewidth',1.5)

text(0,6.2,'z')

text(1,-0.5,'p/2','fontname','symbol','fontweight','bold')
text(3.1,-0.5,'p','fontname','symbol','fontweight','bold')

rdot=sprintf('%c',183)
text(1.00,2.4,rdot,'fontname','symbol','fontweight','bold','fontsize',15)

rsq=sprintf('%c',214,'l');
text(5.7,0,rsq,'fontname','symbol','fontweight','bold')
text(6.35,0,'L')
text(5.98,0.4,'_')
text(2.5,-6.5,'(a)')

subplot(1,3,2)
x=(0:1/200:1.57);
y=tan(x);
plot(x,y,'linewidth',1.5)
axis([0 6.5 -6 6])
axis off
hold on

x=(1.58:1/200:4.71);
y=tan(x);
plot(x,y,'linewidth',1.5)

x=(0:1/200:5);
y=x;
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

q=[0 5];
r=[0 0];
line(q,r,'linewidth',1.5)

text(0,6.2,'z')

text(1,-0.5,'p/2','fontname','symbol','fontweight','bold')
text(3.1,-0.5,'p','fontname','symbol','fontweight','bold')

rdot=sprintf('%c',183)
text(4.35,4.55,rdot,'fontname','symbol','fontweight','bold','fontsize',15)

rsq=sprintf('%c',214,'l');
text(5.7,0,rsq,'fontname','symbol','fontweight','bold')
text(6.35,0,'L')
text(5.98,0.4,'_')
text(2.5,-6.5,'(b)')

subplot(1,3,3)
x=(0:1/200:1.57);
y=tan(x);
plot(x,y,'linewidth',1.5)
axis([0 6.5 -6 6])
axis off
hold on

x=(1.58:1/200:4.71);
y=tan(x);
plot(x,y,'linewidth',1.5)

x=(0:1/200:5);
y=0.5*x;
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

q=[0 5];
r=[0 0];
line(q,r,'linewidth',1.5)

text(0,6.2,'z')

text(1,-0.5,'p/2','fontname','symbol','fontweight','bold')
text(3.1,-0.5,'p','fontname','symbol','fontweight','bold')

rdot=sprintf('%c',183)
text(4.1,2.175,rdot,'fontname','symbol','fontweight','bold','fontsize',15)

rsq=sprintf('%c',214,'l');
text(5.7,0,rsq,'fontname','symbol','fontweight','bold')
text(6.35,0,'L')
text(5.98,0.4,'_')
text(2.5,-6.5,'(c)')


hold off










