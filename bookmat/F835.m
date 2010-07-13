
x1=(0:1/100:.5);
y1=-2*x1;
plot(x1,y1,'linewidth',1.5)
axis off
hold on

x1=(0.5:1/100:2.0);
y1=-0.666667*(2-x1);
plot(x1,y1,'linewidth',1.5)

q=[0.5 0.5];
r=[-1 0];
line(q,r,'linestyle','--')

q=[0 2];
r=[0 0];
line(q,r,'linewidth',1.5)


text(0,0.05,'0','fontsize',20)

text(2,0.05,'L','fontsize',20)

text(1.5,-0.5,'G(x,x )','fontsize',20)
text(1.71,-0.52,'0','fontsize',15)

text(.5,0.05,'x','fontsize',20)
text(.55,0.03,'0','fontsize',15)

text(.4,-1.05,'(x  ,-x  (L-x  )/L)','fontsize',20)
text(.47,-1.07,'0','fontsize',15)
text(.62,-1.07,'0','fontsize',15)
text(.83,-1.07,'0','fontsize',15)

hold off