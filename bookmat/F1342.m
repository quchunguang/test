for i=1:11
for j=1:11
  u(i,j)=0;
  q(i,j)=0;
end
end

for j=1:11
   u(j,1)=1000;
   q(j,1)=1000;
end

u(1,1)=500;
u(11,1)=500;
q(1,1)=500;
q(11,1)=500;


v=[50 100 200 300 400 500 600 700 800 900];

for k=1:10

for i=2:10
for j=2:10
   q(j,i)=0.25*(u(j+1,i)+u(j-1,i)+u(j,i+1)+u(j,i-1));
   if i>4
       if j>6
       q(j,i)=0;
       end
   end
end
end



for i=2:10
for j=2:10
   u(j,i)=q(j,i);
end
end


end
c=contour(u,v);
clabel(c);
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

text(9,10,'t=0.025/k','fontsize',15)
text(9,9.4,'  (m=10)','fontsize',15)

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

for j=2:11
   text(j,1,'0','fontsize',15)
end

for j=2:7
   text(11,j,'0','fontsize',15)
end

for j=7:11
   text(5,j,'0','fontsize',15)
end

for j=2:4
   text(j,11,'0','fontsize',15)
end

for j=6:10
   text(j,7,'0','fontsize',15)
end


for j=2:10
   text(-0.5,j,'1000','fontsize',15)
end

text(-0.5,1,' 500','fontsize',15)
text(-0.5,11,' 500','fontsize',15)
hold off