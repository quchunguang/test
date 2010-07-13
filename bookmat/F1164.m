for i=1:6
x=-4:.1:8;
y=x./2+(2/5)*(i-1);
y2=(x-4)./8+(2/20)*(i-6)+0.5;
y8=(0.125+(0.375/25)*(i-1)*(i-1)).*x;
y9=x-x;
plot(x,y,x,y2,x,y8,x,y9);
axis([-4 8 0 1])
axis off
hold on
end

x=-4:.1:8;
y3=x./2;
y4=x./8;
plot(x,y3,x,y4,'linewidth',1.5);

text(-1.5,.1,'x=0','fontsize',20)
text(2.5,1,'x=6t','fontsize',20)
text(6,.7,'x=8t','fontsize',20)

hold off