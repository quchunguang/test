p=[0 0 0 0 0 0
1 -3 -3 -1 0 0
0 0 3 0 -3 0
0 1 1 -1 0 2
0 3 1 0 1 0
-3 0 0 1 -1 0
1 0 -3 0 -3 2
0 -2 3 -1 0 1];

t=[0 0 0 0 0 0
1 0 0 0 0 0
0 1 0 0 0 0
0 0 1 0 0 0
0 0 0 1 0 0
0 0 0 0 1 0
0 0 0 0 0 1
0 0 0 0 0 0];

a=[6,9,7];
for i=1:3
net=newff(minmax(p),[a(i),8],{'tansig' 'purelin'},'trainlm');

net.trainParam.lr=0.01;
net.trainParam.epochs=5000;
net.trainParam.goal=0.001;
net=train(net,p,t);

s=[0 1 0 1 0 -3 1 0]';
y=sim(net,s)
end