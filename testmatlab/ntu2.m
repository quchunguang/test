function y=ntu2(n)
if n==0, y=1; return; end
if n==1, y=1; return; end

y= ntu2(n-1) + ntu2(n-2);
