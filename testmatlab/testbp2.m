[x,t] = simplefit_dataset;
net = feedforwardnet([10 10])
plot(x,t,'*');
net = train(net,x,t);
%view(net)
%y = net(x);
%perf = perform(net,y,t)
y=net([1:8])