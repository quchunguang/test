!碾转相除法：如27和6，先用27除以6，余数为3。再用6除以3，余数为零，即3为最大公约数。
read *, m,n
if(m.lt.n) then
	k=m; m=n; n=k
end if
k=mod(m,n)
do while (k/=0)
	m=n; n=k; k=mod(m,n)
end do
print *, '最大公约数＝',n
end