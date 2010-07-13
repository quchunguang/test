n=6
m=0
x=0:0.01:0.99;
y=0:0.01:0.99;
[X,Y]=meshgrid(x,y);
U=sin(-m.*pi.*X+n.*pi.*Y);
meshc(U)
axis off
