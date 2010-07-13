x=(0:1/100:11.9);
y=bessel(0,x);
y1=bessel(1,x);
y2=0+x-x;
subplot(1,2,1), plot(x,y,x,y2,x,y1)
axis([0 12 -1.0 1.0])

text(2,0.9,'J (z)')
text (2.4,0.875,'0','fontsize',6)

text(4,0.5,'J (z)')
text (4.4,0.475,'1','fontsize',6)


xlabel('z') 










x=(0.1:1/100:11.9);
y=bessely(0,x);
y1=bessely(1,x);
y2=0+x-x;
subplot(1,2,2), plot(x,y,x,y2,x,y1)
axis([0 12 -1.0 1.0])


text(2,0.6,'Y (z)')
text (2.35,0.575,'0','fontsize',6)

text(2,-0.4,'Y (z)')
text (2.35,-0.425,'1','fontsize',6)


xlabel('z') 



















