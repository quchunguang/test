%%%%
v=[1 2 3 4 5];
sum(v);
cumsum(v);

%%%% Markov chain
A=[0.6 0.3;0.4 0.7];
sum(A)  % MUST be [1 1 ...]
pq=zeros(2,16);
pq(1,1)=1;
for i=1:15
    pq(:,i+1)=A*pq(:,i);
end
n=(1:16)';
plot(n,pq(1,:),'o-',n,pq(2,:),'*-');