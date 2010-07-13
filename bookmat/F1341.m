for i=1:11
for j=1:11
  u(i,j)=0;
  q(i,j)=0;
end
end

axis([-0.5 12 1 11])
axis off
hold on

q=[1 1];
r=[1 11];
line(q,r,'linewidth',1.5)

q=[1 11];
r=[1 1];
line(q,r,'linewidth',1.5)

q=[11 11];
r=[1 7];
line(q,r,'linewidth',1.5)

q=[5 11];
r=[7 7];
line(q,r,'linewidth',1.5)

q=[5 5];
r=[7 11];
line(q,r,'linewidth',1.5)

q=[1 5];
r=[11 11];
line(q,r,'linewidth',1.5)

text(9,10,'t=0','fontsize',15)

text(0.8,.5,'x=0','fontsize',15)
text(10.8,.5,'x=1','fontsize',15)

text(11.5,1,'y=0','fontsize',15)
text(11.5,7,'y=0.6','fontsize',15)
text(5.5,11,'y=1','fontsize',15)
text(4.8,11.5,'x=0.4','fontsize',15)


rdot=sprintf('%c',183)
for j=1:11
   text(.9,j,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
end

for i=2:5
for j=1:11
   text(i,j,'0','fontsize',15)
end
end

for i=6:11
for j=1:7
   text(i,j,'0','fontsize',15)
end
end


for j=2:10
   text(-0.5,j,'1000','fontsize',15)
end

text(-0.5,1,' 500','fontsize',15)
text(-0.5,11,' 500','fontsize',15)
hold off