q=[-1 1];
r=[0 0];
line(q,r,'linewidth',1.0)
axis off
hold on



q=[0 0];
r=[-1.1 1.1];
line(q,r,'linewidth',1.0)


q=[0.52 0.52];
r=[-1.1 1.1];
line(q,r,'linewidth',1.0)

t1=-1:.01:1;
x=t1.*t1;
y=t1;
plot(x,y,'linewidth',1.5)

down=sprintf('%c',175);
up=sprintf('%c',173);

for i=1:5
  s=-0.5+(i-1)/4
  text(0.5,s,up,'fontname','symbol','fontweight','bold','fontsize',15)
end


for i=1:2
  s=.80+(i-1)/4
  text(0.5,s,down,'fontname','symbol','fontweight','bold','fontsize',15)
end

for i=1:2
  s=-1.1+(i-1)/4
  text(0.5,s,down,'fontname','symbol','fontweight','bold','fontsize',15)
end

text(1.1,0,'R','fontsize',20)
text(0.1,1,'x','fontsize',20)

hold off
