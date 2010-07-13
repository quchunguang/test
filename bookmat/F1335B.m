x=(0:1/10:1);
y=[0 0 0 0 0 0 .1 .20001 .20001 .1 0];
plot(x,y,'linewidth',2.0)
axis([0 1 -1.5 1.5])
hold on
rdot=sprintf('%c',183);
s=1;
for j=1:11
u(j)=0;
end

q=[.7 .75];
r=[.20001 .2499];
line(q,r,'linestyle','--')

q=[.75 .8];
r=[.2499 .20001];
line(q,r,'linestyle','--')

q=[0 1];
r=[0 0];
line(q,r)


for m=1:6



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

if m==2
x=(0:1/10:1);
plot(x,u,'linewidth',1.5);
end

if m==1
x=(0:1/10:1);
plot(x,u,'linestyle','--');
end

if m==4
x=(0:1/10:1);
plot(x,u,'linewidth',1.5);
end

if m==3
x=(0:1/10:1);
plot(x,u,'linestyle','--');
end

if m==6
x=(0:1/10:1);
plot(x,u,'linewidth',1.5);
end

if m==5
x=(0:1/10:1);
plot(x,u,'linestyle','--');
end

for k=1:11
 a=(k-1)/10;
 b=u(k);
 text(a-.006,b,rdot,'fontname','symbol','fontweight','bold','fontsize',15)
end


end

text (.05,1.3,'s=1','fontsize',20)
text(.01,1.1,'(  t=0.01)','fontsize',20)
text(.01,1.1,' D','fontname','symbol','fontweight','bold','fontsize',20)

text(.70,.26,'t=0','fontsize',15)
text(.5,.17,'t=0.01','fontsize',15)
text(.36,.21,'t=0.02','fontsize',15)
text(.45,.32,'t=0.03','fontsize',15)
text(.56,.42,'t=0.04','fontsize',15)
text(.45,1.12,'t=0.05','fontsize',15)
text(.25,1.4,'t=0.06','fontsize',15)





hold off











