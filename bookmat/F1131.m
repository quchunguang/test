for i=1:7
x=-5:.1:5;
y2=(x-4)./8-(2/20)*(i-10);
y3=(-x-4)./8-(2/20)*(i-10);
plot(x,y2,x,y3,'linewidth',1.5);
axis([-5 5 0 1])
axis off
hold on
end

q=[0 0]
r=[0 1]
line(q,r,'linewidth',1.5)

axis([-6 6 0 1])
q=[-6 6]
r=[0 0]
line(q,r,'linewidth',1.5)

text(-2.4,-.05,'a','fontname','symbol','fontweight','bold','fontsize',20)
text(2.25,-.05,'b','fontname','symbol','fontweight','bold','fontsize',20)

text(5.1,0.95,'x-ct=','fontsize',20)
text(-6.5,0.95,'x+ct=','fontsize',20)
text(6.6,.95,'a','fontname','symbol','fontweight','bold','fontsize',20)
text(-5.0,.95,'b','fontname','symbol','fontweight','bold','fontsize',20)

text(6.1,0,'x','fontsize',20)
text(0,1.05,'t','fontsize',20)

rdot=sprintf('%c',183)
text(2.25,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(-2.5,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

hold off