n=1
m=3
% the first zero of the Bessel function of order three is approximately 6.38 and it can be found by plotting the Bessel function or using the Handbook of Mathematical Functions edited by Abramowitz and Stegun 
z35=6.38
x=-1:0.025:1;
y=-1:0.025:1;
[X,Y]=meshgrid(x,y);

U=bessel(m,z35.*sqrt(X.*X+Y.*Y)).*sin(m.*atan2(Y,X));
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
meshc(x,y,U)
axis off
text(-1,.75,.4,'n=1')
text(-1,.75,.5,'m=3')