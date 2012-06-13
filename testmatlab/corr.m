x=[13.2 13 14.9 8.2 7.9 25.3 16.0 16.3 7.5];
y=[23   24  21  20  21  39   30   32   9];
[R,P]=corrcoef(x,y)
plot(x,y,'o')

figure;
[X,Y] = meshgrid(-8:.5:8);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
mesh(Z);