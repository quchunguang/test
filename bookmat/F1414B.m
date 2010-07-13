axis([-3.5 3.5 0 5])
axis off
hold on


for i=1:13
a=i/2-3.5;
c=5;
b=a-c*(atan(a)-0.75);
q=[a b];
r=[0 c];
line(q,r)
end

q=[-3.5 3.5];
r=[0 0];
line(q,r)

text(1.35,1,'(x  ,t  )','fontsize',20)
text(1.35,.9,'    c    c','fontsize',15)

text(-.2,-.3,'x','fontname','symbol','fontweight','bold','fontsize',20)
text(-.2,-.4,'  c','fontsize',15)

rdot=sprintf('%c',183)
text(.7,1,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

text(3.6,0,'x','fontsize',20)

hold off
