x=(0:1/10:1);
y=[0 0 0 0 0 0 .1 .20001 .20001 .1 0];
plot(x,y,'linewidth',1.5)
hold on
rdot=sprintf('%c',183);
s=0.25;
for j=1:11
u(j)=0;
end

q=[.7 .75];
r=[.20001 .2499];
line(q,r,'linestyle','--')

q=[.75 .8];
r=[.2499 .20001];
line(q,r,'linestyle','--')



for m=1:6


for j=1:4

for i=1:11

 if i<2
 u(i)=0;
 end

 if i>1 
   if i<11
   u(i)=y(i)+s*(y(i-1)-2*y(i)+y(i+1));
   end
 end

 if i>10
 u(i)=0;
 end
end


for i=1:11
  y(i)=u(i);
end

end

x=(0:1/10:1);
plot(x,u,'linewidth',1.5)

for k=1:11
 a=(k-1)/10;
 b=u(k);
 text(a-.005,b,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end


end

text (.25,.23,'s=1/4','fontsize',20)
text(.20,.21,'(  t=0.0025)','fontsize',20)
text(.20,.21,' D','fontname','symbol','fontweight','bold','fontsize',20)

text(.84,.19,'t=0','fontsize',15)
text(.7,.14,'t=0.01','fontsize',15)
text(.68,.106,'t=0.02','fontsize',15)
text(.66,.084,'t=0.03','fontsize',15)
text(.65,.07,'t=0.04','fontsize',15)
text(.63,.059,'t=0.05','fontsize',15)
text(.61,.035,'t=0.06','fontsize',15)





hold off











