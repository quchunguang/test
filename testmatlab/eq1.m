function xdot = eq1(t,x);
%创建数组储存数据
xdot = zeros(2,1);
xdot(1) = x(2);
xdot(2) = sin(4.3*t)-16*x(1);
