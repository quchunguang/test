k=1.33;
xb=-4;

t2=(0:1/100:1);
t3=2.*pi.*t2;
x=cos(t3);
y=sin(t3);
plot(x,y,'linewidth',1.5)
axis([-5.5 2.5 -5 1.1])
axis off
hold on





for i=0:35;
a=i/20;
s=sin(a);
c=cos(a);
ss=s/k;
b=asin(ss);
c2=cos(2*b-a);
s2=sin(2*b-a);
c3=cos(4*b-a);
s3=sin(4*b-a);
c4=cos(4*b-2*a);
s4=sin(4*b-2*a);
yend=-s3+(xb+c3)*(s4/c4);

q=[xb -c];
r=[s s];
line(q,r)

q=[-c c2];
r=[s s2];
line(q,r)

q=[c2 -c3];
r=[s2 -s3];
line(q,r)

q=[-c3 xb];
r=[-s3 yend];
line(q,r)


end







rdot=sprintf('%c',183)
text(0,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(6.3,0.6,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

text(-5.5,0.7,'rays','fontsize',20)
text(-5.5,0.2,'of the sun','fontsize',20)
text(-1.5,-3,'caustic','fontsize',20)
text(-1,1.2,'water droplet','fontsize',20)


hold off