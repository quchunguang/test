for x2=1:51 
     f5(x2)=25.*exp(-0.02.*(x2-26).*(x2-26));
      g(x2)=-f5(x2);
end

x=4.5:.15:12;
plot(x,g,'linewidth',1.5)

axis off
hold on 

x4=12:.15:19.5;
plot(x4,f5,'linewidth',1.5)

x3=34.5:.15:42;
plot(x3,g,'linewidth',1.5)
x3=42:.15:49.5;
plot(x3,f5,'linewidth',1.5)

x3=64.5:.15:72;
plot(x3,g,'linewidth',1.5)
x3=72:.15:79.5;
plot(x3,f5,'linewidth',1.5)

q=[0 94.5];
r=[0 0];
line(q,r,'linewidth',1.5)

q=[42 57];
r=[0 0];
line(q,r,'linewidth',3.0)

text(10,-2,'-2L','fontsize',15)
text(26,-2,'-L','fontsize',15)
text(40,-2,'x=0','fontsize',15)
text(55,-2,'x=L','fontsize',15)
text(71,-2,'2L','fontsize',15)
text(86,-2,'3L','fontsize',15)

hold off

