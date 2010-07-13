axis off

q=[0 0]
r=[0 1]
line(q,r)

q=[-10 10]
r=[0 0]
line(q,r)

q=[-10 9]
r=[.5 .5]
line(q,r,'linestyle','--')
text(9.1,.5,'t>h/c','fontsize',20)

q=[-10 9]
r=[.1 .1]
line(q,r,'linestyle','--')
text(9.1,.1,'t<h/c','fontsize',20)

q=[-3 5]
r=[0 .8]
line(q,r,'linewidth',1.5)

q=[3 10]
r=[0 .7]
line(q,r,'linewidth',1.5)

q=[-3 -10]
r=[0 .7]
line(q,r,'linewidth',1.5)

q=[3 -5]
r=[0 .8]
line(q,r,'linewidth',1.5)

q=[2 5]
r=[0 .3]
line(q,r,'linewidth',1.5,'linestyle','--')

q=[5 8]
r=[.3 0]
line(q,r,'linewidth',1.5,'linestyle','--')

text(4.6,.33,'(x ,t )','fontsize',20)
text(4.6,.31,'      0    0','fontsize',10)

text(-10,0.75,'x+ct=-h','fontsize',20)
text(8,0.75,'x-ct=h','fontsize',20)
text(-7,0.85,'x+ct=h','fontsize',20)
text(3,0.85,'x-ct=-h','fontsize',20)

text(10.1,0,'x','fontsize',20)
text(0,1.05,'t','fontsize',20)

rdot=sprintf('%c',183)
text(4.8,.3,rdot,'fontname','symbol','fontweight','bold','fontsize',20)

text(-10,.25,'F=0','fontsize',20)
text(8,.25,'F=0','fontsize',20)
text(-10,.15,'G=0','fontsize',20)
text(8,.15,'G=0','fontsize',20)

text(-5,.35,'F=0','fontsize',20)
text(1.5,.35,'F=1/2','fontsize',20)
text(-5,.25,'G=1/2','fontsize',20)
text(1.5,.25,'G=0','fontsize',20)

text(-1.5,.7,'F=0','fontsize',20)
text(-1.5,.6,'G=0','fontsize',20)

text(-1.5,.15,'F=1/2','fontsize',20)
text(-1.5,.05,'G=1/2','fontsize',20)

text(-10,-.05,'F=G=0','fontsize',20)
text(-2,-.05,'F=G=1/2','fontsize',20)
text(6,-.05,'F=G=0','fontsize',20)
text(-3.5,-.05,'-h','fontsize',20)
text(3,-.05,'h','fontsize',20)
hold off