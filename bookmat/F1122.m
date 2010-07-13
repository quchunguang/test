
subplot(1,2,1)

q=[0 10];
r=[0 0];
s=[0 0];
line(q,r,s,'linewidth',1.5)

view(37.5,20)


q=[2 2];
r=[0 10];
s=[0 0];
line(q,r,s,'linewidth',1.5)

q=[6 6];
r=[0 10];
s=[0 0];
line(q,r,s,'linewidth',1.5)

text(2,0,-0.5,'0','fontsize',10)
text(6,0,-0.5,'1','fontsize',10)
text(8,2,0,'w=0','fontsize',10)
text(0,2,0,'w=0','fontsize',10)

axis([0 10 0 10 0 10])
axis off
hold on

subplot(1,2,2)


q=[0 10];
r=[0 0];
s=[0 0];
line(q,r,s,'linewidth',1.5)

view(37.5,20)

q=[2 6];
r=[0 0];
s=[0 1];
line(q,r,s,'linewidth',1.5)

q=[6 6];
r=[0 0];
s=[0 1];
line(q,r,s,'linewidth',1.5)



q=[2 2];
r=[0 10];
s=[0 0];
line(q,r,s,'linestyle','--')

q=[6 6];
r=[0 10];
s=[0 0];
line(q,r,s,'linestyle','--')

q=[0 2];
r=[3 3];
s=[0 0];
line(q,r,s,'linewidth',1.5)

q=[6 10];
r=[3 3];
s=[0 0];
line(q,r,s,'linewidth',1.5)


q=[6 6];
r=[3 3];
s=[0 1];
line(q,r,s,'linewidth',1.5)

q=[2 6];
r=[3 3];
s=[0 1];
line(q,r,s,'linewidth',1.5)


q=[0 2];
r=[6 6];
s=[0 0];
line(q,r,s,'linewidth',1.5)

q=[6 10];
r=[6 6];
s=[0 0];
line(q,r,s,'linewidth',1.5)


q=[6 6];
r=[6 6];
s=[0 1];
line(q,r,s,'linewidth',1.5)

q=[2 6];
r=[6 6];
s=[0 1];
line(q,r,s,'linewidth',1.5)


q=[0 2];
r=[9 9];
s=[0 0];
line(q,r,s,'linewidth',1.5)

q=[6 10];
r=[9 9];
s=[0 0];
line(q,r,s,'linewidth',1.5)


q=[6 6];
r=[9 9];
s=[0 1];
line(q,r,s,'linewidth',1.5)

q=[2 6];
r=[9 9];
s=[0 1];
line(q,r,s,'linewidth',1.5)

text(2,0,-0.5,'0','fontsize',10)
text(6,0,-0.5,'1','fontsize',10)

text(10.2,0,0,'t=0','fontsize',10)
text(10.2,3,0,'t=1','fontsize',10)
text(10.2,6,0,'t=2','fontsize',10)
text(10.2,9,0,'t=3','fontsize',10)


axis([0 10 0 10 0 10])
axis off
hold on

hold off


