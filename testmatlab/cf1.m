function [O,H]=cf1(O1,H1,N)
N=30;
O=size(1,N);
H=size(1,N);
O(1)=O1;H(1)=H1;
for n=1:N-1
    O(n+1) = 1.2*O(n)-0.001*O(n)*H(n);
    H(n+1) = 1.3*H(n)-0.002*O(n)*H(n);
end
end