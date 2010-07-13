

t=0;
x=0:0.02:1;
u=100+x-x;
t1=x-x;
plot3(x,t1,u)
xlabel('x')
zlabel('u(x,t)')
text(0,.575,100,'- infinite series')
text (0,.575,90,'-- first term')
text(-.4,0.2,0,' kt(  /L)')
text(-.33,0.2,0,'p','fontname','symbol','fontweight','bold')
text(-.33,0.22,0,'        2')
hold on

q=[0 0]
r=[0 0]
s=[0 100]
line(q,r,s)


q=[1 1]
r=[0 0]
s=[0 100]
line(q,r,s)

t=0.1;
u=zeros(51);
x=0:0.02:1.00;
x1=1+50.*x;
t1=t+x-x;
u2=100.*(2/(pi)).*(1-cos(pi)).*sin(pi.*x).*exp(-t);
for i=1:11
u(x1)=u(x1)+100.*(2/(i*pi)).*(1-cos(i*pi)).*sin(i.*pi.*x).*exp(-i*i.*t);
end
plot3(x,t1,u,x,t1,u2,'--')



t=0.2;
u=zeros(51);
x=0:0.02:1.00;
x1=1+50.*x;
t1=t+x-x;
u2=100.*(2/(pi)).*(1-cos(pi)).*sin(pi.*x).*exp(-t);
for i=1:11
u(x1)=u(x1)+100.*(2/(i*pi)).*(1-cos(i*pi)).*sin(i.*pi.*x).*exp(-i*i.*t);
end
plot3(x,t1,u,x,t1,u2,'--')


t=0.3;
u=zeros(51);
x=0:0.02:1.00;
x1=1+50.*x;
t1=t+x-x;
u2=100.*(2/(pi)).*(1-cos(pi)).*sin(pi.*x).*exp(-t);
for i=1:11
u(x1)=u(x1)+100.*(2/(i*pi)).*(1-cos(i*pi)).*sin(i.*pi.*x).*exp(-i*i.*t);
end
plot3(x,t1,u,x,t1,u2,'--')


t=0.4;
u=zeros(51);
x=0:0.02:1.00;
x1=1+50.*x;
t1=t+x-x;
u2=100.*(2/(pi)).*(1-cos(pi)).*sin(pi.*x).*exp(-t);
for i=1:5
u(x1)=u(x1)+100.*(2/(i*pi)).*(1-cos(i*pi)).*sin(i.*pi.*x).*exp(-i*i.*t);
end
plot3(x,t1,u,x,t1,u2,'--')


t=0.5;
u=zeros(51);
x=0:0.02:1.00;
x1=1+50.*x;
t1=t+x-x;
u2=100.*(2/(pi)).*(1-cos(pi)).*sin(pi.*x).*exp(-t);
for i=1:5
u(x1)=u(x1)+100.*(2/(i*pi)).*(1-cos(i*pi)).*sin(i.*pi.*x).*exp(-i*i.*t);
end
plot3(x,t1,u,x,t1,u2,'--')


hold off