q=[0 1];
r=[0 0];
line(q,r)

axis([-1 1 -5.5 1])
axis off
hold on

x=0:.01:1;
y=sin(pi.*x);
plot(x,y,'linewidth',1.5)

rdot=sprintf('%c',183)
for i=1:11
 a=(i-1)/10;
 b=sin(pi*a);
 text(a-.02,b,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(0.45,1.1,'j=5','fontsize',15)
text(0,-.1,'j=0','fontsize',15)
text(1,-.1,'j=10','fontsize',15)
text(0.45,-.3,'(a)','fontsize',15)

text(-1,0,'(n=1)    =sin','fontsize',15)
text(-1,-.15,'                  j','fontsize',10)
text(-1,0,'          f','fontname','symbol','fontweight','bold','fontsize',15)
text(-1,0.15,'                     p','fontname','symbol','fontweight','bold','fontsize',15)
text(-1,0.15,'                       j','fontsize',15)
text(-1,0.15,'                    __','fontsize',15)
text(-1,-.20,'                    10','fontsize',15)


q=[0 1];
r=[-2 -2];
line(q,r)

x=0:.01:1;
y=-2+sin(2.*pi.*x);
plot(x,y,'linewidth',1.5)

rdot=sprintf('%c',183)
for i=1:11
 a=(i-1)/10;
 b=sin(2*pi*a);
 text(a-.02,b-2,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end


text(0.45,-2.3,'(b)','fontsize',15)

text(-1,-2,'(n=2)    =sin','fontsize',15)
text(-1,-2.15,'                  j','fontsize',10)
text(-1,-2,'          f','fontname','symbol','fontweight','bold','fontsize',15)
text(-1,-1.85,'                     2p','fontname','symbol','fontweight','bold','fontsize',15)
text(-1,-1.85,'                         j','fontsize',15)
text(-1,-1.85,'                    ___','fontsize',15)
text(-1,-2.2,'                     10','fontsize',15)

q=[0 1];
r=[-4.5 -4.5];
line(q,r)

x=0:.01:1;
y=-4.5+sin(9.*pi.*x);
plot(x,y,'linewidth',1.5)

x=0:.01:1;
y=-4.5+sin(1.*pi.*x);
plot(x,y,'linewidth',1.5)

x=0:.01:1;
y=-4.5-sin(1.*pi.*x);
plot(x,y,'linewidth',1.5)



rdot=sprintf('%c',183)
for i=1:11
 a=(i-1)/10;
 b=sin(9*pi*a);
 text(a-.02,b-4.5,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(0.45,-3.4,'j=5','fontsize',15)
text(0,-4.6,'j=0','fontsize',15)
text(1,-4.6,'j=10','fontsize',15)
text(0.45,-4.8,'(c)','fontsize',15)

text(-1,-4.5,'(n=9)    =sin','fontsize',15)
text(-1,-4.65,'                  j','fontsize',10)
text(-1,-4.5,'          f','fontname','symbol','fontweight','bold','fontsize',15)
text(-1,-4.35,'                     9p','fontname','symbol','fontweight','bold','fontsize',15)
text(-1,-4.35,'                         j','fontsize',15)
text(-1,-4.35,'                    ___','fontsize',15)
text(-1,-4.70,'                     10','fontsize',15)

text(-1,-5.05,'            =(-1)  sin','fontsize',15)
text(-1,-4.90,'                             j','fontsize',10)
text(-1,-4.85,'                            p','fontname','symbol','fontweight','bold','fontsize',15)
text(-1,-4.85,'                              j','fontsize',15)
text(-1,-4.85,'                            __','fontsize',15)
text(-1,-5.2,'                            10','fontsize',15)

hold off
