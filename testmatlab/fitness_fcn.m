% y=(x1-2000).^2+(x2-2000).^2
function y=fitness_fcn(pop)
    a=[-2000, -2000];
    y = sum((pop+a).^2);
end