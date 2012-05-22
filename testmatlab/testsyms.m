syms x1 x2;
P1=3390-0.1*x1-0.03*x2;
P2=3990-0.04*x1-0.1*x2;
R=P1.*x1+P2.*x2;
C=400000+1950*x1+2250*x2;
P=R-C;
%[x,fval] = fminsearch(P,[0, 10000])
x1=1
x2=2
eval(P)
