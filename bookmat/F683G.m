n=1
m=0
z01=2.40483
x=-1:0.025:1;
y=-1:0.025:1;
[X,Y]=meshgrid(x,y);

U=bessel(m,z01.*sqrt(X.*X+Y.*Y));
for i=1:81
for j=1:81
         if (i-41)*(i-41)+(j-41)*(j-41)>1600
         U(i,j)=0;
         end    
         if (i-41)*(i-41)+(j-41)*(j-41)>1700
         U(i,j)=nan;
         end    
end
end
mesh(x,y,U)
axis off
text(-1,.75,.4,'n=1')
text(-1,.75,.5,'m=0')