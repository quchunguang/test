
v=[1.6,0.8,-0.00001,];

s=pi/200;
t=(0:2:400);
t1=s.*t;
x8=cos(t1);
y8=1.15*sin(t1);
plot(x8,y8,'linewidth',3)
axis([-2.3 2.3 -2 2])
axis off
hold on


c=2;
x=-2:.05:2;
y=-2:.05:2;
[X,Y]=meshgrid(x,y);
Z=X-X;
for i=1:81
for j=1:81
   if 0.7225*(i-41)*(i-41)+(j-41)*(j-41)>400
   r=0.050*sqrt(0.7225*(i-41)*(i-41)+(j-41)*(j-41));
   Z(i,j)=c*log(r)+0.05*0.85*(i-41)*(1-(1/(r*r)));
   end
end
end

contour(x,y,Z,v)

text(-0.2,-1.9,' c','fontsize',15)
text(-0.2,-1.95,'    1','fontsize',12)
text(-0.2,-2.15,'Ua','fontsize',15)
text(-0.2,-1.95,'__','fontsize',15)
text(-0.2,-2,'      = 2','fontsize',15)



hold off