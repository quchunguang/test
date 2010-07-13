t=(-2:1/100:3);
x=t-2.*(t-.7)./(1+abs(t-.7).^2.5);
y=1./(1+t.*t);
plot(x,y,'linewidth',1.5)

axis off
hold on

q=[-2 3];
r=[0 0];
line(q,r,'linewidth',1.5)

q=[.65 .65];
r=[.27 .9];
line(q,r,'linewidth',1.5)

rdot=sprintf('%c',183)
text(.62,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

text(.5,-0.1,'x  (t)','fontsize',20)
text(.5,-0.11,'   s','fontsize',15)

hold off










