% script file example1.m to compute exponential of a set of numbers
function [x fval exitflag] = testga(n)
    if nargin==0
        n=2;
    end
    [x fval exitflag] = ga(@rastriginsfcn, n);
    %[x fval exitflag] = ga(@fitness_fcn, 2);
end
