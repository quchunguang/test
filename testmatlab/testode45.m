[t,x] = ode45('eq1',[0 2*pi],[0,0]);
plot(t,x(:,1),t,x(:,2),'--'),xlabel('t'), axis([0 2*pi -3 3])
figure
plot(x(:,1),x(:,2)),xlabel('x1'),ylabel('x2')
