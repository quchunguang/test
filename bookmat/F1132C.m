axis off

q=[50 50];
r=[0 60];
line(q,r,'linestyle','--')

q=[0 100];
r=[5 5];
line(q,r,'linewidth',1.5)

q=[15 45];
r=[10 10];
line(q,r,'linewidth',1.5)

q=[55 85];
r=[10 10];
line(q,r,'linewidth',1.5)

q=[0 100];
r=[25 25];
line(q,r,'linewidth',1.5)

q=[45 45];
r=[5 10];
line(q,r,'linewidth',1.5)

q=[55 55];
r=[5 10];
line(q,r,'linewidth',1.5)

q=[15 15];
r=[5 10];
line(q,r,'linewidth',1.5)

q=[85 85];
r=[5 10];
line(q,r,'linewidth',1.5)

q=[25 45];
r=[30 30];
line(q,r,'linewidth',1.5)

q=[55 75];
r=[30 30];
line(q,r,'linewidth',1.5)

q=[45 55];
r=[35 35];
line(q,r,'linewidth',1.5)

q=[55 55];
r=[30 35];
line(q,r,'linewidth',1.5)

q=[45 45];
r=[30 35];
line(q,r,'linewidth',1.5)

q=[25 25];
r=[25 30];
line(q,r,'linewidth',1.5)

q=[75 75];
r=[25 30];
line(q,r,'linewidth',1.5)

q=[45 45];
r=[25 30];
line(q,r,'linestyle','--')

q=[55 55];
r=[25 30];
line(q,r,'linestyle','--')

q=[45 55];
r=[30 30];
line(q,r,'linestyle','--')

q=[0 100];
r=[45 45];
line(q,r,'linewidth',1.5)

q=[35 65];
r=[50 50];
line(q,r,'linewidth',1.5)

q=[35 65];
r=[55 55];
line(q,r,'linewidth',1.5)

q=[65 65];
r=[45 55];
line(q,r,'linewidth',1.5)

q=[35 35];
r=[45 55];
line(q,r,'linewidth',1.5)

text(92,47,'t=0','fontsize',20)
text(92,27,'0<t<h/c','fontsize',20)
text(92,7,'t>h/c','fontsize',20)

text(10,3,'-h-ct','fontsize',20)
text(37,3,'h-ct','fontsize',20)
text(52,3,'-h+ct','fontsize',20)
text(80,3,'h+ct','fontsize',20)

text(18,23,'-h-ct','fontsize',20)
text(35,23,'-h+ct','fontsize',20)
text(52,23,'h-ct','fontsize',20)
text(72,23,'h+ct','fontsize',20)

text(33,43,'-h','fontsize',20)
text(65,43,'h','fontsize',20)

text(45,55,'1','fontsize',20)
text(46,11,'1/2','fontsize',20)

right=sprintf('%c',174);
left=sprintf('%c',172);
text(85,7.5,right,'fontname','symbol','fontweight','bold','fontsize',15)
text (12,7.5,left,'fontname','symbol','fontweight','bold','fontsize',15)

text(75,27.5,right,'fontname','symbol','fontweight','bold','fontsize',15)
text (22,27.5,left,'fontname','symbol','fontweight','bold','fontsize',15)

text(65,47.5,right,'fontname','symbol','fontweight','bold','fontsize',15)
text (32,47.5,left,'fontname','symbol','fontweight','bold','fontsize',15)

hold off


