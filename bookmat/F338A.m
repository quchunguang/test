

n=201
m=3
for i=1:m 
 for j=1:n
 x=(j-1)/(n-1);
 C(i,j)=(200/(i*pi))*(1-cos(i*pi))*sin(i*pi*x);
  end
  end
y3=sum(C);


n=201
m=5
for i=1:m 
 for j=1:n
 x=(j-1)/(n-1);
 B(i,j)=(200/(i*pi))*(1-cos(i*pi))*sin(i*pi*x);
  end
  end
y5=sum(B);

n=201
m=7
for i=1:m 
 for j=1:n
 x=(j-1)/(n-1);
 D(i,j)=(200/(i*pi))*(1-cos(i*pi))*sin(i*pi*x);
  end
  end
y7=sum(D);

x1=(0:1/200:1);
y1=(200/pi).*(1-cos(pi)).*sin(pi.*x1);
y2=100+x1-x1;
plot(x1,y2,'--')
hold on

plot(x1,y1,'linewidth',1.5)
plot(x1,y3,'linewidth',1.5)
plot(x1,y5,'linewidth',1.5)
plot(x1,y7,'linewidth',1.5)


q=[0 1];
r=[0 0];
line(q,r,'linewidth',1.5)
q=[0 0];
r=[0 130];
line(q,r,'linewidth',1.5)
text(0.5,-10,'x/L')

text(0.5,135,'1')
text(0.73,125,'3')
text(0.83,125,'5')
text(0.90,120,'7')
hold off