clear;clc 
fmin=[0;-1;2;0;0]; %min z= -x(2)+2x(3) 
Aeq = [1 -2 1 0 0  %s.t.x(1)-2x(2)+x(3)=2 
0 1 -3 1 0         %x(2)-3x(3)+x(4)=1 
0 1 -1 0 1];       %x(2)-x(3) +x(5)=2
beq=[2;1;2];

st=[0 0 0 0 0]; 
b=0; 
lb=zeros(5,1); 
[x,fval,exitflag,output,lambda]=linprog(fmin,st,b,Aeq,beq,lb)