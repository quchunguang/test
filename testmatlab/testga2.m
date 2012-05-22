% Integer value ga

lb = [5*pi,-20*pi];
ub = [20*pi,-4*pi];
opts = gaoptimset('PlotFcns',@gaplotbestf);
IntCon = 1;
[x,fval,exitflag] = ga(@rastriginsfcn,2,[],[],[],[],...
    lb,ub,[],IntCon,opts)