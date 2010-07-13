q=[0 0.8];
r=[0 0];
line(q,r)

axis off
hold on

q=[0 0];
r=[-5 5];
line(q,r)

rdot=sprintf('%c',183)
L=-1.25;
b=1/L;
for i=1:7
 a=(i-1)/10;
 b=b*L;
 text(a-.01,b,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(-.1,1,'1','fontsize',15)
text(.1,4.5,'l<-1','fontname','symbol','fontweight','bold','fontsize',15)


q=[1.5 2.3];
r=[0 0];
line(q,r)

q=[1.5 1.5];
r=[-5 5];
line(q,r)


rdot=sprintf('%c',183)
L=-1;
b=1/L;
for i=1:7
 a=1.5+(i-1)/10;
 b=b*L;
 text(a-.01,b,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(1.4,1,'1','fontsize',15)
text(1.6,4.5,'l=-1','fontname','symbol','fontweight','bold','fontsize',15)

q=[3 3.8];
r=[0 0];
line(q,r)

q=[3 3];
r=[-5 5];
line(q,r)


rdot=sprintf('%c',183)
L=-0.8;
b=1/L;
for i=1:7
 a=3+(i-1)/10;
 b=b*L;
 text(a-.01,b,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(2.9,1,'1','fontsize',15)
text(3.1,4.5,'-1<l<0','fontname','symbol','fontweight','bold','fontsize',15)


q=[4.5 5.3];
r=[0 0];
line(q,r)

q=[4.5 4.5];
r=[-5 5];
line(q,r)


rdot=sprintf('%c',183)
L=0;
text(4.49,1,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
for i=2:7
 a=4.5+(i-1)/10;
 b=b*L;
 text(a-.01,b,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(4.4,1,'1','fontsize',15)
text(4.6,4.5,'l=0','fontname','symbol','fontweight','bold','fontsize',15)

q=[.75 1.55];
r=[-10 -10];
line(q,r)

q=[.75 .75];
r=[-5 -10];
line(q,r)

rdot=sprintf('%c',183)
L=0.8;
b=1/L;
for i=1:7
 a=.75+(i-1)/10;
 b=b*L;
 text(a-.01,b-10,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(.65,-9,'1','fontsize',15)
text(.85,-5.5,'0<l<1','fontname','symbol','fontweight','bold','fontsize',15)



q=[2.25 3.05];
r=[-10 -10];
line(q,r)

q=[2.25 2.25];
r=[-5 -10];
line(q,r)

rdot=sprintf('%c',183)
L=1;
b=1/L;
for i=1:7
 a=2.25+(i-1)/10;
 b=b*L;
 text(a-.01,b-10,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(2.15,-9,'1','fontsize',15)
text(2.35,-5.5,'l=1','fontname','symbol','fontweight','bold','fontsize',15)



q=[3.75 4.55];
r=[-10 -10];
line(q,r)

q=[3.75 3.75];
r=[-5 -10];
line(q,r)

rdot=sprintf('%c',183)
L=1.3;
b=1/L;
for i=1:7
 a=3.75+(i-1)/10;
 b=b*L;
 text(a-.01,b-10,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(3.65,-9,'1','fontsize',15)
text(3.85,-5.5,'l=1','fontname','symbol','fontweight','bold','fontsize',15)

hold off
