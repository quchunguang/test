f=zeros(101);
for x2=1:101
  if x2<51 & x2>40
  f(x2)=1;
  end
end

for x3=0:.1:10
x1=1+10.*x3;
G(x1)=0.5.*f(x1);
F(x1)=0.5.*f(x1);
end




U=zeros(81,101);
x=0:.1:10;
t=0:1:80;
[X,T]=meshgrid(x,t);

for t1=1:81;
for x1=1:101;
c1=x1-1-t1+1;
c2=x1-1+t1-1;
if c1<=-1 
  if c1>=-99
      if c2>100
      U(t1,x1)=-G(-c1);
      end
      if c2<=100
             if c2==0
              U(t1,x1)=-G(-c1); 
              end
             if c2>0     
             U(t1,x1)=-G(-c1)+G(c2);
             end
       end
  end
end
if c1<-99
   if c2>100
    U(t1,x1)=0;
   end
   if c2<=100
    U(t1,x1)=G(c2);
   end
end
if c1==0
   if c2>100
   U(t1,x1)=0;
   end
   if c2<=100
        if c2==0
        U(t1,x1)=0;
        end   
        if c2>0
        U(t1,x1)=G(c2);
        end
   end
end
if c1>0
   if c2>100
    U(t1,x1)=F(c1);
   end
   if c2<=100
    U(t1,x1)=F(c1)+G(c2);
   end
end

end
end
mesh(x,t,U)
view(-7,67.5)



