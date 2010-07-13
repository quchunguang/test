f=zeros(101);
for x2=1:101
  if x2<61 & x2>50
  f(x2)=1;
  end
end

for x=0:.1:10
x1=1+10.*x;
G(x1)=0.5.*f(x1);
F(x1)=0.5.*f(x1);
end





t1=0;
for x1=1:101;
t=t1+x1-x1;
c1=x1-t1;
c2=x1+t1;
if c1<=0 
   if c2>100
    u(x1)=0;
   end
   if c2<=100
    u(x1)=G(c2);
   end
end
if c1>0
   if c2>100
    u(x1)=F(c1);
   end
   if c2<=100
    u(x1)=F(c1)+G(c2);
   end
end
end
x=0:.1:10;
t=t1+x-x;
plot3(x,t,u)
axis([0 10 0 9.9 0 1])
hold on


t1=2;
for x1=1:101;
t=t1+x1-x1;
c1=x1-t1;
c2=x1+t1;
if c1<=0 
   if c2>100
    u(x1)=0;
   end
   if c2<=100
    u(x1)=G(c2);
   end
end
if c1>0
   if c2>100
    u(x1)=F(c1);
   end
   if c2<=100
    u(x1)=F(c1)+G(c2);
   end
end
end
x=0:.1:10;
t=t1+x-x;
plot3(x,t,u)
hold on

t1=4;
for x1=1:101;
t=t1+x1-x1;
c1=x1-t1;
c2=x1+t1;
if c1<=0 
   if c2>100
    u(x1)=0;
   end
   if c2<=100
    u(x1)=G(c2);
   end
end
if c1>0
   if c2>100
    u(x1)=F(c1);
   end
   if c2<=100
    u(x1)=F(c1)+G(c2);
   end
end
end
x=0:.1:10;
t=t1+x-x;
plot3(x,t,u)
hold on

t1=6;
for x1=1:101;
t=t1+x1-x1;
c1=x1-t1;
c2=x1+t1;
if c1<=0 
   if c2>100
    u(x1)=0;
   end
   if c2<=100
    u(x1)=G(c2);
   end
end
if c1>0
   if c2>100
    u(x1)=F(c1);
   end
   if c2<=100
    u(x1)=F(c1)+G(c2);
   end
end
end
x=0:.1:10;
t=t1+x-x;
plot3(x,t,u)
hold on

t1=8;
for x1=1:101;
t=t1+x1-x1;
c1=x1-t1;
c2=x1+t1;
if c1<=0 
   if c2>100
    u(x1)=0;
   end
   if c2<=100
    u(x1)=G(c2);
   end
end
if c1>0
   if c2>100
    u(x1)=F(c1);
   end
   if c2<=100
    u(x1)=F(c1)+G(c2);
   end
end
end
x=0:.1:10;
t=t1+x-x;
plot3(x,t,u)

xlabel('x','fontsize',20)
ylabel('t','fontsize',20)

hold off



