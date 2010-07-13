for i=1:10
x=-4:.1:8;
y2=(x-4)./8-(2/20)*(i-10);
plot(x,y2);
axis([-4 8 0 1])
axis off
hold on
end

x=-4:.1:8;
y4=(x-4)./8-(2/20)*(7-10);
plot(x,y4,'linewidth',1.5);

q=[0 0]
r=[0 1]
line(q,r)

q=[-4 8]
r=[0 0]
line(q,r)

text(1.6,-.05,'x','fontsize',20)
text(1.6,-.07,'   0','fontsize',10)

text(6.5,0.55,'(x,t)','fontsize',20)
text(8.1,0,'x','fontsize',20)
text(0,1.05,'t','fontsize',20)

rdot=sprintf('%c',183)
text(1.5,0,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(6.3,0.6,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

hold off