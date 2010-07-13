q=[-1 1];
r=[0 0];
line(q,r,'linewidth',1.0)
axis([-1 4 0 2])
axis off
hold on

q=[0.55 0.55];
r=[0 1.1];
line(q,r,'linewidth',1.0)

q=[-0.45 -0.45];
r=[0 1.1];
line(q,r,'linewidth',1.0)

t1=0:.01:1;
x=t1.*t1;
y=t1;
plot(x,y,'linewidth',1.5)

down=sprintf('%c',175);
up=sprintf('%c',173);

for i=1:3
  s=.1+(i-1)/4
  text(0.5,s,up,'fontname','symbol','fontweight','bold','fontsize',15)
end


for i=1:2
  s=0.85+(i-1)/4
  text(0.5,s,down,'fontname','symbol','fontweight','bold','fontsize',15)
end

for i=1:3
  s=.1+(i-1)/4
  text(-0.5,s,down,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(1,-.1,'R','fontsize',20)
text(-.1,-.1,'R','fontsize',20)
text(-.1,-.12,'   c','fontsize',15)

text(.8,.9,' a<0','fontname','symbol','fontweight','bold','fontsize',20)


q=[2 4];
r=[0 0];
line(q,r,'linewidth',1.0)

q=[3.55 3.55];
r=[0 1.1];
line(q,r,'linewidth',1.0)

q=[2.55 2.55];
r=[0 1.1];
line(q,r,'linewidth',1.0)

t1=0:.01:1;
x=3-t1.*t1;
y=t1;
plot(x,y,'linewidth',1.5)

down=sprintf('%c',175);
up=sprintf('%c',173);

for i=1:3
  s=.1+(i-1)/4
  text(3.5,s,up,'fontname','symbol','fontweight','bold','fontsize',15)
end


for i=1:3
  s=.1+(i-1)/4
  text(2.5,s,down,'fontname','symbol','fontweight','bold','fontsize',15)
end

for i=1:2
  s=.75+(i-1)/4
  text(2.5,s,up,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(4,-.1,'R','fontsize',20)
text(2.9,-.1,'R','fontsize',20)
text(2.9,-.12,'   c','fontsize',15)

text(3.8,.9,'a>0','fontname','symbol','fontweight','bold','fontsize',20)


hold off
