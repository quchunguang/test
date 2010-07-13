0
f=zeros(101);
for x2=1:101
   if x2<50
     f(x2)=4;
   end
   if x2>=50
     f(x2)=3;
   end
end


x=-5:.1:5;
y=x-x;
plot(x,f,x,y);
axis off
hold on 
q=[-.1 -.1 ]
r=[0 3]
line(q,r,'linestyle','--')
text(3,1.5,'=3','fontsize',20)
text(-4,2,'=4','fontsize',20)
text(2.5,1.5,'r','fontname','symbol','fontsize',20)
text(-4.5,2,'r','fontname','symbol','fontsize',20)
text(0,-0.25,'x =7t','fontsize',20)
text(0.25,-0.35,'s','fontsize',10)
hold off

