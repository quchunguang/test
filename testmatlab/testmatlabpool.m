%matlabpool local 4
%matlabpool close
function testmatlabpool

runtimes = 1e9;
dummy1   = 0;
dummy2   = 0;

tic
%for x= 1:runtimes;
parfor x= 1:runtimes;
    dummy1 = dummy1 + x;
    dummy2 = 2 * x + 1;
end
toc
%plot([1 2], [dummy1, dummy2]);