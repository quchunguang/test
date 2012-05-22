s = dsolve('Dy = -y/sqrt(1-t^2)')
figure
hold on

for i=0:10:30
f = subs(s,'C2',i);
ezplot(f,[-1,1])
end
