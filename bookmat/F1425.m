a=(2*pi)/360;
th=(0:0.25:360);
r=7+1.5.*sin(2.*a.*th)+cos(a.*th)+0.5.*sin(4.*a.*th);
x=r.*cos(a.*th);
y=r.*sin(a.*th);
plot(x,y,'linewidth',1.5)
axis off
hold on

a=(2*pi)/360;
th=(0:0.25:360);
r=7+1.5.*sin(2.*a.*th)+cos(a.*th)+0.5.*sin(4.*a.*th);
x=20+r.*cos(a.*th);
y=r.*sin(a.*th);
plot(x,y,'linewidth',1.5)


a=(2*pi)/360;
th=(20:0.25:190);
r=7+1.5.*sin(2.*a.*th)+cos(a.*th)+0.5.*sin(4.*a.*th);
x=20+r.*cos(a.*th);
y=-0.3+r.*sin(a.*th);
plot(x,y,'linewidth',1.5)

b=-6.5;
c=-4.5;
d=-0.58;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)



b=-4.5;
c=-6;
d=1.53;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)


b=-2.5;
c=-6.65;
d=5.3;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)


b=-0.5;
c=-7;
d=6.9;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)


b=1.5;
c=-6.85;
d=7.25;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)


b=3.5;
c=-5.5;
d=7.3;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)


b=5.5;
c=-2.85;
d=6.95;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)

b=7.5;
c=-0.8;
d=5.9;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)







b=13.5;
c=-4.5;
d=-0.58;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)



b=15.5;
c=-6;
d=1.53;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)


b=17.5;
c=-6.65;
d=5.3;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)


b=19.5;
c=-7;
d=6.9;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)


b=21.5;
c=-6.85;
d=7.25;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)


b=23.5;
c=-5.5;
d=7.3;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)


b=25.5;
c=-2.85;
d=6.95;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)

b=27.5;
c=-0.8;
d=5.9;
q=[b b];
r=[c d];
line(q,r,'linewidth',0.8)

up=sprintf('%c',173);
text(27.15,3.3,up,'fontname','symbol','fontweight','bold','fontsize',12)
text(25.15,3.9,up,'fontname','symbol','fontweight','bold','fontsize',12)
text(23.15,4.1,up,'fontname','symbol','fontweight','bold','fontsize',12)
text(21.15,3.6,up,'fontname','symbol','fontweight','bold','fontsize',12)
text(19.15,1.8,up,'fontname','symbol','fontweight','bold','fontsize',12)
text(17.15,0,up,'fontname','symbol','fontweight','bold','fontsize',12)
text(15.15,-1.3,up,'fontname','symbol','fontweight','bold','fontsize',12)
text(13.15,-3.1,up,'fontname','symbol','fontweight','bold','fontsize',12)

rdot=sprintf('%c',183);
text(28.4,2.4,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(12.3,-2.5,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(8.4,2.4,rdot,'fontname','symbol','fontweight','bold','fontsize',20)
text(-7.7,-2.5,rdot,'fontname','symbol','fontweight','bold','fontsize',20)


text(-4,-8,'u=u  (x)','fontsize',20)
text(-4,-8.4,'         B','fontsize',15)
text(-4,8.5,'u=u  (x)','fontsize',20)
text(-4,8.1,'         T','fontsize',15)
text(-2,-9.5,'(a)','fontsize',20)

text(16,-8,'u=u  (x)','fontsize',20)
text(16,-8.4,'         B','fontsize',15)
text(16,8.5,'u=u  (x)','fontsize',20)
text(16,8.1,'         T','fontsize',15)
text(18,-9.5,'(b)','fontsize',20)

hold off
