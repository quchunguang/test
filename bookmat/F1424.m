q=[0 1];
r=[0 0];
line(q,r)

axis off
hold on


q=[2 3];
r=[0 0];
line(q,r)


q=[1 1];
r=[0 2];
line(q,r)


q=[2 2];
r=[0 3];
line(q,r)

q=[3 3];
r=[0 2];
line(q,r)

q=[0 0];
r=[0 3];
line(q,r)



x=0:.01:1;
y=3.*exp(x.*x);
plot(x,y,'linewidth',1.5);

x=0:.01:1;
y=2.*exp(x.*x-1);
plot(x,y,'linewidth',1.5);

eps=0.02
x=2:.01:3;
y=3.*exp((x-2).*(x-2))-(3.*exp(1)-2).*exp((x-3)./eps);
plot(x,y,'linewidth',1.5);




text(-.02,-.2,'0','fontsize',20)
text(1.98,-.2,'0','fontsize',20)
text(0.98,-.2,'1','fontsize',20)
text(2.98,-.2,'1','fontsize',20)

text(0.5,-.2,'(a)','fontsize',20)
text(2.5,-.2,'(b)','fontsize',20)

text(-.1,3,'3','fontsize',20)
text(1.9,3,'3','fontsize',20)
text(1.1,2,'2','fontsize',20)
text(3.1,2,'2','fontsize',20)

text(.1,6,'3 exp(x  )','fontsize',20)
text(.1,6.2,'                2','fontsize',15)

text(.1,1.5,'2 e  exp(x  )','fontsize',20)
text(.1,1.7,'      -1            2','fontsize',15)

rdot=sprintf('%c',183)
text(-.02,3,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(.98,2,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(1.98,3,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(2.98,2,rdot,'fontname','symbol','fontweight','bold','fontsize',20)


hold off