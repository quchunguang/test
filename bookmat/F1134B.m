axis off
hold on

for i=1:6
  s=(1/3)*(i-1)
 q=[-10 -1+s];
 q2=[-1+s 1+s];
 q3=[1+s 10];
  t=[s s];
  u=[1 1]; 
  v=[1 -1];
  w=[-1 -1]; 
  line(q,t,u)
  view(37.5,20)
  line(q2,t,v)
  line(q3,t,w)
end

for i=1:6
  s=(1/3)*(i-1)
 q=[-10 -1+s];
 q2=[-1+s 1+s];
 q3=[1+s 10];
  t=[s s];
  u=[-1 -1]; 
  v=[-1 1];
  w=[1 1]; 
  line(q,t,u)
  view(37.5,20)
  line(q2,t,v)
  line(q3,t,w)
end

for i=1:3
  s=(1/3)*(i-1)
 q=[-10 -1-s];
 q2=[-1-s -1+s];
 q3=[s-1 1-s];
 q4=[1-s 1+s];
 q5=[s+1 10];
  t=[s s];
  u=[0 0]; 
  v=[0 2*s];
  w=[2*s 2*s]; 
  w2=[2*s 0]; 
  w3=[0 0]; 
  line(q,t,u,'linewidth',1.5)
  view(37.5,20)
  line(q2,t,v,'linewidth',1.5)
  line(q3,t,w,'linewidth',1.5)
   line(q4,t,w2,'linewidth',1.5)
  line(q5,t,w3,'linewidth',1.5)
end

text(10.3,0,0,'t=0','fontsize',10)
text(10.3,1/3,0,'0<t=t <h/c','fontsize',10)
text(10.3,1/3,-.05,'        1','fontsize',10)
text(10.3,2/3,0,'t <t=t <h/c','fontsize',10)
text(10.3,2/3,-.05,' 1     2','fontsize',10)
text(10.3,1,0,'t=h/c','fontsize',10)
text(10.3,4/3,0,'h/c<t=t','fontsize',10)
text(10.3,4/3,-.05,'           3','fontsize',10)
text(10.3,5/3,0,'t <t=t','fontsize',10)
text(10.3,5/3,-.05,' 3     4','fontsize',10)

for i=4:6
  s=(1/3)*(i-1)
 q=[-10 -1-s];
 q2=[-1-s 1-s];
 q3=[1-s s-1];
 q4=[s-1 1+s];
 q5=[s+1 10];
  t=[s s];
  u=[0 0]; 
  v=[0 2];
  w=[2 2]; 
  w2=[2 0]; 
  w3=[0 0]; 
  line(q,t,u,'linewidth',1.5)
  view(37.5,20)
  line(q2,t,v,'linewidth',1.5)
  line(q3,t,w,'linewidth',1.5)
   line(q4,t,w2,'linewidth',1.5)
  line(q5,t,w3,'linewidth',1.5)
end

hold off





