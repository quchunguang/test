% bench

function [x, y]=ntu1(a)
b=a(:);
c=sort(b);
x=c(1:3);
for i=1:3
    y(i)=find(a==x(i));
end