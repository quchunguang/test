


x=-1:.1:9;
t=0:0.10:2;
[X,T]=meshgrid(x,t);

U=zeros(21,101);
for t1=1:21
for x1=1:101
  
 
  if x1<=10+1.5*(t1-1)
        U(t1,x1)=3;
        end
   if x1>10+4*(t1-1)
        U(t1,x1)=4;
        end  
  if t1>1 
     if   x1>=10+1.5*(t1-1)
             if x1<=10+4*(t1-1)  
             U(t1,x1)=2.4+0.4*(x1-10)/(t1-1);
              end     
      end
   end
end
end
meshc(x,t,U)
axis([-1 9 0 2 3 4])
view(-60,60)
xlabel('x','fontsize',20)
ylabel('t','fontsize',20)
zlabel('r','fontname','symbol','fontsize',20)

