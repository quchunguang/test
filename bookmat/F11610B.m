


x=-1:.1:9;
t=0:0.05:1;
[X,T]=meshgrid(x,t);

U=zeros(21,101);
for t1=1:21
for x1=1:101
  
 
  if x1<=10+(70/20)*(t1-1)
        U(t1,x1)=4;
        end
   if x1>10+3.5*(t1-1)
        U(t1,x1)=3;
        end 

 
  
end
end
mesh(x,t,U)
view(-20,60)
axis([-1 9 0 1 3 4])
xlabel('x','fontsize',20)
ylabel('t','fontsize',20)
zlabel('r','fontname','symbol','fontsize',20)

