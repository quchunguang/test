x=(0.02:1/100:2.99);
y=besseli(0,x);
y2=besseli(1,x);
y3=besselk(0,x);
y4=besselk(1,x);

 plot(x,y,x,y2,x,y3,x,y4)
axis([0 3 0 2.5])
xlabel('w')

text(1.5,2.05,'I (w)')
text (1.52,2.02,'0','fontsize',6)

text(2.3,1.65,'I (w)')
text (2.32,1.62,'1','fontsize',6)

text(.3,.65,'K (w)')
text (.36,.62,'0','fontsize',6)

text(1.5,.45,'K (w)')
text (1.56,.42,'1','fontsize',6)




















